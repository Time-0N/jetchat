#!/usr/bin/env bash
set -euo pipefail
# ----------------------------------------------------------
#  Load Zitadel dump into a RUNNING instance
#  (no volume destroy, no downtime for Postgres)
# ----------------------------------------------------------
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

DUMP_FILE="./dev-data/zitadel_dev_dump.sql"   # produced by your dump script (no --create)

if [[ ! -f "$DUMP_FILE" ]]; then
  echo -e "${RED}❌ Dump file not found: $DUMP_FILE${NC}"
  exit 1
fi

echo -e "${YELLOW}🔄 Loading Zitadel dump into running database…${NC}"

# 1. Stop Zitadel (keeps Postgres up)
echo -e "${YELLOW}⏸️  Stopping Zitadel container (Postgres keeps running)${NC}"
docker compose stop zitadel

# 2. Drop & recreate the zitadel DB (+ load dump) in one shot
echo -e "${YELLOW}🗑️  Dropping / re-creating schema and data${NC}"
docker compose exec -T db psql -U postgres -v ON_ERROR_STOP=1 <<EOF
-- disconnect existing sessions
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'zitadel' AND pid <> pg_backend_pid();

DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
\i /docker-entrypoint-initdb.d/02-dev-data/zitadel_dev_dump.sql
EOF

# 3. Start Zitadel again (health-check will re-run)
echo -e "${YELLOW}▶️  Starting Zitadel${NC}"
docker compose start zitadel

# 4. Wait until Zitadel reports healthy
echo -e "${YELLOW}⏳ Waiting for Zitadel to be ready…${NC}"
until docker compose exec zitadel /app/zitadel ready >/dev/null 2>&1; do
  sleep 2
done

echo -e "${GREEN}✅ Zitadel is up and dump has been applied.${NC}"
echo -e "${YELLOW}🌍 UI: http://localhost:8080  |  Login v2: http://localhost:3000/ui/v2/login${NC}"