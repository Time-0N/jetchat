#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🔄 Dumping Zitadel development data...${NC}"

# Create dev-data directory if it doesn't exist
mkdir -p ./dev-data

# Get the postgres container name
POSTGRES_CONTAINER=$(docker-compose ps -q db)

if [ -z "$POSTGRES_CONTAINER" ]; then
    echo -e "${RED}❌ Error: PostgreSQL container not found. Make sure your docker-compose is running.${NC}"
    exit 1
fi

# Check if Zitadel is ready
echo -e "${YELLOW}🔍 Checking if Zitadel is ready...${NC}"
if ! docker-compose exec zitadel /app/zitadel ready > /dev/null 2>&1; then
    echo -e "${RED}❌ Error: Zitadel is not ready. Please wait for it to start up completely.${NC}"
    exit 1
fi

# Dump the database
echo -e "${YELLOW}📦 Creating database dump...${NC}"
docker-compose exec -T db pg_dump -U postgres --clean --if-exists --no-owner --no-privileges zitadel > ./dev-data/zitadel_dev_dump.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Successfully dumped Zitadel data to ./dev-data/zitadel_dev_dump.sql${NC}"

    # Show some info about the dump
    DUMP_SIZE=$(du -h ./dev-data/zitadel_dev_dump.sql | cut -f1)
    DUMP_LINES=$(wc -l < ./dev-data/zitadel_dev_dump.sql)

    echo -e "${GREEN}📊 Dump info:${NC}"
    echo -e "   Size: $DUMP_SIZE"
    echo -e "   Lines: $DUMP_LINES"
    echo -e "   File: ./dev-data/zitadel_dev_dump.sql"
    echo ""
    echo -e "${YELLOW}💡 Tip: Now you can run 'docker-compose down && docker-compose up' to test the restore!${NC}"
else
    echo -e "${RED}❌ Error: Failed to dump database${NC}"
    exit 1
fi