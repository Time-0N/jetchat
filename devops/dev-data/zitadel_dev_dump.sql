--
-- PostgreSQL database dump
--

\restrict PVcsfMWH5w6LZlJYoh3rd2bOVZAGIM4pSdzqAB0US8fJFyDYpGffxkS6zLpdRPv

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY queue.river_client_queue DROP CONSTRAINT IF EXISTS river_client_queue_river_client_id_fkey;
ALTER TABLE IF EXISTS ONLY projections.sms_configs3_twilio DROP CONSTRAINT IF EXISTS fk_twilio_ref_sms_configs3;
ALTER TABLE IF EXISTS ONLY projections.smtp_configs5_smtp DROP CONSTRAINT IF EXISTS fk_smtp_ref_smtp_configs5;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_saml DROP CONSTRAINT IF EXISTS fk_saml_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.apps7_saml_configs DROP CONSTRAINT IF EXISTS fk_saml_configs_ref_apps7;
ALTER TABLE IF EXISTS ONLY projections.keys4_public DROP CONSTRAINT IF EXISTS fk_public_ref_keys4;
ALTER TABLE IF EXISTS ONLY projections.keys4_private DROP CONSTRAINT IF EXISTS fk_private_ref_keys4;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_oidc DROP CONSTRAINT IF EXISTS fk_oidc_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.apps7_oidc_configs DROP CONSTRAINT IF EXISTS fk_oidc_configs_ref_apps7;
ALTER TABLE IF EXISTS ONLY projections.idps3_oidc_config DROP CONSTRAINT IF EXISTS fk_oidc_config_ref_idps3;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_oauth2 DROP CONSTRAINT IF EXISTS fk_oauth2_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.users14_notifications DROP CONSTRAINT IF EXISTS fk_notifications_ref_users14;
ALTER TABLE IF EXISTS ONLY projections.users14_machines DROP CONSTRAINT IF EXISTS fk_machines_ref_users14;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_ldap2 DROP CONSTRAINT IF EXISTS fk_ldap2_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_jwt DROP CONSTRAINT IF EXISTS fk_jwt_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.idps3_jwt_config DROP CONSTRAINT IF EXISTS fk_jwt_config_ref_idps3;
ALTER TABLE IF EXISTS ONLY projections.users14_humans DROP CONSTRAINT IF EXISTS fk_humans_ref_users14;
ALTER TABLE IF EXISTS ONLY projections.smtp_configs5_http DROP CONSTRAINT IF EXISTS fk_http_ref_smtp_configs5;
ALTER TABLE IF EXISTS ONLY projections.sms_configs3_http DROP CONSTRAINT IF EXISTS fk_http_ref_sms_configs3;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_google DROP CONSTRAINT IF EXISTS fk_google_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_gitlab_self_hosted DROP CONSTRAINT IF EXISTS fk_gitlab_self_hosted_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_gitlab DROP CONSTRAINT IF EXISTS fk_gitlab_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_github DROP CONSTRAINT IF EXISTS fk_github_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_github_enterprise DROP CONSTRAINT IF EXISTS fk_github_enterprise_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.executions1_targets DROP CONSTRAINT IF EXISTS fk_executions1_targets_execution;
ALTER TABLE IF EXISTS ONLY projections.keys4_certificate DROP CONSTRAINT IF EXISTS fk_certificate_ref_keys4;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_azure DROP CONSTRAINT IF EXISTS fk_azure_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_apple DROP CONSTRAINT IF EXISTS fk_apple_ref_idp_templates6;
ALTER TABLE IF EXISTS ONLY projections.apps7_api_configs DROP CONSTRAINT IF EXISTS fk_api_configs_ref_apps7;
ALTER TABLE IF EXISTS cache.string_keys DROP CONSTRAINT IF EXISTS fk_object;
DROP TRIGGER IF EXISTS truncate_user_counts ON projections.users14;
DROP TRIGGER IF EXISTS truncate_project_counts ON projections.projects4;
DROP TRIGGER IF EXISTS truncate_password_expiry_policy_counts ON projections.password_age_policies2;
DROP TRIGGER IF EXISTS truncate_password_complexity_policy_counts ON projections.password_complexity_policies2;
DROP TRIGGER IF EXISTS truncate_organization_counts ON projections.orgs1;
DROP TRIGGER IF EXISTS truncate_login_policy_counts ON projections.login_policies5;
DROP TRIGGER IF EXISTS truncate_lockout_policy_counts ON projections.lockout_policies3;
DROP TRIGGER IF EXISTS truncate_identity_provider_ldap_counts ON projections.idp_templates6_ldap2;
DROP TRIGGER IF EXISTS truncate_identity_provider_counts ON projections.idps3;
DROP TRIGGER IF EXISTS truncate_iam_admin_counts ON projections.instance_members4;
DROP TRIGGER IF EXISTS truncate_execution_target_counts ON projections.executions1_targets;
DROP TRIGGER IF EXISTS truncate_execution_counts ON projections.executions1;
DROP TRIGGER IF EXISTS truncate_action_v1_counts ON projections.actions3;
DROP TRIGGER IF EXISTS delete_parent_counts_trigger ON projections.orgs1;
DROP TRIGGER IF EXISTS delete_parent_counts_trigger ON projections.instances;
DROP TRIGGER IF EXISTS count_user ON projections.users14;
DROP TRIGGER IF EXISTS count_project ON projections.projects4;
DROP TRIGGER IF EXISTS count_password_expiry_policy ON projections.password_age_policies2;
DROP TRIGGER IF EXISTS count_password_complexity_policy ON projections.password_complexity_policies2;
DROP TRIGGER IF EXISTS count_organization ON projections.orgs1;
DROP TRIGGER IF EXISTS count_login_policy ON projections.login_policies5;
DROP TRIGGER IF EXISTS count_lockout_policy ON projections.lockout_policies3;
DROP TRIGGER IF EXISTS count_identity_provider_ldap ON projections.idp_templates6_ldap2;
DROP TRIGGER IF EXISTS count_identity_provider ON projections.idps3;
DROP TRIGGER IF EXISTS count_iam_admin ON projections.instance_members4;
DROP TRIGGER IF EXISTS count_execution_target ON projections.executions1_targets;
DROP TRIGGER IF EXISTS count_execution ON projections.executions1;
DROP TRIGGER IF EXISTS count_action_v1 ON projections.actions3;
DROP INDEX IF EXISTS queue.river_job_unique_idx;
DROP INDEX IF EXISTS queue.river_job_state_and_finalized_at_index;
DROP INDEX IF EXISTS queue.river_job_prioritized_fetching_index;
DROP INDEX IF EXISTS queue.river_job_metadata_index;
DROP INDEX IF EXISTS queue.river_job_kind;
DROP INDEX IF EXISTS queue.river_job_args_index;
DROP INDEX IF EXISTS projections.web_keys1_web_key_state_idx;
DROP INDEX IF EXISTS projections.users14_username_idx;
DROP INDEX IF EXISTS projections.users14_resource_owner_idx;
DROP INDEX IF EXISTS projections.users14_notifications_email_search;
DROP INDEX IF EXISTS projections.users14_humans_email_idx;
DROP INDEX IF EXISTS projections.user_metadata5_resource_owner_idx;
DROP INDEX IF EXISTS projections.user_grants5_user_id_idx;
DROP INDEX IF EXISTS projections.user_grants5_resource_owner_idx;
DROP INDEX IF EXISTS projections.user_auth_methods5_resource_owner_idx;
DROP INDEX IF EXISTS projections.sessions8_user_id_idx_idx;
DROP INDEX IF EXISTS projections.sessions8_user_agent_fingerprint_id_idx_idx;
DROP INDEX IF EXISTS projections.projects4_resource_owner_idx;
DROP INDEX IF EXISTS projections.project_members4_user_id_idx;
DROP INDEX IF EXISTS projections.project_members4_pm_instance_idx;
DROP INDEX IF EXISTS projections.project_grants4_resource_owner_idx;
DROP INDEX IF EXISTS projections.project_grants4_granted_org_idx;
DROP INDEX IF EXISTS projections.project_grant_members4_user_id_idx;
DROP INDEX IF EXISTS projections.project_grant_members4_pgm_instance_idx;
DROP INDEX IF EXISTS projections.privacy_policies4_owner_removed_idx;
DROP INDEX IF EXISTS projections.personal_access_tokens3_user_id_idx;
DROP INDEX IF EXISTS projections.personal_access_tokens3_resource_owner_idx;
DROP INDEX IF EXISTS projections.personal_access_tokens3_owner_removed_idx;
DROP INDEX IF EXISTS projections.personal_access_tokens3_expiration_date_idx;
DROP INDEX IF EXISTS projections.personal_access_tokens3_creation_date_idx;
DROP INDEX IF EXISTS projections.password_complexity_policies2_owner_removed_idx;
DROP INDEX IF EXISTS projections.password_age_policies2_owner_removed_idx;
DROP INDEX IF EXISTS projections.orgs1_name_idx;
DROP INDEX IF EXISTS projections.orgs1_domain_idx;
DROP INDEX IF EXISTS projections.org_metadata2_owner_removed_idx;
DROP INDEX IF EXISTS projections.org_members4_user_id_idx;
DROP INDEX IF EXISTS projections.org_members4_om_instance_idx;
DROP INDEX IF EXISTS projections.org_domains2_owner_removed_idx;
DROP INDEX IF EXISTS projections.message_texts2_owner_removed_idx;
DROP INDEX IF EXISTS projections.mail_templates2_owner_removed_idx;
DROP INDEX IF EXISTS projections.login_policies5_owner_removed_idx;
DROP INDEX IF EXISTS projections.login_names3_users_search;
DROP INDEX IF EXISTS projections.login_names3_users_lnu_instance_ro_id_idx;
DROP INDEX IF EXISTS projections.login_names3_users_instance_user_name_idx;
DROP INDEX IF EXISTS projections.login_names3_policies_is_default_owner_idx;
DROP INDEX IF EXISTS projections.login_names3_domain_search_result;
DROP INDEX IF EXISTS projections.login_names3_domain_search;
DROP INDEX IF EXISTS projections.label_policies3_owner_removed_idx;
DROP INDEX IF EXISTS projections.instance_trusted_domains_instance_trusted_domain_idx;
DROP INDEX IF EXISTS projections.instance_members4_user_id_idx;
DROP INDEX IF EXISTS projections.instance_members4_im_instance_idx;
DROP INDEX IF EXISTS projections.instance_domains_instance_domain_idx;
DROP INDEX IF EXISTS projections.idps3_resource_owner_idx;
DROP INDEX IF EXISTS projections.idps3_owner_removed_idx;
DROP INDEX IF EXISTS projections.idp_user_links3_user_id_idx;
DROP INDEX IF EXISTS projections.idp_user_links3_owner_removed_idx;
DROP INDEX IF EXISTS projections.idp_templates6_resource_owner_idx;
DROP INDEX IF EXISTS projections.idp_templates6_owner_removed_idx;
DROP INDEX IF EXISTS projections.idp_login_policy_links5_resource_owner_idx;
DROP INDEX IF EXISTS projections.idp_login_policy_links5_owner_removed_idx;
DROP INDEX IF EXISTS projections.fe2_instance_id_idx;
DROP INDEX IF EXISTS projections.failed_events_instance_id_idx;
DROP INDEX IF EXISTS projections.executions1_targets_execution_idx;
DROP INDEX IF EXISTS projections.domain_policies2_owner_removed_idx;
DROP INDEX IF EXISTS projections.device_auth_requests2_user_code_idx;
DROP INDEX IF EXISTS projections.custom_texts2_owner_removed_idx;
DROP INDEX IF EXISTS projections.current_sequences_instance_id_idx;
DROP INDEX IF EXISTS projections.cs_instance_id_idx;
DROP INDEX IF EXISTS projections.authn_keys2_resource_owner_idx;
DROP INDEX IF EXISTS projections.authn_keys2_identifier_idx;
DROP INDEX IF EXISTS projections.authn_keys2_expiration_date_idx;
DROP INDEX IF EXISTS projections.authn_keys2_enabled_idx;
DROP INDEX IF EXISTS projections.authn_keys2_creation_date_idx;
DROP INDEX IF EXISTS projections.apps7_saml_configs_entity_id_idx;
DROP INDEX IF EXISTS projections.apps7_project_id_idx;
DROP INDEX IF EXISTS projections.apps7_oidc_configs_client_id_idx;
DROP INDEX IF EXISTS projections.apps7_api_configs_client_id_idx;
DROP INDEX IF EXISTS projections.actions3_resource_owner_idx;
DROP INDEX IF EXISTS projections.actions3_owner_removed_idx;
DROP INDEX IF EXISTS logstore.protocol_date_desc;
DROP INDEX IF EXISTS logstore.log_date_desc;
DROP INDEX IF EXISTS eventstore.fields_instance_domains_idx;
DROP INDEX IF EXISTS eventstore.f_text_value_idx;
DROP INDEX IF EXISTS eventstore.f_text_unique_idx;
DROP INDEX IF EXISTS eventstore.f_object_idx;
DROP INDEX IF EXISTS eventstore.f_number_value_idx;
DROP INDEX IF EXISTS eventstore.f_number_unique_idx;
DROP INDEX IF EXISTS eventstore.f_bool_value_idx;
DROP INDEX IF EXISTS eventstore.f_bool_unique_idx;
DROP INDEX IF EXISTS eventstore.f_aggregate_object_type_idx;
DROP INDEX IF EXISTS eventstore.events2_current_sequence2;
DROP INDEX IF EXISTS eventstore.es_wm;
DROP INDEX IF EXISTS eventstore.es_projection;
DROP INDEX IF EXISTS eventstore.es_instance_position;
DROP INDEX IF EXISTS eventstore.es_active_instances;
DROP INDEX IF EXISTS eventstore.active_instances_events;
DROP INDEX IF EXISTS cache.string_keys_object_id_idx;
DROP INDEX IF EXISTS auth.user_sessions_by_user;
DROP INDEX IF EXISTS auth.user_session_id;
DROP INDEX IF EXISTS auth.unique_client_user_index;
DROP INDEX IF EXISTS auth.u2_owner_removed_idx;
DROP INDEX IF EXISTS auth.org_proj_m2_owner_removed_idx;
DROP INDEX IF EXISTS auth.inst_usr_agnt_tkn_idx;
DROP INDEX IF EXISTS auth.inst_ro_tkn_idx;
DROP INDEX IF EXISTS auth.inst_refresh_tkn_idx;
DROP INDEX IF EXISTS auth.inst_app_tkn_idx;
DROP INDEX IF EXISTS auth.idp_prov2_owner_removed_idx;
DROP INDEX IF EXISTS auth.idp_conf2_owner_removed_idx;
DROP INDEX IF EXISTS auth.failed_events_instance_id_idx;
DROP INDEX IF EXISTS auth.ext_idps2_owner_removed_idx;
DROP INDEX IF EXISTS auth.current_sequences_instance_id_idx;
DROP INDEX IF EXISTS auth.auth_code_idx;
DROP INDEX IF EXISTS adminapi.st2_owner_removed_idx;
DROP INDEX IF EXISTS adminapi.failed_events_instance_id_idx;
DROP INDEX IF EXISTS adminapi.current_sequences_instance_id_idx;
ALTER TABLE IF EXISTS ONLY system.encryption_keys DROP CONSTRAINT IF EXISTS encryption_keys_pkey;
ALTER TABLE IF EXISTS ONLY system.assets DROP CONSTRAINT IF EXISTS assets_pkey;
ALTER TABLE IF EXISTS ONLY queue.river_queue DROP CONSTRAINT IF EXISTS river_queue_pkey;
ALTER TABLE IF EXISTS ONLY queue.river_migration DROP CONSTRAINT IF EXISTS river_migration_pkey1;
ALTER TABLE IF EXISTS ONLY queue.river_leader DROP CONSTRAINT IF EXISTS river_leader_pkey;
ALTER TABLE IF EXISTS ONLY queue.river_job DROP CONSTRAINT IF EXISTS river_job_pkey;
ALTER TABLE IF EXISTS ONLY queue.river_client_queue DROP CONSTRAINT IF EXISTS river_client_queue_pkey;
ALTER TABLE IF EXISTS ONLY queue.river_client DROP CONSTRAINT IF EXISTS river_client_pkey;
ALTER TABLE IF EXISTS ONLY projections.web_keys1 DROP CONSTRAINT IF EXISTS web_keys1_pkey;
ALTER TABLE IF EXISTS ONLY projections.users14 DROP CONSTRAINT IF EXISTS users14_pkey;
ALTER TABLE IF EXISTS ONLY projections.users14_notifications DROP CONSTRAINT IF EXISTS users14_notifications_pkey;
ALTER TABLE IF EXISTS ONLY projections.users14_machines DROP CONSTRAINT IF EXISTS users14_machines_pkey;
ALTER TABLE IF EXISTS ONLY projections.users14_humans DROP CONSTRAINT IF EXISTS users14_humans_pkey;
ALTER TABLE IF EXISTS ONLY projections.user_schemas1 DROP CONSTRAINT IF EXISTS user_schemas1_pkey;
ALTER TABLE IF EXISTS ONLY projections.user_metadata5 DROP CONSTRAINT IF EXISTS user_metadata5_pkey;
ALTER TABLE IF EXISTS ONLY projections.user_grants5 DROP CONSTRAINT IF EXISTS user_grants5_pkey;
ALTER TABLE IF EXISTS ONLY projections.user_auth_methods5 DROP CONSTRAINT IF EXISTS user_auth_methods5_pkey;
ALTER TABLE IF EXISTS ONLY projections.targets2 DROP CONSTRAINT IF EXISTS targets2_pkey;
ALTER TABLE IF EXISTS ONLY projections.system_features DROP CONSTRAINT IF EXISTS system_features_pkey;
ALTER TABLE IF EXISTS ONLY projections.smtp_configs5_smtp DROP CONSTRAINT IF EXISTS smtp_configs5_smtp_pkey;
ALTER TABLE IF EXISTS ONLY projections.smtp_configs5 DROP CONSTRAINT IF EXISTS smtp_configs5_pkey;
ALTER TABLE IF EXISTS ONLY projections.smtp_configs5_http DROP CONSTRAINT IF EXISTS smtp_configs5_http_pkey;
ALTER TABLE IF EXISTS ONLY projections.sms_configs3_twilio DROP CONSTRAINT IF EXISTS sms_configs3_twilio_pkey;
ALTER TABLE IF EXISTS ONLY projections.sms_configs3 DROP CONSTRAINT IF EXISTS sms_configs3_pkey;
ALTER TABLE IF EXISTS ONLY projections.sms_configs3_http DROP CONSTRAINT IF EXISTS sms_configs3_http_pkey;
ALTER TABLE IF EXISTS ONLY projections.sessions8 DROP CONSTRAINT IF EXISTS sessions8_pkey;
ALTER TABLE IF EXISTS ONLY projections.security_policies2 DROP CONSTRAINT IF EXISTS security_policies2_pkey;
ALTER TABLE IF EXISTS ONLY projections.secret_generators2 DROP CONSTRAINT IF EXISTS secret_generators2_pkey;
ALTER TABLE IF EXISTS ONLY projections.saml_requests DROP CONSTRAINT IF EXISTS saml_requests_pkey;
ALTER TABLE IF EXISTS ONLY projections.restrictions2 DROP CONSTRAINT IF EXISTS restrictions2_pkey;
ALTER TABLE IF EXISTS ONLY projections.resource_counts DROP CONSTRAINT IF EXISTS resource_counts_pkey;
ALTER TABLE IF EXISTS ONLY projections.resource_counts DROP CONSTRAINT IF EXISTS resource_counts_instance_id_parent_type_parent_id_table_nam_key;
ALTER TABLE IF EXISTS ONLY projections.quotas DROP CONSTRAINT IF EXISTS quotas_pkey;
ALTER TABLE IF EXISTS ONLY projections.quotas_periods DROP CONSTRAINT IF EXISTS quotas_periods_pkey;
ALTER TABLE IF EXISTS ONLY projections.quotas_notifications DROP CONSTRAINT IF EXISTS quotas_notifications_pkey;
ALTER TABLE IF EXISTS ONLY projections.projects4 DROP CONSTRAINT IF EXISTS projects4_pkey;
ALTER TABLE IF EXISTS ONLY projections.project_roles4 DROP CONSTRAINT IF EXISTS project_roles4_pkey;
ALTER TABLE IF EXISTS ONLY projections.project_members4 DROP CONSTRAINT IF EXISTS project_members4_pkey;
ALTER TABLE IF EXISTS ONLY projections.project_grants4 DROP CONSTRAINT IF EXISTS project_grants4_pkey;
ALTER TABLE IF EXISTS ONLY projections.project_grant_members4 DROP CONSTRAINT IF EXISTS project_grant_members4_pkey;
ALTER TABLE IF EXISTS ONLY projections.privacy_policies4 DROP CONSTRAINT IF EXISTS privacy_policies4_pkey;
ALTER TABLE IF EXISTS ONLY projections.personal_access_tokens3 DROP CONSTRAINT IF EXISTS personal_access_tokens3_pkey;
ALTER TABLE IF EXISTS ONLY projections.password_complexity_policies2 DROP CONSTRAINT IF EXISTS password_complexity_policies2_pkey;
ALTER TABLE IF EXISTS ONLY projections.password_age_policies2 DROP CONSTRAINT IF EXISTS password_age_policies2_pkey;
ALTER TABLE IF EXISTS ONLY projections.orgs1 DROP CONSTRAINT IF EXISTS orgs1_pkey;
ALTER TABLE IF EXISTS ONLY projections.org_metadata2 DROP CONSTRAINT IF EXISTS org_metadata2_pkey;
ALTER TABLE IF EXISTS ONLY projections.org_members4 DROP CONSTRAINT IF EXISTS org_members4_pkey;
ALTER TABLE IF EXISTS ONLY projections.org_domains2 DROP CONSTRAINT IF EXISTS org_domains2_pkey;
ALTER TABLE IF EXISTS ONLY projections.oidc_settings2 DROP CONSTRAINT IF EXISTS oidc_settings2_pkey;
ALTER TABLE IF EXISTS ONLY projections.notification_providers DROP CONSTRAINT IF EXISTS notification_providers_pkey;
ALTER TABLE IF EXISTS ONLY projections.notification_policies DROP CONSTRAINT IF EXISTS notification_policies_pkey;
ALTER TABLE IF EXISTS ONLY projections.milestones3 DROP CONSTRAINT IF EXISTS milestones3_pkey;
ALTER TABLE IF EXISTS ONLY projections.message_texts2 DROP CONSTRAINT IF EXISTS message_texts2_pkey;
ALTER TABLE IF EXISTS ONLY projections.mail_templates2 DROP CONSTRAINT IF EXISTS mail_templates2_pkey;
ALTER TABLE IF EXISTS ONLY projections.login_policies5 DROP CONSTRAINT IF EXISTS login_policies5_pkey;
ALTER TABLE IF EXISTS ONLY projections.login_names3_users DROP CONSTRAINT IF EXISTS login_names3_users_pkey;
ALTER TABLE IF EXISTS ONLY projections.login_names3_policies DROP CONSTRAINT IF EXISTS login_names3_policies_pkey;
ALTER TABLE IF EXISTS ONLY projections.login_names3_domains DROP CONSTRAINT IF EXISTS login_names3_domains_pkey;
ALTER TABLE IF EXISTS ONLY projections.locks DROP CONSTRAINT IF EXISTS locks_pkey;
ALTER TABLE IF EXISTS ONLY projections.lockout_policies3 DROP CONSTRAINT IF EXISTS lockout_policies3_pkey;
ALTER TABLE IF EXISTS ONLY projections.limits DROP CONSTRAINT IF EXISTS limits_pkey;
ALTER TABLE IF EXISTS ONLY projections.label_policies3 DROP CONSTRAINT IF EXISTS label_policies3_pkey;
ALTER TABLE IF EXISTS ONLY projections.keys4_public DROP CONSTRAINT IF EXISTS keys4_public_pkey;
ALTER TABLE IF EXISTS ONLY projections.keys4_private DROP CONSTRAINT IF EXISTS keys4_private_pkey;
ALTER TABLE IF EXISTS ONLY projections.keys4 DROP CONSTRAINT IF EXISTS keys4_pkey;
ALTER TABLE IF EXISTS ONLY projections.keys4_certificate DROP CONSTRAINT IF EXISTS keys4_certificate_pkey;
ALTER TABLE IF EXISTS ONLY projections.instances DROP CONSTRAINT IF EXISTS instances_pkey;
ALTER TABLE IF EXISTS ONLY projections.instance_trusted_domains DROP CONSTRAINT IF EXISTS instance_trusted_domains_pkey;
ALTER TABLE IF EXISTS ONLY projections.instance_members4 DROP CONSTRAINT IF EXISTS instance_members4_pkey;
ALTER TABLE IF EXISTS ONLY projections.instance_features2 DROP CONSTRAINT IF EXISTS instance_features2_pkey;
ALTER TABLE IF EXISTS ONLY projections.instance_domains DROP CONSTRAINT IF EXISTS instance_domains_pkey;
ALTER TABLE IF EXISTS ONLY projections.idps3 DROP CONSTRAINT IF EXISTS idps3_pkey;
ALTER TABLE IF EXISTS ONLY projections.idps3_oidc_config DROP CONSTRAINT IF EXISTS idps3_oidc_config_pkey;
ALTER TABLE IF EXISTS ONLY projections.idps3_jwt_config DROP CONSTRAINT IF EXISTS idps3_jwt_config_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_user_links3 DROP CONSTRAINT IF EXISTS idp_user_links3_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_saml DROP CONSTRAINT IF EXISTS idp_templates6_saml_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6 DROP CONSTRAINT IF EXISTS idp_templates6_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_oidc DROP CONSTRAINT IF EXISTS idp_templates6_oidc_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_oauth2 DROP CONSTRAINT IF EXISTS idp_templates6_oauth2_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_ldap2 DROP CONSTRAINT IF EXISTS idp_templates6_ldap2_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_jwt DROP CONSTRAINT IF EXISTS idp_templates6_jwt_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_google DROP CONSTRAINT IF EXISTS idp_templates6_google_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_gitlab_self_hosted DROP CONSTRAINT IF EXISTS idp_templates6_gitlab_self_hosted_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_gitlab DROP CONSTRAINT IF EXISTS idp_templates6_gitlab_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_github DROP CONSTRAINT IF EXISTS idp_templates6_github_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_github_enterprise DROP CONSTRAINT IF EXISTS idp_templates6_github_enterprise_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_azure DROP CONSTRAINT IF EXISTS idp_templates6_azure_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_templates6_apple DROP CONSTRAINT IF EXISTS idp_templates6_apple_pkey;
ALTER TABLE IF EXISTS ONLY projections.idp_login_policy_links5 DROP CONSTRAINT IF EXISTS idp_login_policy_links5_pkey;
ALTER TABLE IF EXISTS ONLY projections.hosted_login_translations DROP CONSTRAINT IF EXISTS hosted_login_translations_pkey;
ALTER TABLE IF EXISTS ONLY projections.flow_triggers3 DROP CONSTRAINT IF EXISTS flow_triggers3_pkey;
ALTER TABLE IF EXISTS ONLY projections.failed_events DROP CONSTRAINT IF EXISTS failed_events_pkey;
ALTER TABLE IF EXISTS ONLY projections.failed_events2 DROP CONSTRAINT IF EXISTS failed_events2_pkey;
ALTER TABLE IF EXISTS ONLY projections.executions1_targets DROP CONSTRAINT IF EXISTS executions1_targets_pkey;
ALTER TABLE IF EXISTS ONLY projections.executions1 DROP CONSTRAINT IF EXISTS executions1_pkey;
ALTER TABLE IF EXISTS ONLY projections.domain_policies2 DROP CONSTRAINT IF EXISTS domain_policies2_pkey;
ALTER TABLE IF EXISTS ONLY projections.device_auth_requests2 DROP CONSTRAINT IF EXISTS device_auth_requests2_pkey;
ALTER TABLE IF EXISTS ONLY projections.debug_events DROP CONSTRAINT IF EXISTS debug_events_pkey;
ALTER TABLE IF EXISTS ONLY projections.custom_texts2 DROP CONSTRAINT IF EXISTS custom_texts2_pkey;
ALTER TABLE IF EXISTS ONLY projections.current_states DROP CONSTRAINT IF EXISTS current_states_pkey;
ALTER TABLE IF EXISTS ONLY projections.current_sequences DROP CONSTRAINT IF EXISTS current_sequences_pkey;
ALTER TABLE IF EXISTS ONLY projections.authn_keys2 DROP CONSTRAINT IF EXISTS authn_keys2_pkey;
ALTER TABLE IF EXISTS ONLY projections.auth_requests DROP CONSTRAINT IF EXISTS auth_requests_pkey;
ALTER TABLE IF EXISTS ONLY projections.apps7_saml_configs DROP CONSTRAINT IF EXISTS apps7_saml_configs_pkey;
ALTER TABLE IF EXISTS ONLY projections.apps7 DROP CONSTRAINT IF EXISTS apps7_pkey;
ALTER TABLE IF EXISTS ONLY projections.apps7_oidc_configs DROP CONSTRAINT IF EXISTS apps7_oidc_configs_pkey;
ALTER TABLE IF EXISTS ONLY projections.apps7_api_configs DROP CONSTRAINT IF EXISTS apps7_api_configs_pkey;
ALTER TABLE IF EXISTS ONLY projections.actions3 DROP CONSTRAINT IF EXISTS actions3_pkey;
ALTER TABLE IF EXISTS ONLY eventstore.unique_constraints DROP CONSTRAINT IF EXISTS unique_constraints_pkey;
ALTER TABLE IF EXISTS ONLY eventstore.fields DROP CONSTRAINT IF EXISTS fields_pkey;
ALTER TABLE IF EXISTS ONLY eventstore.events2 DROP CONSTRAINT IF EXISTS events2_pkey;
ALTER TABLE IF EXISTS ONLY cache.string_keys_id_p_form_callback DROP CONSTRAINT IF EXISTS string_keys_id_p_form_callback_pkey;
ALTER TABLE IF EXISTS ONLY cache.string_keys_federated_logout DROP CONSTRAINT IF EXISTS string_keys_federated_logout_pkey;
ALTER TABLE IF EXISTS ONLY cache.string_keys DROP CONSTRAINT IF EXISTS string_keys_pkey;
ALTER TABLE IF EXISTS ONLY cache.objects_id_p_form_callback DROP CONSTRAINT IF EXISTS objects_id_p_form_callback_pkey;
ALTER TABLE IF EXISTS ONLY cache.objects_federated_logout DROP CONSTRAINT IF EXISTS objects_federated_logout_pkey;
ALTER TABLE IF EXISTS ONLY cache.objects DROP CONSTRAINT IF EXISTS objects_pkey;
ALTER TABLE IF EXISTS ONLY auth.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY auth.users3 DROP CONSTRAINT IF EXISTS users3_pkey;
ALTER TABLE IF EXISTS ONLY auth.users2 DROP CONSTRAINT IF EXISTS users2_pkey;
ALTER TABLE IF EXISTS ONLY auth.user_sessions DROP CONSTRAINT IF EXISTS user_sessions_pkey;
ALTER TABLE IF EXISTS ONLY auth.user_external_idps DROP CONSTRAINT IF EXISTS user_external_idps_pkey;
ALTER TABLE IF EXISTS ONLY auth.user_external_idps2 DROP CONSTRAINT IF EXISTS user_external_idps2_pkey;
ALTER TABLE IF EXISTS ONLY auth.tokens DROP CONSTRAINT IF EXISTS tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.org_project_mapping DROP CONSTRAINT IF EXISTS org_project_mapping_pkey;
ALTER TABLE IF EXISTS ONLY auth.org_project_mapping2 DROP CONSTRAINT IF EXISTS org_project_mapping2_pkey;
ALTER TABLE IF EXISTS ONLY auth.locks DROP CONSTRAINT IF EXISTS locks_pkey;
ALTER TABLE IF EXISTS ONLY auth.idp_providers DROP CONSTRAINT IF EXISTS idp_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.idp_providers2 DROP CONSTRAINT IF EXISTS idp_providers2_pkey;
ALTER TABLE IF EXISTS ONLY auth.idp_configs DROP CONSTRAINT IF EXISTS idp_configs_pkey;
ALTER TABLE IF EXISTS ONLY auth.idp_configs2 DROP CONSTRAINT IF EXISTS idp_configs2_pkey;
ALTER TABLE IF EXISTS ONLY auth.failed_events DROP CONSTRAINT IF EXISTS failed_events_pkey;
ALTER TABLE IF EXISTS ONLY auth.current_sequences DROP CONSTRAINT IF EXISTS current_sequences_pkey;
ALTER TABLE IF EXISTS ONLY auth.auth_requests DROP CONSTRAINT IF EXISTS auth_requests_pkey;
ALTER TABLE IF EXISTS ONLY adminapi.styling DROP CONSTRAINT IF EXISTS styling_pkey;
ALTER TABLE IF EXISTS ONLY adminapi.styling2 DROP CONSTRAINT IF EXISTS styling2_pkey;
ALTER TABLE IF EXISTS ONLY adminapi.locks DROP CONSTRAINT IF EXISTS locks_pkey;
ALTER TABLE IF EXISTS ONLY adminapi.failed_events DROP CONSTRAINT IF EXISTS failed_events_pkey;
ALTER TABLE IF EXISTS ONLY adminapi.current_sequences DROP CONSTRAINT IF EXISTS current_sequences_pkey;
ALTER TABLE IF EXISTS queue.river_job ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS projections.resource_counts ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS system.encryption_keys;
DROP TABLE IF EXISTS system.assets;
DROP TABLE IF EXISTS queue.river_queue;
DROP TABLE IF EXISTS queue.river_migration;
DROP TABLE IF EXISTS queue.river_leader;
DROP SEQUENCE IF EXISTS queue.river_job_id_seq;
DROP TABLE IF EXISTS queue.river_job;
DROP TABLE IF EXISTS queue.river_client_queue;
DROP TABLE IF EXISTS queue.river_client;
DROP TABLE IF EXISTS projections.web_keys1;
DROP TABLE IF EXISTS projections.users14_notifications;
DROP TABLE IF EXISTS projections.users14_machines;
DROP TABLE IF EXISTS projections.users14_humans;
DROP TABLE IF EXISTS projections.users14;
DROP TABLE IF EXISTS projections.user_schemas1;
DROP TABLE IF EXISTS projections.user_metadata5;
DROP TABLE IF EXISTS projections.user_grants5;
DROP TABLE IF EXISTS projections.user_auth_methods5;
DROP TABLE IF EXISTS projections.targets2;
DROP TABLE IF EXISTS projections.system_features;
DROP TABLE IF EXISTS projections.smtp_configs5_smtp;
DROP TABLE IF EXISTS projections.smtp_configs5_http;
DROP TABLE IF EXISTS projections.smtp_configs5;
DROP TABLE IF EXISTS projections.sms_configs3_twilio;
DROP TABLE IF EXISTS projections.sms_configs3_http;
DROP TABLE IF EXISTS projections.sms_configs3;
DROP TABLE IF EXISTS projections.sessions8;
DROP TABLE IF EXISTS projections.security_policies2;
DROP TABLE IF EXISTS projections.secret_generators2;
DROP TABLE IF EXISTS projections.saml_requests;
DROP TABLE IF EXISTS projections.restrictions2;
DROP SEQUENCE IF EXISTS projections.resource_counts_id_seq;
DROP TABLE IF EXISTS projections.resource_counts;
DROP TABLE IF EXISTS projections.quotas_periods;
DROP TABLE IF EXISTS projections.quotas_notifications;
DROP TABLE IF EXISTS projections.quotas;
DROP TABLE IF EXISTS projections.projects4;
DROP TABLE IF EXISTS projections.project_roles4;
DROP TABLE IF EXISTS projections.project_members4;
DROP TABLE IF EXISTS projections.project_grants4;
DROP TABLE IF EXISTS projections.project_grant_members4;
DROP TABLE IF EXISTS projections.privacy_policies4;
DROP TABLE IF EXISTS projections.personal_access_tokens3;
DROP TABLE IF EXISTS projections.password_complexity_policies2;
DROP TABLE IF EXISTS projections.password_age_policies2;
DROP TABLE IF EXISTS projections.orgs1;
DROP TABLE IF EXISTS projections.org_metadata2;
DROP TABLE IF EXISTS projections.org_members4;
DROP TABLE IF EXISTS projections.org_domains2;
DROP TABLE IF EXISTS projections.oidc_settings2;
DROP TABLE IF EXISTS projections.notification_providers;
DROP TABLE IF EXISTS projections.notification_policies;
DROP TABLE IF EXISTS projections.milestones3;
DROP TABLE IF EXISTS projections.message_texts2;
DROP TABLE IF EXISTS projections.mail_templates2;
DROP TABLE IF EXISTS projections.login_policies5;
DROP VIEW IF EXISTS projections.login_names3;
DROP TABLE IF EXISTS projections.login_names3_users;
DROP TABLE IF EXISTS projections.login_names3_policies;
DROP TABLE IF EXISTS projections.login_names3_domains;
DROP TABLE IF EXISTS projections.locks;
DROP TABLE IF EXISTS projections.lockout_policies3;
DROP TABLE IF EXISTS projections.limits;
DROP TABLE IF EXISTS projections.label_policies3;
DROP TABLE IF EXISTS projections.keys4_public;
DROP TABLE IF EXISTS projections.keys4_private;
DROP TABLE IF EXISTS projections.keys4_certificate;
DROP TABLE IF EXISTS projections.keys4;
DROP TABLE IF EXISTS projections.instances;
DROP TABLE IF EXISTS projections.instance_trusted_domains;
DROP TABLE IF EXISTS projections.instance_members4;
DROP TABLE IF EXISTS projections.instance_features2;
DROP TABLE IF EXISTS projections.instance_domains;
DROP TABLE IF EXISTS projections.idps3_oidc_config;
DROP TABLE IF EXISTS projections.idps3_jwt_config;
DROP TABLE IF EXISTS projections.idps3;
DROP TABLE IF EXISTS projections.idp_user_links3;
DROP TABLE IF EXISTS projections.idp_templates6_saml;
DROP TABLE IF EXISTS projections.idp_templates6_oidc;
DROP TABLE IF EXISTS projections.idp_templates6_oauth2;
DROP TABLE IF EXISTS projections.idp_templates6_ldap2;
DROP TABLE IF EXISTS projections.idp_templates6_jwt;
DROP TABLE IF EXISTS projections.idp_templates6_google;
DROP TABLE IF EXISTS projections.idp_templates6_gitlab_self_hosted;
DROP TABLE IF EXISTS projections.idp_templates6_gitlab;
DROP TABLE IF EXISTS projections.idp_templates6_github_enterprise;
DROP TABLE IF EXISTS projections.idp_templates6_github;
DROP TABLE IF EXISTS projections.idp_templates6_azure;
DROP TABLE IF EXISTS projections.idp_templates6_apple;
DROP TABLE IF EXISTS projections.idp_templates6;
DROP TABLE IF EXISTS projections.idp_login_policy_links5;
DROP TABLE IF EXISTS projections.hosted_login_translations;
DROP TABLE IF EXISTS projections.flow_triggers3;
DROP TABLE IF EXISTS projections.failed_events2;
DROP TABLE IF EXISTS projections.failed_events;
DROP TABLE IF EXISTS projections.executions1_targets;
DROP TABLE IF EXISTS projections.executions1;
DROP TABLE IF EXISTS projections.domain_policies2;
DROP TABLE IF EXISTS projections.device_auth_requests2;
DROP TABLE IF EXISTS projections.debug_events;
DROP TABLE IF EXISTS projections.custom_texts2;
DROP TABLE IF EXISTS projections.current_states;
DROP TABLE IF EXISTS projections.current_sequences;
DROP TABLE IF EXISTS projections.authn_keys2;
DROP TABLE IF EXISTS projections.auth_requests;
DROP TABLE IF EXISTS projections.apps7_saml_configs;
DROP TABLE IF EXISTS projections.apps7_oidc_configs;
DROP TABLE IF EXISTS projections.apps7_api_configs;
DROP TABLE IF EXISTS projections.apps7;
DROP TABLE IF EXISTS projections.actions3;
DROP TABLE IF EXISTS logstore.execution;
DROP TABLE IF EXISTS logstore.access;
DROP TABLE IF EXISTS eventstore.unique_constraints;
DROP VIEW IF EXISTS eventstore.role_permissions;
DROP VIEW IF EXISTS eventstore.project_members;
DROP VIEW IF EXISTS eventstore.org_members;
DROP VIEW IF EXISTS eventstore.instance_orgs;
DROP VIEW IF EXISTS eventstore.instance_members;
DROP TABLE IF EXISTS eventstore.fields;
DROP TABLE IF EXISTS cache.string_keys_id_p_form_callback;
DROP TABLE IF EXISTS cache.string_keys_federated_logout;
DROP TABLE IF EXISTS cache.string_keys;
DROP TABLE IF EXISTS cache.objects_id_p_form_callback;
DROP TABLE IF EXISTS cache.objects_federated_logout;
DROP TABLE IF EXISTS cache.objects;
DROP TABLE IF EXISTS auth.users3;
DROP TABLE IF EXISTS auth.users2;
DROP TABLE IF EXISTS auth.users;
DROP TABLE IF EXISTS auth.user_sessions;
DROP TABLE IF EXISTS auth.user_external_idps2;
DROP TABLE IF EXISTS auth.user_external_idps;
DROP TABLE IF EXISTS auth.tokens;
DROP TABLE IF EXISTS auth.refresh_tokens;
DROP TABLE IF EXISTS auth.org_project_mapping2;
DROP TABLE IF EXISTS auth.org_project_mapping;
DROP TABLE IF EXISTS auth.locks;
DROP TABLE IF EXISTS auth.idp_providers2;
DROP TABLE IF EXISTS auth.idp_providers;
DROP TABLE IF EXISTS auth.idp_configs2;
DROP TABLE IF EXISTS auth.idp_configs;
DROP TABLE IF EXISTS auth.failed_events;
DROP TABLE IF EXISTS auth.current_sequences;
DROP TABLE IF EXISTS auth.auth_requests;
DROP TABLE IF EXISTS adminapi.styling2;
DROP TABLE IF EXISTS adminapi.styling;
DROP TABLE IF EXISTS adminapi.locks;
DROP TABLE IF EXISTS adminapi.failed_events;
DROP TABLE IF EXISTS adminapi.current_sequences;
DROP FUNCTION IF EXISTS queue.river_job_state_in_bitmask(bitmask bit, state queue.river_job_state);
DROP FUNCTION IF EXISTS projections.delete_table_counts();
DROP FUNCTION IF EXISTS projections.delete_parent_counts();
DROP FUNCTION IF EXISTS projections.count_resource();
DROP FUNCTION IF EXISTS eventstore.push(commands eventstore.command[]);
DROP FUNCTION IF EXISTS eventstore.permitted_projects(req_instance_id text, auth_user_id text, system_user_perms jsonb, perm text, filter_org text, OUT instance_permitted boolean, OUT org_ids text[], OUT project_ids text[]);
DROP FUNCTION IF EXISTS eventstore.permitted_orgs(req_instance_id text, auth_user_id text, system_user_perms jsonb, perm text, filter_org text, OUT instance_permitted boolean, OUT org_ids text[]);
DROP FUNCTION IF EXISTS eventstore.latest_aggregate_state(instance_id text, aggregate_type text, aggregate_id text, OUT sequence bigint, OUT owner text);
DROP FUNCTION IF EXISTS eventstore.get_system_permissions(permissions_json jsonb, permm text);
DROP FUNCTION IF EXISTS eventstore.find_roles(req_instance_id text, perm text, OUT roles text[]);
DROP FUNCTION IF EXISTS eventstore.commands_to_events(commands eventstore.command[]);
DROP TABLE IF EXISTS eventstore.events2;
DROP FUNCTION IF EXISTS eventstore.check_system_user_perms(system_user_perms jsonb, req_instance_id text, perm text, OUT instance_permitted boolean, OUT org_ids text[], OUT project_ids text[], OUT project_grants eventstore.project_grant[]);
DROP TYPE IF EXISTS queue.river_job_state;
DROP TYPE IF EXISTS eventstore.project_grant;
DROP TYPE IF EXISTS eventstore.command;
DROP SCHEMA IF EXISTS system;
DROP SCHEMA IF EXISTS queue;
DROP SCHEMA IF EXISTS projections;
DROP SCHEMA IF EXISTS logstore;
DROP SCHEMA IF EXISTS eventstore;
DROP SCHEMA IF EXISTS cache;
DROP SCHEMA IF EXISTS auth;
DROP SCHEMA IF EXISTS adminapi;
--
-- Name: adminapi; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA adminapi;


--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: cache; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA cache;


--
-- Name: eventstore; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA eventstore;


--
-- Name: logstore; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA logstore;


--
-- Name: projections; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA projections;


--
-- Name: queue; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA queue;


--
-- Name: system; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA system;


--
-- Name: command; Type: TYPE; Schema: eventstore; Owner: -
--

CREATE TYPE eventstore.command AS (
	instance_id text,
	aggregate_type text,
	aggregate_id text,
	command_type text,
	revision smallint,
	payload jsonb,
	creator text,
	owner text
);


--
-- Name: project_grant; Type: TYPE; Schema: eventstore; Owner: -
--

CREATE TYPE eventstore.project_grant AS (
	project_id text,
	grant_id text
);


--
-- Name: river_job_state; Type: TYPE; Schema: queue; Owner: -
--

CREATE TYPE queue.river_job_state AS ENUM (
    'available',
    'cancelled',
    'completed',
    'discarded',
    'pending',
    'retryable',
    'running',
    'scheduled'
);


--
-- Name: check_system_user_perms(jsonb, text, text); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.check_system_user_perms(system_user_perms jsonb, req_instance_id text, perm text, OUT instance_permitted boolean, OUT org_ids text[], OUT project_ids text[], OUT project_grants eventstore.project_grant[]) RETURNS record
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
	-- make sure no nulls are returned
	instance_permitted := FALSE;
	org_ids := ARRAY[]::TEXT[];
	project_ids := ARRAY[]::TEXT[];
	project_grants := ARRAY[]::eventstore.project_grant[];
	DECLARE
	    p RECORD;
	BEGIN
        FOR p IN SELECT member_type, aggregate_id, object_id
	        FROM eventstore.get_system_permissions(system_user_perms, perm)
	    LOOP
	       CASE p.member_type
	            WHEN 'System' THEN
	                instance_permitted := TRUE;
	                RETURN;
	            WHEN 'IAM' THEN
	                IF p.aggregate_id = req_instance_id THEN
	                    instance_permitted := TRUE;
	                    RETURN;
	                END IF;
	            WHEN 'Organization' THEN
	                IF p.aggregate_id != '' THEN
	                    org_ids := array_append(org_ids, p.aggregate_id);
	                END IF;
	            WHEN 'Project' THEN
	                IF p.aggregate_id != '' THEN
	                    project_ids := array_append(project_ids, p.aggregate_id);
	                END IF;
	            WHEN 'ProjectGrant' THEN
	                IF p.aggregate_id != '' THEN
	                    project_grants := array_append(project_grants, ROW(p.aggregate_id, p.object_id)::eventstore.project_grant);
	                END IF;
	        END CASE;
	    END LOOP;
	END;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: events2; Type: TABLE; Schema: eventstore; Owner: -
--

CREATE TABLE eventstore.events2 (
    instance_id text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    event_type text NOT NULL,
    sequence bigint NOT NULL,
    revision smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    payload jsonb,
    creator text NOT NULL,
    owner text NOT NULL,
    "position" numeric NOT NULL,
    in_tx_order integer NOT NULL
);


--
-- Name: commands_to_events(eventstore.command[]); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.commands_to_events(commands eventstore.command[]) RETURNS SETOF eventstore.events2
    LANGUAGE plpgsql STABLE ROWS 10 PARALLEL SAFE
    AS $$
DECLARE
    "aggregate" RECORD;
    current_sequence BIGINT;
    current_owner TEXT;
BEGIN
    FOR "aggregate" IN 
        SELECT DISTINCT
            instance_id
            , aggregate_type
            , aggregate_id
        FROM UNNEST(commands)
    LOOP
        SELECT 
            * 
        INTO
            current_sequence
            , current_owner 
        FROM eventstore.latest_aggregate_state(
            "aggregate".instance_id
            , "aggregate".aggregate_type
            , "aggregate".aggregate_id
        );

        RETURN QUERY
        SELECT
            c.instance_id
            , c.aggregate_type
            , c.aggregate_id
            , c.command_type -- AS event_type
            , COALESCE(current_sequence, 0) + ROW_NUMBER() OVER () -- AS sequence
            , c.revision
            , NOW() -- AS created_at
            , c.payload
            , c.creator
            , COALESCE(current_owner, c.owner) -- AS owner
            , EXTRACT(EPOCH FROM NOW()) -- AS position
            , c.ordinality::integer -- AS in_tx_order
        FROM
            UNNEST(commands) WITH ORDINALITY AS c
        WHERE
            c.instance_id = aggregate.instance_id
            AND c.aggregate_type = aggregate.aggregate_type
            AND c.aggregate_id = aggregate.aggregate_id;
    END LOOP;
    RETURN;
END;
$$;


--
-- Name: find_roles(text, text); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.find_roles(req_instance_id text, perm text, OUT roles text[]) RETURNS text[]
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    SELECT array_agg(rp.role) INTO roles
    FROM eventstore.role_permissions rp
    WHERE rp.instance_id = req_instance_id
    AND rp.permission = perm;
END;
$$;


--
-- Name: get_system_permissions(jsonb, text); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.get_system_permissions(permissions_json jsonb, permm text) RETURNS TABLE(member_type text, aggregate_id text, object_id text)
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
    RETURN QUERY
    SELECT res.member_type, res.aggregate_id, res.object_id  FROM (
    SELECT 
        (perm)->>'member_type' AS member_type,
        (perm)->>'aggregate_id' AS aggregate_id,
        (perm)->>'object_id' AS object_id,
        permission
        FROM jsonb_array_elements(permissions_json) AS perm
        CROSS JOIN jsonb_array_elements_text(perm->'permissions') AS permission) AS res
        WHERE res.permission = permm;
END;
$$;


--
-- Name: latest_aggregate_state(text, text, text); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.latest_aggregate_state(instance_id text, aggregate_type text, aggregate_id text, OUT sequence bigint, OUT owner text) RETURNS record
    LANGUAGE plpgsql STABLE PARALLEL SAFE
    AS $_$
    BEGIN
        SELECT
            COALESCE(e.sequence, 0) AS sequence
            , e.owner
        INTO
            sequence
            , owner
        FROM
            eventstore.events2 e
        WHERE
            e.instance_id = $1
            AND e.aggregate_type = $2
            AND e.aggregate_id = $3
        ORDER BY 
            e.sequence DESC
        LIMIT 1;

        RETURN;
    END;
$_$;


--
-- Name: permitted_orgs(text, text, jsonb, text, text); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.permitted_orgs(req_instance_id text, auth_user_id text, system_user_perms jsonb, perm text, filter_org text, OUT instance_permitted boolean, OUT org_ids text[]) RETURNS record
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    -- if system user
    IF system_user_perms IS NOT NULL THEN
        SELECT p.instance_permitted, p.org_ids INTO instance_permitted, org_ids
        FROM eventstore.check_system_user_perms(system_user_perms, req_instance_id, perm) p;
        RETURN;
    END IF;
  
    -- if human/machine user
    DECLARE
    	matched_roles TEXT[] := eventstore.find_roles(req_instance_id, perm);
	BEGIN
        -- First try if the permission was granted thru an instance-level role
        SELECT true INTO instance_permitted
            FROM eventstore.instance_members im
            WHERE im.role = ANY(matched_roles)
            AND im.instance_id = req_instance_id
            AND im.user_id = auth_user_id
            LIMIT 1;
        
        org_ids := ARRAY[]::TEXT[];
        IF instance_permitted THEN
            RETURN;
        END IF;
        instance_permitted := FALSE;

        -- Return the organizations where permission were granted thru org-level roles
        SELECT array_agg(sub.org_id) INTO org_ids
        FROM (
            SELECT DISTINCT om.org_id
            FROM eventstore.org_members om
            WHERE om.role = ANY(matched_roles)
            AND om.instance_id = req_instance_id
            AND om.user_id = auth_user_id
            AND (filter_org IS NULL OR om.org_id = filter_org)
        ) AS sub;
    END;
END;
$$;


--
-- Name: permitted_projects(text, text, jsonb, text, text); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.permitted_projects(req_instance_id text, auth_user_id text, system_user_perms jsonb, perm text, filter_org text, OUT instance_permitted boolean, OUT org_ids text[], OUT project_ids text[]) RETURNS record
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    -- if system user
    IF system_user_perms IS NOT NULL THEN
        SELECT p.instance_permitted, p.org_ids INTO instance_permitted, org_ids, project_ids
        FROM eventstore.check_system_user_perms(system_user_perms, req_instance_id, perm) p;
        RETURN;
    END IF;

    -- if human/machine user
    SELECT * FROM eventstore.permitted_orgs(
        req_instance_id
        , auth_user_id
        , system_user_perms
        , perm
        , filter_org
    ) INTO instance_permitted, org_ids;
    IF instance_permitted THEN
        RETURN;
    END IF;
	DECLARE
    	matched_roles TEXT[] := eventstore.find_roles(req_instance_id, perm);
	BEGIN
	    -- Get the projects where permission were granted thru project-level roles
	    SELECT array_agg(sub.project_id) INTO project_ids
	    FROM (
	        SELECT DISTINCT pm.project_id
	        FROM eventstore.project_members pm
	        WHERE pm.role = ANY(matched_roles)
	        AND pm.instance_id = req_instance_id
	        AND pm.user_id = auth_user_id
	        AND (filter_org IS NULL OR pm.org_id = filter_org)
	    ) AS sub;
	END;
END;
$$;


--
-- Name: push(eventstore.command[]); Type: FUNCTION; Schema: eventstore; Owner: -
--

CREATE FUNCTION eventstore.push(commands eventstore.command[]) RETURNS SETOF eventstore.events2
    LANGUAGE sql
    AS $$
INSERT INTO eventstore.events2
SELECT * FROM eventstore.commands_to_events(commands)
ORDER BY in_tx_order
RETURNING *
$$;


--
-- Name: count_resource(); Type: FUNCTION; Schema: projections; Owner: -
--

CREATE FUNCTION projections.count_resource() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
	-- trigger variables
	tg_table_name TEXT := TG_TABLE_SCHEMA || '.' || TG_TABLE_NAME;
	tg_parent_type TEXT := TG_ARGV[0];
	tg_instance_id_column TEXT := TG_ARGV[1];
	tg_parent_id_column TEXT := TG_ARGV[2];
	tg_resource_name TEXT := TG_ARGV[3];
	
	tg_instance_id TEXT;
	tg_parent_id TEXT;

	select_ids TEXT := format('SELECT ($1).%I, ($1).%I', tg_instance_id_column, tg_parent_id_column);
BEGIN
	IF (TG_OP = 'INSERT') THEN
		EXECUTE select_ids INTO tg_instance_id, tg_parent_id USING NEW;
		
		INSERT INTO projections.resource_counts(instance_id, table_name, parent_type, parent_id, resource_name)
		VALUES (tg_instance_id, tg_table_name, tg_parent_type, tg_parent_id, tg_resource_name)	
		ON CONFLICT (instance_id, table_name, parent_type, parent_id) DO
		UPDATE SET updated_at = now(), amount = projections.resource_counts.amount + 1;
		
		RETURN NEW;
	ELSEIF (TG_OP = 'DELETE') THEN
		EXECUTE select_ids INTO tg_instance_id, tg_parent_id USING OLD;

		UPDATE projections.resource_counts
		SET updated_at = now(), amount = amount - 1
		WHERE instance_id = tg_instance_id
			AND table_name = tg_table_name
			AND parent_type = tg_parent_type
			AND parent_id = tg_parent_id
			AND resource_name = tg_resource_name 
			AND amount > 0; -- prevent check failure on negative amount.
		
		RETURN OLD;
	END IF;
END
$_$;


--
-- Name: delete_parent_counts(); Type: FUNCTION; Schema: projections; Owner: -
--

CREATE FUNCTION projections.delete_parent_counts() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
	-- trigger variables
	tg_parent_type TEXT := TG_ARGV[0];
	tg_instance_id_column TEXT := TG_ARGV[1];
	tg_parent_id_column TEXT := TG_ARGV[2];
	
	tg_instance_id TEXT;
	tg_parent_id TEXT;

	select_ids TEXT := format('SELECT ($1).%I, ($1).%I', tg_instance_id_column, tg_parent_id_column);
BEGIN
	EXECUTE select_ids INTO tg_instance_id, tg_parent_id USING OLD;
	
	DELETE FROM projections.resource_counts
		WHERE instance_id = tg_instance_id
		AND parent_type = tg_parent_type
		AND parent_id = tg_parent_id;
	
	RETURN OLD;
END
$_$;


--
-- Name: delete_table_counts(); Type: FUNCTION; Schema: projections; Owner: -
--

CREATE FUNCTION projections.delete_table_counts() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	-- trigger variables
	tg_table_name TEXT := TG_TABLE_SCHEMA || '.' || TG_TABLE_NAME;
BEGIN
	DELETE FROM projections.resource_counts
	WHERE table_name = tg_table_name;
END
$$;


--
-- Name: river_job_state_in_bitmask(bit, queue.river_job_state); Type: FUNCTION; Schema: queue; Owner: -
--

CREATE FUNCTION queue.river_job_state_in_bitmask(bitmask bit, state queue.river_job_state) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT CASE state
        WHEN 'available' THEN get_bit(bitmask, 7)
        WHEN 'cancelled' THEN get_bit(bitmask, 6)
        WHEN 'completed' THEN get_bit(bitmask, 5)
        WHEN 'discarded' THEN get_bit(bitmask, 4)
        WHEN 'pending' THEN get_bit(bitmask, 3)
        WHEN 'retryable' THEN get_bit(bitmask, 2)
        WHEN 'running' THEN get_bit(bitmask, 1)
        WHEN 'scheduled' THEN get_bit(bitmask, 0)
        ELSE 0
    END = 1;
$$;


--
-- Name: current_sequences; Type: TABLE; Schema: adminapi; Owner: -
--

CREATE TABLE adminapi.current_sequences (
    view_name text NOT NULL,
    current_sequence bigint,
    event_date timestamp with time zone,
    last_successful_spooler_run timestamp with time zone,
    instance_id text NOT NULL
);


--
-- Name: failed_events; Type: TABLE; Schema: adminapi; Owner: -
--

CREATE TABLE adminapi.failed_events (
    view_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    err_msg text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);


--
-- Name: locks; Type: TABLE; Schema: adminapi; Owner: -
--

CREATE TABLE adminapi.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    view_name text NOT NULL,
    instance_id text NOT NULL
);


--
-- Name: styling; Type: TABLE; Schema: adminapi; Owner: -
--

CREATE TABLE adminapi.styling (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    label_policy_state smallint DEFAULT (0)::smallint NOT NULL,
    sequence bigint,
    primary_color text,
    background_color text,
    warn_color text,
    font_color text,
    primary_color_dark text,
    background_color_dark text,
    warn_color_dark text,
    font_color_dark text,
    logo_url text,
    icon_url text,
    logo_dark_url text,
    icon_dark_url text,
    font_url text,
    err_msg_popup boolean,
    disable_watermark boolean,
    hide_login_name_suffix boolean,
    instance_id text NOT NULL
);


--
-- Name: styling2; Type: TABLE; Schema: adminapi; Owner: -
--

CREATE TABLE adminapi.styling2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    label_policy_state smallint DEFAULT (0)::smallint NOT NULL,
    sequence bigint,
    primary_color text,
    background_color text,
    warn_color text,
    font_color text,
    primary_color_dark text,
    background_color_dark text,
    warn_color_dark text,
    font_color_dark text,
    logo_url text,
    icon_url text,
    logo_dark_url text,
    icon_dark_url text,
    font_url text,
    err_msg_popup boolean,
    disable_watermark boolean,
    hide_login_name_suffix boolean,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


--
-- Name: auth_requests; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.auth_requests (
    id text NOT NULL,
    request jsonb,
    code text,
    request_type smallint,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    instance_id text NOT NULL
);


--
-- Name: current_sequences; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.current_sequences (
    view_name text NOT NULL,
    current_sequence bigint,
    event_date timestamp with time zone,
    last_successful_spooler_run timestamp with time zone,
    instance_id text NOT NULL
);


--
-- Name: failed_events; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.failed_events (
    view_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    err_msg text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);


--
-- Name: idp_configs; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.idp_configs (
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    aggregate_id text,
    name text,
    idp_state smallint,
    idp_provider_type smallint,
    is_oidc boolean,
    oidc_client_id text,
    oidc_client_secret jsonb,
    oidc_issuer text,
    oidc_scopes text[],
    oidc_idp_display_name_mapping smallint,
    oidc_idp_username_mapping smallint,
    styling_type smallint,
    oauth_authorization_endpoint text,
    oauth_token_endpoint text,
    auto_register boolean,
    jwt_endpoint text,
    jwt_keys_endpoint text,
    jwt_header_name text,
    instance_id text NOT NULL
);


--
-- Name: idp_configs2; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.idp_configs2 (
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    aggregate_id text,
    name text,
    idp_state smallint,
    idp_provider_type smallint,
    is_oidc boolean,
    oidc_client_id text,
    oidc_client_secret jsonb,
    oidc_issuer text,
    oidc_scopes text[],
    oidc_idp_display_name_mapping smallint,
    oidc_idp_username_mapping smallint,
    styling_type smallint,
    oauth_authorization_endpoint text,
    oauth_token_endpoint text,
    auto_register boolean,
    jwt_endpoint text,
    jwt_keys_endpoint text,
    jwt_header_name text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


--
-- Name: idp_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.idp_providers (
    aggregate_id text NOT NULL,
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    name text,
    idp_config_type smallint,
    idp_provider_type smallint,
    idp_state smallint,
    styling_type smallint,
    instance_id text NOT NULL
);


--
-- Name: idp_providers2; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.idp_providers2 (
    aggregate_id text NOT NULL,
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    name text,
    idp_config_type smallint,
    idp_provider_type smallint,
    idp_state smallint,
    styling_type smallint,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


--
-- Name: locks; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    view_name text NOT NULL,
    instance_id text NOT NULL
);


--
-- Name: org_project_mapping; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.org_project_mapping (
    org_id text NOT NULL,
    project_id text NOT NULL,
    project_grant_id text,
    instance_id text NOT NULL
);


--
-- Name: org_project_mapping2; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.org_project_mapping2 (
    org_id text NOT NULL,
    project_id text NOT NULL,
    project_grant_id text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.refresh_tokens (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    token text,
    client_id text NOT NULL,
    user_agent_id text NOT NULL,
    user_id text NOT NULL,
    auth_time timestamp with time zone,
    idle_expiration timestamp with time zone,
    expiration timestamp with time zone,
    sequence bigint,
    scopes text[],
    audience text[],
    amr text[],
    instance_id text NOT NULL,
    actor jsonb
);


--
-- Name: tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.tokens (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    application_id text,
    user_agent_id text,
    user_id text,
    expiration timestamp with time zone,
    sequence bigint,
    scopes text[],
    audience text[],
    preferred_language text,
    refresh_token_id text,
    is_pat boolean DEFAULT false NOT NULL,
    instance_id text NOT NULL,
    actor jsonb
);


--
-- Name: user_external_idps; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_external_idps (
    external_user_id text NOT NULL,
    idp_config_id text NOT NULL,
    user_id text,
    idp_name text,
    user_display_name text,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    resource_owner text,
    instance_id text NOT NULL
);


--
-- Name: user_external_idps2; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_external_idps2 (
    external_user_id text NOT NULL,
    idp_config_id text NOT NULL,
    user_id text,
    idp_name text,
    user_display_name text,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    resource_owner text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


--
-- Name: user_sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.user_sessions (
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    state smallint,
    user_agent_id text NOT NULL,
    user_id text NOT NULL,
    user_name text,
    password_verification timestamp with time zone,
    second_factor_verification timestamp with time zone,
    multi_factor_verification timestamp with time zone,
    sequence bigint,
    second_factor_verification_type smallint,
    multi_factor_verification_type smallint,
    user_display_name text,
    login_name text,
    external_login_verification timestamp with time zone,
    selected_idp_config_id text,
    passwordless_verification timestamp with time zone,
    avatar_key text,
    instance_id text NOT NULL,
    id text
);


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    user_state smallint,
    password_set boolean,
    password_change_required boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    user_name text,
    login_names text[],
    preferred_login_name text,
    first_name text,
    last_name text,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    email text,
    is_email_verified boolean,
    phone text,
    is_phone_verified boolean,
    country text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    otp_state smallint,
    mfa_max_set_up smallint,
    mfa_init_skipped timestamp with time zone,
    sequence bigint,
    init_required boolean,
    username_change_required boolean,
    machine_name text,
    machine_description text,
    user_type text,
    u2f_tokens bytea,
    passwordless_tokens bytea,
    avatar_key text,
    passwordless_init_required boolean,
    password_init_required boolean,
    instance_id text NOT NULL
);


--
-- Name: users2; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users2 (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    user_state smallint,
    password_set boolean,
    password_change_required boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    user_name text,
    login_names text[],
    preferred_login_name text,
    first_name text,
    last_name text,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    email text,
    is_email_verified boolean,
    phone text,
    is_phone_verified boolean,
    country text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    otp_state smallint,
    mfa_max_set_up smallint,
    mfa_init_skipped timestamp with time zone,
    sequence bigint,
    init_required boolean,
    username_change_required boolean,
    machine_name text,
    machine_description text,
    user_type text,
    u2f_tokens bytea,
    passwordless_tokens bytea,
    avatar_key text,
    passwordless_init_required boolean,
    password_init_required boolean,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false,
    otp_sms_added boolean DEFAULT false,
    otp_email_added boolean DEFAULT false
);


--
-- Name: users3; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users3 (
    instance_id text NOT NULL,
    id text NOT NULL,
    resource_owner text NOT NULL,
    change_date timestamp with time zone,
    password_set boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    init_required boolean,
    mfa_init_skipped timestamp with time zone,
    username_change_required boolean,
    passwordless_init_required boolean,
    password_init_required boolean
);


--
-- Name: objects; Type: TABLE; Schema: cache; Owner: -
--

CREATE UNLOGGED TABLE cache.objects (
    cache_name character varying NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone DEFAULT now() NOT NULL,
    payload jsonb NOT NULL
)
PARTITION BY LIST (cache_name);


--
-- Name: objects_federated_logout; Type: TABLE; Schema: cache; Owner: -
--

CREATE UNLOGGED TABLE cache.objects_federated_logout (
    cache_name character varying NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone DEFAULT now() NOT NULL,
    payload jsonb NOT NULL
);


--
-- Name: objects_id_p_form_callback; Type: TABLE; Schema: cache; Owner: -
--

CREATE UNLOGGED TABLE cache.objects_id_p_form_callback (
    cache_name character varying NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone DEFAULT now() NOT NULL,
    payload jsonb NOT NULL
);


--
-- Name: string_keys; Type: TABLE; Schema: cache; Owner: -
--

CREATE UNLOGGED TABLE cache.string_keys (
    cache_name character varying NOT NULL,
    index_id integer NOT NULL,
    index_key character varying NOT NULL,
    object_id uuid NOT NULL,
    CONSTRAINT string_keys_cache_name_check CHECK (((cache_name)::text <> ''::text)),
    CONSTRAINT string_keys_index_id_check CHECK ((index_id > 0)),
    CONSTRAINT string_keys_index_key_check CHECK (((index_key)::text <> ''::text))
)
PARTITION BY LIST (cache_name);


--
-- Name: string_keys_federated_logout; Type: TABLE; Schema: cache; Owner: -
--

CREATE UNLOGGED TABLE cache.string_keys_federated_logout (
    cache_name character varying NOT NULL,
    index_id integer NOT NULL,
    index_key character varying NOT NULL,
    object_id uuid NOT NULL,
    CONSTRAINT string_keys_cache_name_check CHECK (((cache_name)::text <> ''::text)),
    CONSTRAINT string_keys_index_id_check CHECK ((index_id > 0)),
    CONSTRAINT string_keys_index_key_check CHECK (((index_key)::text <> ''::text))
);


--
-- Name: string_keys_id_p_form_callback; Type: TABLE; Schema: cache; Owner: -
--

CREATE UNLOGGED TABLE cache.string_keys_id_p_form_callback (
    cache_name character varying NOT NULL,
    index_id integer NOT NULL,
    index_key character varying NOT NULL,
    object_id uuid NOT NULL,
    CONSTRAINT string_keys_cache_name_check CHECK (((cache_name)::text <> ''::text)),
    CONSTRAINT string_keys_index_id_check CHECK ((index_id > 0)),
    CONSTRAINT string_keys_index_key_check CHECK (((index_key)::text <> ''::text))
);


--
-- Name: fields; Type: TABLE; Schema: eventstore; Owner: -
--

CREATE TABLE eventstore.fields (
    id text DEFAULT gen_random_uuid() NOT NULL,
    instance_id text NOT NULL,
    resource_owner text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    object_type text NOT NULL,
    object_id text NOT NULL,
    object_revision smallint,
    field_name text NOT NULL,
    value jsonb NOT NULL,
    number_value numeric GENERATED ALWAYS AS (
CASE
    WHEN (should_index AND (jsonb_typeof(value) = 'number'::text)) THEN (value)::numeric
    ELSE NULL::numeric
END) STORED,
    text_value text GENERATED ALWAYS AS (
CASE
    WHEN (should_index AND (jsonb_typeof(value) = 'string'::text)) THEN (value #>> '{}'::text[])
    ELSE NULL::text
END) STORED,
    bool_value boolean GENERATED ALWAYS AS (
CASE
    WHEN (should_index AND (jsonb_typeof(value) = 'boolean'::text)) THEN (value)::boolean
    ELSE NULL::boolean
END) STORED,
    value_must_be_unique boolean,
    should_index boolean,
    CONSTRAINT primitive_value_for_index CHECK (
CASE
    WHEN should_index THEN (num_nonnulls(number_value, text_value, bool_value) = 1)
    ELSE true
END),
    CONSTRAINT primitive_value_for_unique_check CHECK (
CASE
    WHEN value_must_be_unique THEN (num_nonnulls(number_value, text_value, bool_value) = 1)
    ELSE true
END)
);


--
-- Name: instance_members; Type: VIEW; Schema: eventstore; Owner: -
--

CREATE VIEW eventstore.instance_members AS
 SELECT instance_id,
    object_id AS user_id,
    text_value AS role
   FROM eventstore.fields
  WHERE ((aggregate_type = 'instance'::text) AND (object_type = 'instance_member_role'::text) AND (field_name = 'instance_role'::text));


--
-- Name: instance_orgs; Type: VIEW; Schema: eventstore; Owner: -
--

CREATE VIEW eventstore.instance_orgs AS
 SELECT instance_id,
    aggregate_id AS org_id
   FROM eventstore.fields
  WHERE ((aggregate_type = 'org'::text) AND (object_type = 'org'::text) AND (field_name = 'state'::text));


--
-- Name: org_members; Type: VIEW; Schema: eventstore; Owner: -
--

CREATE VIEW eventstore.org_members AS
 SELECT instance_id,
    aggregate_id AS org_id,
    object_id AS user_id,
    text_value AS role
   FROM eventstore.fields
  WHERE ((aggregate_type = 'org'::text) AND (object_type = 'org_member_role'::text) AND (field_name = 'org_role'::text));


--
-- Name: project_members; Type: VIEW; Schema: eventstore; Owner: -
--

CREATE VIEW eventstore.project_members AS
 SELECT instance_id,
    aggregate_id AS project_id,
    object_id AS user_id,
    text_value AS role,
    resource_owner AS org_id
   FROM eventstore.fields
  WHERE ((aggregate_type = 'project'::text) AND (object_type = 'project_member_role'::text) AND (field_name = 'project_role'::text));


--
-- Name: role_permissions; Type: VIEW; Schema: eventstore; Owner: -
--

CREATE VIEW eventstore.role_permissions AS
 SELECT instance_id,
    aggregate_id,
    object_id AS role,
    text_value AS permission
   FROM eventstore.fields
  WHERE ((aggregate_type = 'permission'::text) AND (object_type = 'role_permission'::text) AND (field_name = 'permission'::text));


--
-- Name: unique_constraints; Type: TABLE; Schema: eventstore; Owner: -
--

CREATE TABLE eventstore.unique_constraints (
    instance_id text NOT NULL,
    unique_type text NOT NULL,
    unique_field text NOT NULL
);


--
-- Name: access; Type: TABLE; Schema: logstore; Owner: -
--

CREATE TABLE logstore.access (
    log_date timestamp with time zone NOT NULL,
    protocol integer NOT NULL,
    request_url text NOT NULL,
    response_status integer NOT NULL,
    request_headers jsonb,
    response_headers jsonb,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    requested_domain text,
    requested_host text
);


--
-- Name: execution; Type: TABLE; Schema: logstore; Owner: -
--

CREATE TABLE logstore.execution (
    log_date timestamp with time zone NOT NULL,
    took interval,
    message text NOT NULL,
    loglevel integer NOT NULL,
    instance_id text NOT NULL,
    action_id text NOT NULL,
    metadata jsonb
);


--
-- Name: actions3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.actions3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    action_state smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    script text DEFAULT ''::text NOT NULL,
    timeout bigint DEFAULT 0 NOT NULL,
    allowed_to_fail boolean DEFAULT false NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: apps7; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.apps7 (
    id text NOT NULL,
    name text NOT NULL,
    project_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    sequence bigint NOT NULL
);


--
-- Name: apps7_api_configs; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.apps7_api_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret text,
    auth_method smallint NOT NULL
);


--
-- Name: apps7_oidc_configs; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.apps7_oidc_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    version smallint NOT NULL,
    client_id text NOT NULL,
    client_secret text,
    redirect_uris text[],
    response_types smallint[],
    grant_types smallint[],
    application_type smallint NOT NULL,
    auth_method_type smallint NOT NULL,
    post_logout_redirect_uris text[],
    is_dev_mode boolean NOT NULL,
    access_token_type smallint NOT NULL,
    access_token_role_assertion boolean DEFAULT false NOT NULL,
    id_token_role_assertion boolean DEFAULT false NOT NULL,
    id_token_userinfo_assertion boolean DEFAULT false NOT NULL,
    clock_skew bigint DEFAULT 0 NOT NULL,
    additional_origins text[],
    skip_native_app_success_page boolean DEFAULT false NOT NULL,
    back_channel_logout_uri text,
    login_version smallint,
    login_base_uri text
);


--
-- Name: apps7_saml_configs; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.apps7_saml_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    entity_id text NOT NULL,
    metadata bytea NOT NULL,
    metadata_url text NOT NULL,
    login_version smallint,
    login_base_uri text
);


--
-- Name: auth_requests; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.auth_requests (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    login_client text NOT NULL,
    client_id text NOT NULL,
    redirect_uri text NOT NULL,
    scope text[] NOT NULL,
    prompt smallint[],
    ui_locales text[],
    max_age bigint,
    login_hint text,
    hint_user_id text
);


--
-- Name: authn_keys2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.authn_keys2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    aggregate_id text NOT NULL,
    sequence bigint NOT NULL,
    object_id text NOT NULL,
    expiration timestamp with time zone NOT NULL,
    identifier text NOT NULL,
    public_key bytea NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    type smallint DEFAULT 0 NOT NULL
);


--
-- Name: current_sequences; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.current_sequences (
    projection_name text NOT NULL,
    aggregate_type text NOT NULL,
    current_sequence bigint,
    instance_id text NOT NULL,
    "timestamp" timestamp with time zone
);


--
-- Name: current_states; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.current_states (
    projection_name text NOT NULL,
    instance_id text NOT NULL,
    last_updated timestamp with time zone,
    aggregate_id text,
    aggregate_type text,
    sequence bigint,
    event_date timestamp with time zone,
    "position" numeric,
    filter_offset integer
);


--
-- Name: custom_texts2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.custom_texts2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    is_default boolean NOT NULL,
    template text NOT NULL,
    language text NOT NULL,
    key text NOT NULL,
    text text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: debug_events; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.debug_events (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    blob text NOT NULL
);


--
-- Name: device_auth_requests2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.device_auth_requests2 (
    client_id text NOT NULL,
    device_code text NOT NULL,
    user_code text NOT NULL,
    scopes text[],
    audience text[],
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    instance_id text NOT NULL
);


--
-- Name: domain_policies2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.domain_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    user_login_must_be_domain boolean NOT NULL,
    validate_org_domains boolean NOT NULL,
    smtp_sender_address_matches_instance_domain boolean NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: executions1; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.executions1 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    instance_id text NOT NULL
);


--
-- Name: executions1_targets; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.executions1_targets (
    instance_id text NOT NULL,
    execution_id text NOT NULL,
    "position" bigint NOT NULL,
    include text,
    target_id text
);


--
-- Name: failed_events; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.failed_events (
    projection_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    error text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);


--
-- Name: failed_events2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.failed_events2 (
    projection_name text NOT NULL,
    instance_id text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    event_creation_date timestamp with time zone NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint DEFAULT 0,
    error text,
    last_failed timestamp with time zone
);


--
-- Name: flow_triggers3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.flow_triggers3 (
    flow_type smallint NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    trigger_type smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    trigger_sequence bigint NOT NULL,
    action_id text NOT NULL
);


--
-- Name: hosted_login_translations; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.hosted_login_translations (
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    aggregate_id text NOT NULL,
    aggregate_type text NOT NULL,
    sequence bigint NOT NULL,
    locale text NOT NULL,
    file jsonb NOT NULL,
    etag text NOT NULL
);


--
-- Name: idp_login_policy_links5; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_login_policy_links5 (
    idp_id text NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    provider_type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: idp_templates6; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    name text,
    owner_type smallint NOT NULL,
    type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL,
    is_creation_allowed boolean DEFAULT false NOT NULL,
    is_linking_allowed boolean DEFAULT false NOT NULL,
    is_auto_creation boolean DEFAULT false NOT NULL,
    is_auto_update boolean DEFAULT false NOT NULL,
    auto_linking smallint DEFAULT 0 NOT NULL
);


--
-- Name: idp_templates6_apple; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_apple (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    team_id text NOT NULL,
    key_id text NOT NULL,
    private_key jsonb NOT NULL,
    scopes text[]
);


--
-- Name: idp_templates6_azure; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_azure (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text,
    tenant text,
    is_email_verified boolean DEFAULT false NOT NULL
);


--
-- Name: idp_templates6_github; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_github (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


--
-- Name: idp_templates6_github_enterprise; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_github_enterprise (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    authorization_endpoint text NOT NULL,
    token_endpoint text NOT NULL,
    user_endpoint text NOT NULL,
    scopes text[]
);


--
-- Name: idp_templates6_gitlab; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_gitlab (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


--
-- Name: idp_templates6_gitlab_self_hosted; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_gitlab_self_hosted (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


--
-- Name: idp_templates6_google; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_google (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


--
-- Name: idp_templates6_jwt; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_jwt (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    jwt_endpoint text NOT NULL,
    keys_endpoint text NOT NULL,
    header_name text
);


--
-- Name: idp_templates6_ldap2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_ldap2 (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    servers text[] NOT NULL,
    start_tls boolean NOT NULL,
    base_dn text NOT NULL,
    bind_dn text NOT NULL,
    bind_password jsonb NOT NULL,
    user_base text NOT NULL,
    user_object_classes text[] NOT NULL,
    user_filters text[] NOT NULL,
    timeout bigint NOT NULL,
    root_ca bytea,
    id_attribute text,
    first_name_attribute text,
    last_name_attribute text,
    display_name_attribute text,
    nick_name_attribute text,
    preferred_username_attribute text,
    email_attribute text,
    email_verified text,
    phone_attribute text,
    phone_verified_attribute text,
    preferred_language_attribute text,
    avatar_url_attribute text,
    profile_attribute text
);


--
-- Name: idp_templates6_oauth2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_oauth2 (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    authorization_endpoint text NOT NULL,
    token_endpoint text NOT NULL,
    user_endpoint text NOT NULL,
    scopes text[],
    id_attribute text NOT NULL,
    use_pkce boolean DEFAULT false NOT NULL
);


--
-- Name: idp_templates6_oidc; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_oidc (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[],
    id_token_mapping boolean DEFAULT false NOT NULL,
    use_pkce boolean DEFAULT false NOT NULL
);


--
-- Name: idp_templates6_saml; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_templates6_saml (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    metadata bytea NOT NULL,
    key jsonb NOT NULL,
    certificate bytea NOT NULL,
    binding text,
    with_signed_request boolean,
    name_id_format smallint,
    transient_mapping_attribute_name text,
    federated_logout_enabled boolean DEFAULT false NOT NULL
);


--
-- Name: idp_user_links3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idp_user_links3 (
    idp_id text NOT NULL,
    user_id text NOT NULL,
    external_user_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    display_name text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: idps3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idps3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    name text NOT NULL,
    styling_type smallint NOT NULL,
    owner_type smallint NOT NULL,
    auto_register boolean DEFAULT false NOT NULL,
    type smallint,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: idps3_jwt_config; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idps3_jwt_config (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text,
    keys_endpoint text,
    header_name text,
    endpoint text
);


--
-- Name: idps3_oidc_config; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.idps3_oidc_config (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text,
    client_secret jsonb,
    issuer text,
    scopes text[],
    display_name_mapping smallint,
    username_mapping smallint,
    authorization_endpoint text,
    token_endpoint text
);


--
-- Name: instance_domains; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.instance_domains (
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    domain text NOT NULL,
    is_generated boolean NOT NULL,
    is_primary boolean NOT NULL
);


--
-- Name: instance_features2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.instance_features2 (
    instance_id text NOT NULL,
    key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    value jsonb NOT NULL
);


--
-- Name: instance_members4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.instance_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    id text NOT NULL
);


--
-- Name: instance_trusted_domains; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.instance_trusted_domains (
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    domain text NOT NULL
);


--
-- Name: instances; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.instances (
    id text NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    change_date timestamp with time zone NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    default_org_id text DEFAULT ''::text NOT NULL,
    iam_project_id text DEFAULT ''::text NOT NULL,
    console_client_id text DEFAULT ''::text NOT NULL,
    console_app_id text DEFAULT ''::text NOT NULL,
    sequence bigint NOT NULL,
    default_language text DEFAULT ''::text NOT NULL
);


--
-- Name: keys4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.keys4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    algorithm text DEFAULT ''::text NOT NULL,
    use smallint DEFAULT 0 NOT NULL
);


--
-- Name: keys4_certificate; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.keys4_certificate (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    certificate bytea NOT NULL
);


--
-- Name: keys4_private; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.keys4_private (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    key jsonb NOT NULL
);


--
-- Name: keys4_public; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.keys4_public (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    key bytea NOT NULL
);


--
-- Name: label_policies3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.label_policies3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    hide_login_name_suffix boolean DEFAULT false NOT NULL,
    watermark_disabled boolean DEFAULT false NOT NULL,
    should_error_popup boolean DEFAULT false NOT NULL,
    font_url text,
    light_primary_color text,
    light_warn_color text,
    light_background_color text,
    light_font_color text,
    light_logo_url text,
    light_icon_url text,
    dark_primary_color text,
    dark_warn_color text,
    dark_background_color text,
    dark_font_color text,
    dark_logo_url text,
    dark_icon_url text,
    owner_removed boolean DEFAULT false NOT NULL,
    theme_mode smallint DEFAULT 0 NOT NULL
);


--
-- Name: limits; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.limits (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    audit_log_retention interval,
    block boolean
);


--
-- Name: lockout_policies3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.lockout_policies3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    max_password_attempts bigint NOT NULL,
    max_otp_attempts bigint DEFAULT 0 NOT NULL,
    show_failure boolean NOT NULL
);


--
-- Name: locks; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    projection_name text NOT NULL,
    instance_id text NOT NULL
);


--
-- Name: login_names3_domains; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.login_names3_domains (
    name text NOT NULL,
    is_primary boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name_lower text GENERATED ALWAYS AS (lower(name)) STORED
);


--
-- Name: login_names3_policies; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.login_names3_policies (
    must_be_domain boolean NOT NULL,
    is_default boolean NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL
);


--
-- Name: login_names3_users; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.login_names3_users (
    id text NOT NULL,
    user_name text NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_name_lower text GENERATED ALWAYS AS (lower(user_name)) STORED
);


--
-- Name: login_names3; Type: VIEW; Schema: projections; Owner: -
--

CREATE VIEW projections.login_names3 AS
 SELECT u.id AS user_id,
        CASE
            WHEN p.must_be_domain THEN concat(u.user_name, '@', d.name)
            ELSE u.user_name
        END AS login_name,
    COALESCE(d.is_primary, true) AS is_primary,
    u.instance_id
   FROM ((projections.login_names3_users u
     LEFT JOIN LATERAL ( SELECT p_1.must_be_domain,
            p_1.is_default
           FROM projections.login_names3_policies p_1
          WHERE (((p_1.instance_id = u.instance_id) AND (NOT p_1.is_default) AND (p_1.resource_owner = u.resource_owner)) OR ((p_1.instance_id = u.instance_id) AND p_1.is_default))
          ORDER BY p_1.is_default
         LIMIT 1) p ON (true))
     LEFT JOIN projections.login_names3_domains d ON ((p.must_be_domain AND (u.resource_owner = d.resource_owner) AND (u.instance_id = d.instance_id))));


--
-- Name: login_policies5; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.login_policies5 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    allow_register boolean NOT NULL,
    allow_username_password boolean NOT NULL,
    allow_external_idps boolean NOT NULL,
    force_mfa boolean NOT NULL,
    force_mfa_local_only boolean DEFAULT false NOT NULL,
    second_factors smallint[],
    multi_factors smallint[],
    passwordless_type smallint NOT NULL,
    hide_password_reset boolean NOT NULL,
    ignore_unknown_usernames boolean NOT NULL,
    allow_domain_discovery boolean NOT NULL,
    disable_login_with_email boolean NOT NULL,
    disable_login_with_phone boolean NOT NULL,
    default_redirect_uri text,
    password_check_lifetime bigint NOT NULL,
    external_login_check_lifetime bigint NOT NULL,
    mfa_init_skip_lifetime bigint NOT NULL,
    second_factor_check_lifetime bigint NOT NULL,
    multi_factor_check_lifetime bigint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: mail_templates2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.mail_templates2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    template bytea NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: message_texts2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.message_texts2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    type text NOT NULL,
    language text NOT NULL,
    title text,
    pre_header text,
    subject text,
    greeting text,
    text text,
    button_text text,
    footer_text text,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: milestones3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.milestones3 (
    instance_id text NOT NULL,
    type smallint NOT NULL,
    reached_date timestamp with time zone,
    last_pushed_date timestamp with time zone
);


--
-- Name: notification_policies; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.notification_policies (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean NOT NULL,
    password_change boolean NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: notification_providers; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.notification_providers (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    provider_type smallint NOT NULL,
    compact boolean NOT NULL
);


--
-- Name: oidc_settings2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.oidc_settings2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    access_token_lifetime bigint NOT NULL,
    id_token_lifetime bigint NOT NULL,
    refresh_token_idle_expiration bigint NOT NULL,
    refresh_token_expiration bigint NOT NULL
);


--
-- Name: org_domains2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.org_domains2 (
    org_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    domain text NOT NULL,
    is_verified boolean NOT NULL,
    is_primary boolean NOT NULL,
    validation_type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: org_members4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.org_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    org_id text NOT NULL
);


--
-- Name: org_metadata2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.org_metadata2 (
    org_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    key text NOT NULL,
    value bytea,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: orgs1; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.orgs1 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    org_state smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    primary_domain text DEFAULT ''::text NOT NULL
);


--
-- Name: password_age_policies2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.password_age_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    expire_warn_days bigint NOT NULL,
    max_age_days bigint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: password_complexity_policies2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.password_complexity_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    min_length bigint NOT NULL,
    has_lowercase boolean NOT NULL,
    has_uppercase boolean NOT NULL,
    has_symbol boolean NOT NULL,
    has_number boolean NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: personal_access_tokens3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.personal_access_tokens3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_id text NOT NULL,
    expiration timestamp with time zone NOT NULL,
    scopes text[],
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: privacy_policies4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.privacy_policies4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    privacy_link text NOT NULL,
    tos_link text NOT NULL,
    help_link text NOT NULL,
    support_email text NOT NULL,
    docs_link text DEFAULT 'https://zitadel.com/docs'::text NOT NULL,
    custom_link text NOT NULL,
    custom_link_text text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


--
-- Name: project_grant_members4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.project_grant_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    grant_id text NOT NULL,
    granted_org text NOT NULL
);


--
-- Name: project_grants4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.project_grants4 (
    grant_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    granted_org_id text NOT NULL,
    granted_role_keys text[]
);


--
-- Name: project_members4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.project_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL
);


--
-- Name: project_roles4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.project_roles4 (
    project_id text NOT NULL,
    role_key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    display_name text NOT NULL,
    group_name text NOT NULL
);


--
-- Name: projects4; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.projects4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    project_role_assertion boolean NOT NULL,
    project_role_check boolean NOT NULL,
    has_project_check boolean NOT NULL,
    private_labeling_setting smallint NOT NULL
);


--
-- Name: quotas; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.quotas (
    id text NOT NULL,
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    amount bigint,
    from_anchor timestamp with time zone,
    "interval" interval,
    limit_usage boolean
);


--
-- Name: quotas_notifications; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.quotas_notifications (
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    id text NOT NULL,
    call_url text NOT NULL,
    percent bigint NOT NULL,
    repeat boolean NOT NULL,
    latest_due_period_start timestamp with time zone,
    next_due_threshold bigint
);


--
-- Name: quotas_periods; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.quotas_periods (
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    start timestamp with time zone NOT NULL,
    usage bigint NOT NULL
);


--
-- Name: resource_counts; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.resource_counts (
    id integer NOT NULL,
    instance_id text NOT NULL,
    table_name text NOT NULL,
    parent_type text NOT NULL,
    parent_id text NOT NULL,
    resource_name text NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    amount integer DEFAULT 1 NOT NULL,
    CONSTRAINT resource_counts_amount_check CHECK ((amount >= 0))
);


--
-- Name: resource_counts_id_seq; Type: SEQUENCE; Schema: projections; Owner: -
--

CREATE SEQUENCE projections.resource_counts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: projections; Owner: -
--

ALTER SEQUENCE projections.resource_counts_id_seq OWNED BY projections.resource_counts.id;


--
-- Name: restrictions2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.restrictions2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    disallow_public_org_registration boolean,
    allowed_languages text[]
);


--
-- Name: saml_requests; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.saml_requests (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    login_client text NOT NULL,
    issuer text NOT NULL,
    acs text NOT NULL,
    relay_state text NOT NULL,
    binding text NOT NULL
);


--
-- Name: secret_generators2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.secret_generators2 (
    generator_type smallint NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    length bigint NOT NULL,
    expiry bigint NOT NULL,
    include_lower_letters boolean NOT NULL,
    include_upper_letters boolean NOT NULL,
    include_digits boolean NOT NULL,
    include_symbols boolean NOT NULL
);


--
-- Name: security_policies2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.security_policies2 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    enable_iframe_embedding boolean DEFAULT false NOT NULL,
    origins text[],
    enable_impersonation boolean DEFAULT false NOT NULL
);


--
-- Name: sessions8; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.sessions8 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    creator text NOT NULL,
    user_id text,
    user_resource_owner text,
    user_checked_at timestamp with time zone,
    password_checked_at timestamp with time zone,
    intent_checked_at timestamp with time zone,
    webauthn_checked_at timestamp with time zone,
    webauthn_user_verified boolean,
    totp_checked_at timestamp with time zone,
    otp_sms_checked_at timestamp with time zone,
    otp_email_checked_at timestamp with time zone,
    metadata jsonb,
    token_id text,
    user_agent_fingerprint_id text,
    user_agent_ip text,
    user_agent_description text,
    user_agent_header jsonb,
    expiration timestamp with time zone
);


--
-- Name: sms_configs3; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.sms_configs3 (
    id text NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    description text NOT NULL
);


--
-- Name: sms_configs3_http; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.sms_configs3_http (
    sms_id text NOT NULL,
    instance_id text NOT NULL,
    endpoint text NOT NULL
);


--
-- Name: sms_configs3_twilio; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.sms_configs3_twilio (
    sms_id text NOT NULL,
    instance_id text NOT NULL,
    sid text NOT NULL,
    sender_number text NOT NULL,
    token jsonb NOT NULL,
    verify_service_sid text NOT NULL
);


--
-- Name: smtp_configs5; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.smtp_configs5 (
    id text NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    description text NOT NULL,
    state smallint NOT NULL
);


--
-- Name: smtp_configs5_http; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.smtp_configs5_http (
    id text NOT NULL,
    instance_id text NOT NULL,
    endpoint text NOT NULL
);


--
-- Name: smtp_configs5_smtp; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.smtp_configs5_smtp (
    id text NOT NULL,
    instance_id text NOT NULL,
    tls boolean NOT NULL,
    sender_address text NOT NULL,
    sender_name text NOT NULL,
    reply_to_address text NOT NULL,
    host text NOT NULL,
    username text NOT NULL,
    password jsonb
);


--
-- Name: system_features; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.system_features (
    key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    value jsonb NOT NULL
);


--
-- Name: targets2; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.targets2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    target_type smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    endpoint text NOT NULL,
    timeout bigint NOT NULL,
    interrupt_on_error boolean NOT NULL,
    signing_key jsonb
);


--
-- Name: user_auth_methods5; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.user_auth_methods5 (
    user_id text NOT NULL,
    method_type smallint NOT NULL,
    token_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    domain text
);


--
-- Name: user_grants5; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.user_grants5 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_id text NOT NULL,
    resource_owner_user text NOT NULL,
    project_id text NOT NULL,
    resource_owner_project text NOT NULL,
    grant_id text NOT NULL,
    granted_org text NOT NULL,
    roles text[]
);


--
-- Name: user_metadata5; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.user_metadata5 (
    user_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    key text NOT NULL,
    value bytea
);


--
-- Name: user_schemas1; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.user_schemas1 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    instance_id text NOT NULL,
    type text NOT NULL,
    revision bigint NOT NULL,
    schema jsonb,
    possible_authenticators smallint[]
);


--
-- Name: users14; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.users14 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    username text NOT NULL,
    type smallint NOT NULL
);


--
-- Name: users14_humans; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.users14_humans (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    avatar_key text,
    email text NOT NULL,
    is_email_verified boolean DEFAULT false NOT NULL,
    phone text,
    is_phone_verified boolean,
    password_change_required boolean NOT NULL,
    password_changed timestamp with time zone,
    mfa_init_skipped timestamp with time zone
);


--
-- Name: users14_machines; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.users14_machines (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    description text,
    secret text,
    access_token_type smallint DEFAULT 0 NOT NULL
);


--
-- Name: users14_notifications; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.users14_notifications (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    last_email text,
    verified_email text,
    last_phone text,
    verified_phone text,
    password_set boolean DEFAULT false NOT NULL,
    verified_email_lower text GENERATED ALWAYS AS (lower(verified_email)) STORED
);


--
-- Name: web_keys1; Type: TABLE; Schema: projections; Owner: -
--

CREATE TABLE projections.web_keys1 (
    instance_id text NOT NULL,
    key_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state bigint NOT NULL,
    private_key jsonb NOT NULL,
    public_key jsonb NOT NULL,
    config jsonb NOT NULL,
    config_type bigint NOT NULL
);


--
-- Name: river_client; Type: TABLE; Schema: queue; Owner: -
--

CREATE UNLOGGED TABLE queue.river_client (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    paused_at timestamp with time zone,
    updated_at timestamp with time zone NOT NULL,
    CONSTRAINT name_length CHECK (((char_length(id) > 0) AND (char_length(id) < 128)))
);


--
-- Name: river_client_queue; Type: TABLE; Schema: queue; Owner: -
--

CREATE UNLOGGED TABLE queue.river_client_queue (
    river_client_id text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    max_workers bigint DEFAULT 0 NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    num_jobs_completed bigint DEFAULT 0 NOT NULL,
    num_jobs_running bigint DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    CONSTRAINT name_length CHECK (((char_length(name) > 0) AND (char_length(name) < 128))),
    CONSTRAINT num_jobs_completed_zero_or_positive CHECK ((num_jobs_completed >= 0)),
    CONSTRAINT num_jobs_running_zero_or_positive CHECK ((num_jobs_running >= 0))
);


--
-- Name: river_job; Type: TABLE; Schema: queue; Owner: -
--

CREATE TABLE queue.river_job (
    id bigint NOT NULL,
    state queue.river_job_state DEFAULT 'available'::queue.river_job_state NOT NULL,
    attempt smallint DEFAULT 0 NOT NULL,
    max_attempts smallint NOT NULL,
    attempted_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    finalized_at timestamp with time zone,
    scheduled_at timestamp with time zone DEFAULT now() NOT NULL,
    priority smallint DEFAULT 1 NOT NULL,
    args jsonb NOT NULL,
    attempted_by text[],
    errors jsonb[],
    kind text NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    queue text DEFAULT 'default'::text NOT NULL,
    tags character varying(255)[] DEFAULT '{}'::character varying[] NOT NULL,
    unique_key bytea,
    unique_states bit(8),
    CONSTRAINT finalized_or_finalized_at_null CHECK ((((finalized_at IS NULL) AND (state <> ALL (ARRAY['cancelled'::queue.river_job_state, 'completed'::queue.river_job_state, 'discarded'::queue.river_job_state]))) OR ((finalized_at IS NOT NULL) AND (state = ANY (ARRAY['cancelled'::queue.river_job_state, 'completed'::queue.river_job_state, 'discarded'::queue.river_job_state]))))),
    CONSTRAINT kind_length CHECK (((char_length(kind) > 0) AND (char_length(kind) < 128))),
    CONSTRAINT max_attempts_is_positive CHECK ((max_attempts > 0)),
    CONSTRAINT priority_in_range CHECK (((priority >= 1) AND (priority <= 4))),
    CONSTRAINT queue_length CHECK (((char_length(queue) > 0) AND (char_length(queue) < 128)))
);


--
-- Name: river_job_id_seq; Type: SEQUENCE; Schema: queue; Owner: -
--

CREATE SEQUENCE queue.river_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: river_job_id_seq; Type: SEQUENCE OWNED BY; Schema: queue; Owner: -
--

ALTER SEQUENCE queue.river_job_id_seq OWNED BY queue.river_job.id;


--
-- Name: river_leader; Type: TABLE; Schema: queue; Owner: -
--

CREATE UNLOGGED TABLE queue.river_leader (
    elected_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    leader_id text NOT NULL,
    name text DEFAULT 'default'::text NOT NULL,
    CONSTRAINT leader_id_length CHECK (((char_length(leader_id) > 0) AND (char_length(leader_id) < 128))),
    CONSTRAINT name_length CHECK ((name = 'default'::text))
);


--
-- Name: river_migration; Type: TABLE; Schema: queue; Owner: -
--

CREATE TABLE queue.river_migration (
    line text NOT NULL,
    version bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT line_length CHECK (((char_length(line) > 0) AND (char_length(line) < 128))),
    CONSTRAINT version_gte_1 CHECK ((version >= 1))
);


--
-- Name: river_queue; Type: TABLE; Schema: queue; Owner: -
--

CREATE TABLE queue.river_queue (
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    paused_at timestamp with time zone,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: assets; Type: TABLE; Schema: system; Owner: -
--

CREATE TABLE system.assets (
    instance_id text NOT NULL,
    asset_type text,
    resource_owner text NOT NULL,
    name text NOT NULL,
    content_type text,
    hash text GENERATED ALWAYS AS (md5(data)) STORED,
    data bytea,
    updated_at timestamp with time zone
);


--
-- Name: encryption_keys; Type: TABLE; Schema: system; Owner: -
--

CREATE TABLE system.encryption_keys (
    id text NOT NULL,
    key text NOT NULL
);


--
-- Name: objects_federated_logout; Type: TABLE ATTACH; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.objects ATTACH PARTITION cache.objects_federated_logout FOR VALUES IN ('federated_logout');


--
-- Name: objects_id_p_form_callback; Type: TABLE ATTACH; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.objects ATTACH PARTITION cache.objects_id_p_form_callback FOR VALUES IN ('id_p_form_callback');


--
-- Name: string_keys_federated_logout; Type: TABLE ATTACH; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.string_keys ATTACH PARTITION cache.string_keys_federated_logout FOR VALUES IN ('federated_logout');


--
-- Name: string_keys_id_p_form_callback; Type: TABLE ATTACH; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.string_keys ATTACH PARTITION cache.string_keys_id_p_form_callback FOR VALUES IN ('id_p_form_callback');


--
-- Name: resource_counts id; Type: DEFAULT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.resource_counts ALTER COLUMN id SET DEFAULT nextval('projections.resource_counts_id_seq'::regclass);


--
-- Name: river_job id; Type: DEFAULT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_job ALTER COLUMN id SET DEFAULT nextval('queue.river_job_id_seq'::regclass);


--
-- Data for Name: current_sequences; Type: TABLE DATA; Schema: adminapi; Owner: -
--

COPY adminapi.current_sequences (view_name, current_sequence, event_date, last_successful_spooler_run, instance_id) FROM stdin;
\.


--
-- Data for Name: failed_events; Type: TABLE DATA; Schema: adminapi; Owner: -
--

COPY adminapi.failed_events (view_name, failed_sequence, failure_count, err_msg, instance_id, last_failed) FROM stdin;
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: adminapi; Owner: -
--

COPY adminapi.locks (locker_id, locked_until, view_name, instance_id) FROM stdin;
\.


--
-- Data for Name: styling; Type: TABLE DATA; Schema: adminapi; Owner: -
--

COPY adminapi.styling (aggregate_id, creation_date, change_date, label_policy_state, sequence, primary_color, background_color, warn_color, font_color, primary_color_dark, background_color_dark, warn_color_dark, font_color_dark, logo_url, icon_url, logo_dark_url, icon_dark_url, font_url, err_msg_popup, disable_watermark, hide_login_name_suffix, instance_id) FROM stdin;
\.


--
-- Data for Name: styling2; Type: TABLE DATA; Schema: adminapi; Owner: -
--

COPY adminapi.styling2 (aggregate_id, creation_date, change_date, label_policy_state, sequence, primary_color, background_color, warn_color, font_color, primary_color_dark, background_color_dark, warn_color_dark, font_color_dark, logo_url, icon_url, logo_dark_url, icon_dark_url, font_url, err_msg_popup, disable_watermark, hide_login_name_suffix, instance_id, owner_removed) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	3	22	#5469d4	#fafafa	#cd3d56	#000000	#2073c4	#111827	#ff3b5b	#ffffff						f	f	f	338293185505656835	f
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	1	23	#5469d4	#fafafa	#cd3d56	#000000	#2073c4	#111827	#ff3b5b	#ffffff						f	f	f	338293185505656835	f
\.


--
-- Data for Name: auth_requests; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.auth_requests (id, request, code, request_type, creation_date, change_date, instance_id) FROM stdin;
\.


--
-- Data for Name: current_sequences; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.current_sequences (view_name, current_sequence, event_date, last_successful_spooler_run, instance_id) FROM stdin;
\.


--
-- Data for Name: failed_events; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.failed_events (view_name, failed_sequence, failure_count, err_msg, instance_id, last_failed) FROM stdin;
\.


--
-- Data for Name: idp_configs; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.idp_configs (idp_config_id, creation_date, change_date, sequence, aggregate_id, name, idp_state, idp_provider_type, is_oidc, oidc_client_id, oidc_client_secret, oidc_issuer, oidc_scopes, oidc_idp_display_name_mapping, oidc_idp_username_mapping, styling_type, oauth_authorization_endpoint, oauth_token_endpoint, auto_register, jwt_endpoint, jwt_keys_endpoint, jwt_header_name, instance_id) FROM stdin;
\.


--
-- Data for Name: idp_configs2; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.idp_configs2 (idp_config_id, creation_date, change_date, sequence, aggregate_id, name, idp_state, idp_provider_type, is_oidc, oidc_client_id, oidc_client_secret, oidc_issuer, oidc_scopes, oidc_idp_display_name_mapping, oidc_idp_username_mapping, styling_type, oauth_authorization_endpoint, oauth_token_endpoint, auto_register, jwt_endpoint, jwt_keys_endpoint, jwt_header_name, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: idp_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.idp_providers (aggregate_id, idp_config_id, creation_date, change_date, sequence, name, idp_config_type, idp_provider_type, idp_state, styling_type, instance_id) FROM stdin;
\.


--
-- Data for Name: idp_providers2; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.idp_providers2 (aggregate_id, idp_config_id, creation_date, change_date, sequence, name, idp_config_type, idp_provider_type, idp_state, styling_type, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.locks (locker_id, locked_until, view_name, instance_id) FROM stdin;
\.


--
-- Data for Name: org_project_mapping; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.org_project_mapping (org_id, project_id, project_grant_id, instance_id) FROM stdin;
\.


--
-- Data for Name: org_project_mapping2; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.org_project_mapping2 (org_id, project_id, project_grant_id, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (id, creation_date, change_date, resource_owner, token, client_id, user_agent_id, user_id, auth_time, idle_expiration, expiration, sequence, scopes, audience, amr, instance_id, actor) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.tokens (id, creation_date, change_date, resource_owner, application_id, user_agent_id, user_id, expiration, sequence, scopes, audience, preferred_language, refresh_token_id, is_pat, instance_id, actor) FROM stdin;
338293185506377731	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505722371	\N	\N	338293185506312195	2029-01-01 00:00:00+00	2	\N	\N	\N	\N	t	338293185505656835	\N
\.


--
-- Data for Name: user_external_idps; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.user_external_idps (external_user_id, idp_config_id, user_id, idp_name, user_display_name, creation_date, change_date, sequence, resource_owner, instance_id) FROM stdin;
\.


--
-- Data for Name: user_external_idps2; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.user_external_idps2 (external_user_id, idp_config_id, user_id, idp_name, user_display_name, creation_date, change_date, sequence, resource_owner, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.user_sessions (creation_date, change_date, resource_owner, state, user_agent_id, user_id, user_name, password_verification, second_factor_verification, multi_factor_verification, sequence, second_factor_verification_type, multi_factor_verification_type, user_display_name, login_name, external_login_verification, selected_idp_config_id, passwordless_verification, avatar_key, instance_id, id) FROM stdin;
2025-09-17 18:41:21.917903+00	2025-09-17 18:41:21.917903+00	338293185505722371	0		338293185506246659	\N	2025-09-17 18:41:21.917903+00	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	338293185505656835	V1_338293236525170691
2025-09-17 20:46:07.865056+00	2025-09-17 20:46:26.122538+00	338293185505722371	0		338303017977643011	\N	2025-09-17 20:46:26.122538+00	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	338293185505656835	V1_338305795848404995
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (id, creation_date, change_date, resource_owner, user_state, password_set, password_change_required, password_change, last_login, user_name, login_names, preferred_login_name, first_name, last_name, nick_name, display_name, preferred_language, gender, email, is_email_verified, phone, is_phone_verified, country, locality, postal_code, region, street_address, otp_state, mfa_max_set_up, mfa_init_skipped, sequence, init_required, username_change_required, machine_name, machine_description, user_type, u2f_tokens, passwordless_tokens, avatar_key, passwordless_init_required, password_init_required, instance_id) FROM stdin;
\.


--
-- Data for Name: users2; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users2 (id, creation_date, change_date, resource_owner, user_state, password_set, password_change_required, password_change, last_login, user_name, login_names, preferred_login_name, first_name, last_name, nick_name, display_name, preferred_language, gender, email, is_email_verified, phone, is_phone_verified, country, locality, postal_code, region, street_address, otp_state, mfa_max_set_up, mfa_init_skipped, sequence, init_required, username_change_required, machine_name, machine_description, user_type, u2f_tokens, passwordless_tokens, avatar_key, passwordless_init_required, password_init_required, instance_id, owner_removed, otp_sms_added, otp_email_added) FROM stdin;
\.


--
-- Data for Name: users3; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users3 (instance_id, id, resource_owner, change_date, password_set, password_change, last_login, init_required, mfa_init_skipped, username_change_required, passwordless_init_required, password_init_required) FROM stdin;
338293185505656835	338293185506246659	338293185505722371	2025-09-17 18:41:24.208211+00	t	2025-09-17 18:40:52.502632+00	\N	\N	2025-09-17 18:41:24.208211+00	\N	\N	f
338293185505656835	338303017977643011	338293185505722371	2025-09-17 20:46:27.721909+00	t	2025-09-17 20:46:25.16009+00	\N	\N	2025-09-17 20:46:27.721909+00	\N	\N	f
\.


--
-- Data for Name: objects_federated_logout; Type: TABLE DATA; Schema: cache; Owner: -
--

COPY cache.objects_federated_logout (cache_name, id, created_at, last_used_at, payload) FROM stdin;
\.


--
-- Data for Name: objects_id_p_form_callback; Type: TABLE DATA; Schema: cache; Owner: -
--

COPY cache.objects_id_p_form_callback (cache_name, id, created_at, last_used_at, payload) FROM stdin;
\.


--
-- Data for Name: string_keys_federated_logout; Type: TABLE DATA; Schema: cache; Owner: -
--

COPY cache.string_keys_federated_logout (cache_name, index_id, index_key, object_id) FROM stdin;
\.


--
-- Data for Name: string_keys_id_p_form_callback; Type: TABLE DATA; Schema: cache; Owner: -
--

COPY cache.string_keys_id_p_form_callback (cache_name, index_id, index_key, object_id) FROM stdin;
\.


--
-- Data for Name: events2; Type: TABLE DATA; Schema: eventstore; Owner: -
--

COPY eventstore.events2 (instance_id, aggregate_type, aggregate_id, event_type, sequence, revision, created_at, payload, creator, owner, "position", in_tx_order) FROM stdin;
	system	SYSTEM	system.migration.started	1	1	2025-09-17 18:40:51.421115+00	{"name": "14_events_push"}	system	SYSTEM	1758134451.421115	1
	system	SYSTEM	system.migration.done	2	1	2025-09-17 18:40:51.426908+00	{"name": "14_events_push"}	system	SYSTEM	1758134451.426908	1
	system	SYSTEM	system.migration.started	3	1	2025-09-17 18:40:51.428838+00	{"name": "40_init_push_func_v4"}	system	SYSTEM	1758134451.428838	1
	system	SYSTEM	system.migration.done	4	1	2025-09-17 18:40:51.455613+00	{"name": "40_init_push_func_v4"}	system	SYSTEM	1758134451.455613	1
	system	SYSTEM	system.migration.started	5	1	2025-09-17 18:40:51.464622+00	{"name": "01_tables"}	system	SYSTEM	1758134451.464622	1
	system	SYSTEM	system.migration.done	6	1	2025-09-17 18:40:51.489077+00	{"name": "01_tables"}	system	SYSTEM	1758134451.489077	1
	system	SYSTEM	system.migration.started	7	1	2025-09-17 18:40:51.490747+00	{"name": "02_assets"}	system	SYSTEM	1758134451.490747	1
	system	SYSTEM	system.migration.done	8	1	2025-09-17 18:40:51.493695+00	{"name": "02_assets"}	system	SYSTEM	1758134451.493695	1
	system	SYSTEM	system.migration.started	9	1	2025-09-17 18:40:51.49506+00	{"name": "28_add_search_table"}	system	SYSTEM	1758134451.495060	1
	system	SYSTEM	system.migration.done	10	1	2025-09-17 18:40:51.501956+00	{"name": "28_add_search_table"}	system	SYSTEM	1758134451.501956	1
	system	SYSTEM	system.migration.started	11	1	2025-09-17 18:40:51.503276+00	{"name": "31_add_aggregate_index_to_fields"}	system	SYSTEM	1758134451.503276	1
	system	SYSTEM	system.migration.done	12	1	2025-09-17 18:40:51.506738+00	{"name": "31_add_aggregate_index_to_fields"}	system	SYSTEM	1758134451.506738	1
	system	SYSTEM	system.migration.started	13	1	2025-09-17 18:40:51.508033+00	{"name": "46_init_permission_functions"}	system	SYSTEM	1758134451.508033	1
	system	SYSTEM	system.migration.done	14	1	2025-09-17 18:40:51.515904+00	{"name": "46_init_permission_functions"}	system	SYSTEM	1758134451.515904	1
	system	SYSTEM	system.migration.started	15	1	2025-09-17 18:40:51.517569+00	{"name": "03_default_instance"}	system	SYSTEM	1758134451.517569	1
338293185505656835	instance	338293185505656835	instance.added	1	1	2025-09-17 18:40:52.502632+00	{"name": "ZITADEL"}		338293185505656835	1758134452.502632	1
338293185505656835	instance	338293185505656835	instance.default.language.set	2	1	2025-09-17 18:40:52.502632+00	{"language": "en"}		338293185505656835	1758134452.502632	2
338293185505656835	instance	338293185505656835	instance.secret.generator.added	3	1	2025-09-17 18:40:52.502632+00	{"length": 64, "generatorType": 7, "includeDigits": true, "includeLowerLetters": true, "includeUpperLetters": true}		338293185505656835	1758134452.502632	3
338293185505656835	instance	338293185505656835	instance.secret.generator.added	4	1	2025-09-17 18:40:52.502632+00	{"expiry": 259200000000000, "length": 6, "generatorType": 1, "includeDigits": true, "includeUpperLetters": true}		338293185505656835	1758134452.502632	4
338293185505656835	instance	338293185505656835	instance.secret.generator.added	5	1	2025-09-17 18:40:52.502632+00	{"expiry": 3600000000000, "length": 6, "generatorType": 2, "includeDigits": true, "includeUpperLetters": true}		338293185505656835	1758134452.502632	5
338293185505656835	instance	338293185505656835	instance.secret.generator.added	6	1	2025-09-17 18:40:52.502632+00	{"expiry": 3600000000000, "length": 6, "generatorType": 3, "includeDigits": true, "includeUpperLetters": true}		338293185505656835	1758134452.502632	6
338293185505656835	instance	338293185505656835	instance.secret.generator.added	7	1	2025-09-17 18:40:52.502632+00	{"expiry": 3600000000000, "length": 6, "generatorType": 5, "includeDigits": true, "includeUpperLetters": true}		338293185505656835	1758134452.502632	7
338293185505656835	instance	338293185505656835	instance.secret.generator.added	8	1	2025-09-17 18:40:52.502632+00	{"expiry": 3600000000000, "length": 12, "generatorType": 6, "includeDigits": true, "includeLowerLetters": true, "includeUpperLetters": true}		338293185505656835	1758134452.502632	8
338293185505656835	instance	338293185505656835	instance.secret.generator.added	9	1	2025-09-17 18:40:52.502632+00	{"length": 32, "generatorType": 4, "includeDigits": true, "includeLowerLetters": true, "includeUpperLetters": true}		338293185505656835	1758134452.502632	9
338293185505656835	instance	338293185505656835	instance.secret.generator.added	10	1	2025-09-17 18:40:52.502632+00	{"expiry": 300000000000, "length": 8, "generatorType": 8, "includeDigits": true}		338293185505656835	1758134452.502632	10
338293185505656835	instance	338293185505656835	instance.secret.generator.added	11	1	2025-09-17 18:40:52.502632+00	{"expiry": 300000000000, "length": 8, "generatorType": 9, "includeDigits": true}		338293185505656835	1758134452.502632	11
338293185505656835	instance	338293185505656835	instance.policy.password.complexity.added	12	1	2025-09-17 18:40:52.502632+00	{"hasNumber": true, "hasSymbol": true, "minLength": 8, "hasLowercase": true, "hasUppercase": true}		338293185505656835	1758134452.502632	12
338293185505656835	instance	338293185505656835	instance.policy.password.age.added	13	1	2025-09-17 18:40:52.502632+00	{}		338293185505656835	1758134452.502632	13
338293185505656835	instance	338293185505656835	instance.policy.domain.added	14	1	2025-09-17 18:40:52.502632+00	{}		338293185505656835	1758134452.502632	14
338293185505656835	instance	338293185505656835	instance.policy.login.added	15	1	2025-09-17 18:40:52.502632+00	{"allowRegister": true, "allowExternalIdp": true, "passwordlessType": 1, "mfaInitSkipLifetime": 2592000000000000, "allowDomainDiscovery": true, "allowUsernamePassword": true, "passwordCheckLifetime": 864000000000000, "multiFactorCheckLifetime": 43200000000000, "secondFactorCheckLifetime": 64800000000000, "externalLoginCheckLifetime": 864000000000000}		338293185505656835	1758134452.502632	15
338293185505656835	instance	338293185505656835	instance.policy.login.secondfactor.added	16	1	2025-09-17 18:40:52.502632+00	{"mfaType": 1}		338293185505656835	1758134452.502632	16
338293185505656835	instance	338293185505656835	instance.policy.login.secondfactor.added	17	1	2025-09-17 18:40:52.502632+00	{"mfaType": 2}		338293185505656835	1758134452.502632	17
338293185505656835	instance	338293185505656835	instance.policy.login.multifactor.added	18	1	2025-09-17 18:40:52.502632+00	{"mfaType": 1}		338293185505656835	1758134452.502632	18
338293185505656835	instance	338293185505656835	instance.policy.privacy.added	19	1	2025-09-17 18:40:52.502632+00	{"docsLink": "https://zitadel.com/docs"}		338293185505656835	1758134452.502632	19
338293185505656835	instance	338293185505656835	instance.policy.notification.added	20	1	2025-09-17 18:40:52.502632+00	{"passwordChange": true}		338293185505656835	1758134452.502632	20
338293185505656835	instance	338293185505656835	instance.policy.lockout.added	21	1	2025-09-17 18:40:52.502632+00	{"showLockOutFailures": true}		338293185505656835	1758134452.502632	21
	system	SYSTEM	system.migration.done	271	1	2025-09-17 18:40:53.384657+00	{"name": "projections.debug_events"}	system	SYSTEM	1758134453.384657	1
338293185505656835	instance	338293185505656835	instance.policy.label.added	22	1	2025-09-17 18:40:52.502632+00	{"fontColor": "#000000", "warnColor": "#cd3d56", "primaryColor": "#5469d4", "fontColorDark": "#ffffff", "warnColorDark": "#ff3b5b", "backgroundColor": "#fafafa", "primaryColorDark": "#2073c4", "backgroundColorDark": "#111827"}		338293185505656835	1758134452.502632	22
338293185505656835	instance	338293185505656835	instance.policy.label.activated	23	1	2025-09-17 18:40:52.502632+00	{}		338293185505656835	1758134452.502632	23
338293185505656835	instance	338293185505656835	instance.mail.template.added	24	1	2025-09-17 18:40:52.502632+00	{"template": "CjwhZG9jdHlwZSBodG1sPgo8aHRtbCB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVybjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSI+CjxoZWFkPgogIDx0aXRsZT4KCiAgPC90aXRsZT4KICA8IS0tW2lmICFtc29dPjwhLS0+CiAgPG1ldGEgaHR0cC1lcXVpdj0iWC1VQS1Db21wYXRpYmxlIiBjb250ZW50PSJJRT1lZGdlIj4KICA8IS0tPCFbZW5kaWZdLS0+CiAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgogIDxtZXRhIG5hbWU9InZpZXdwb3J0IiBjb250ZW50PSJ3aWR0aD1kZXZpY2Utd2lkdGgsIGluaXRpYWwtc2NhbGU9MSI+CiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4KICAgICNvdXRsb29rIGEgeyBwYWRkaW5nOjA7IH0KICAgIGJvZHkgeyBtYXJnaW46MDtwYWRkaW5nOjA7LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OjEwMCU7LW1zLXRleHQtc2l6ZS1hZGp1c3Q6MTAwJTsgfQogICAgdGFibGUsIHRkIHsgYm9yZGVyLWNvbGxhcHNlOmNvbGxhcHNlO21zby10YWJsZS1sc3BhY2U6MHB0O21zby10YWJsZS1yc3BhY2U6MHB0OyB9CiAgICBpbWcgeyBib3JkZXI6MDtoZWlnaHQ6YXV0bztsaW5lLWhlaWdodDoxMDAlOyBvdXRsaW5lOm5vbmU7dGV4dC1kZWNvcmF0aW9uOm5vbmU7LW1zLWludGVycG9sYXRpb24tbW9kZTpiaWN1YmljOyB9CiAgICBwIHsgZGlzcGxheTpibG9jazttYXJnaW46MTNweCAwOyB9CiAgPC9zdHlsZT4KICA8IS0tW2lmIG1zb10+CiAgPHhtbD4KICAgIDxvOk9mZmljZURvY3VtZW50U2V0dGluZ3M+CiAgICAgIDxvOkFsbG93UE5HLz4KICAgICAgPG86UGl4ZWxzUGVySW5jaD45NjwvbzpQaXhlbHNQZXJJbmNoPgogICAgPC9vOk9mZmljZURvY3VtZW50U2V0dGluZ3M+CiAgPC94bWw+CiAgPCFbZW5kaWZdLS0+CiAgPCEtLVtpZiBsdGUgbXNvIDExXT4KICA8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgogICAgLm1qLW91dGxvb2stZ3JvdXAtZml4IHsgd2lkdGg6MTAwJSAhaW1wb3J0YW50OyB9CiAgPC9zdHlsZT4KICA8IVtlbmRpZl0tLT4KCgogIDxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+CiAgICBAbWVkaWEgb25seSBzY3JlZW4gYW5kIChtaW4td2lkdGg6NDgwcHgpIHsKICAgICAgLm1qLWNvbHVtbi1wZXItMTAwIHsgd2lkdGg6MTAwJSAhaW1wb3J0YW50OyBtYXgtd2lkdGg6IDEwMCU7IH0KICAgICAgLm1qLWNvbHVtbi1wZXItNjAgeyB3aWR0aDo2MCUgIWltcG9ydGFudDsgbWF4LXdpZHRoOiA2MCU7IH0KICAgIH0KICA8L3N0eWxlPgoKCiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4KCgoKICAgIEBtZWRpYSBvbmx5IHNjcmVlbiBhbmQgKG1heC13aWR0aDo0ODBweCkgewogICAgICB0YWJsZS5tai1mdWxsLXdpZHRoLW1vYmlsZSB7IHdpZHRoOiAxMDAlICFpbXBvcnRhbnQ7IH0KICAgICAgdGQubWotZnVsbC13aWR0aC1tb2JpbGUgeyB3aWR0aDogYXV0byAhaW1wb3J0YW50OyB9CiAgICB9CgogIDwvc3R5bGU+CiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4uc2hhZG93IGEgewogICAgYm94LXNoYWRvdzogMHB4IDNweCAxcHggLTJweCByZ2JhKDAsIDAsIDAsIDAuMiksIDBweCAycHggMnB4IDBweCByZ2JhKDAsIDAsIDAsIDAuMTQpLCAwcHggMXB4IDVweCAwcHggcmdiYSgwLCAwLCAwLCAwLjEyKTsKICB9PC9zdHlsZT4KCiAge3tpZiAuRm9udFVSTH19CiAgPHN0eWxlPgogICAgQGZvbnQtZmFjZSB7CiAgICAgIGZvbnQtZmFtaWx5OiAne3suRm9udEZhY2VGYW1pbHl9fSc7CiAgICAgIGZvbnQtc3R5bGU6IG5vcm1hbDsKICAgICAgZm9udC1kaXNwbGF5OiBzd2FwOwogICAgICBzcmM6IHVybCh7ey5Gb250VVJMfX0pOwogICAgfQogIDwvc3R5bGU+CiAge3tlbmR9fQoKPC9oZWFkPgo8Ym9keSBzdHlsZT0id29yZC1zcGFjaW5nOm5vcm1hbDsiPgoKCjxkaXYKICAgICAgICBzdHlsZT0iIgo+CgogIDx0YWJsZQogICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9ImJhY2tncm91bmQ6e3suQmFja2dyb3VuZENvbG9yfX07YmFja2dyb3VuZC1jb2xvcjp7ey5CYWNrZ3JvdW5kQ29sb3J9fTt3aWR0aDoxMDAlO2JvcmRlci1yYWRpdXM6MTZweDsiCiAgPgogICAgPHRib2R5PgogICAgPHRyPgogICAgICA8dGQ+CgoKICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIGNsYXNzPSIiIHN0eWxlPSJ3aWR0aDo4MDBweDsiIHdpZHRoPSI4MDAiID48dHI+PHRkIHN0eWxlPSJsaW5lLWhlaWdodDowcHg7Zm9udC1zaXplOjBweDttc28tbGluZS1oZWlnaHQtcnVsZTpleGFjdGx5OyI+PCFbZW5kaWZdLS0+CgoKICAgICAgICA8ZGl2ICBzdHlsZT0ibWFyZ2luOjBweCBhdXRvO2JvcmRlci1yYWRpdXM6MTZweDttYXgtd2lkdGg6ODAwcHg7Ij4KCiAgICAgICAgICA8dGFibGUKICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9IndpZHRoOjEwMCU7Ym9yZGVyLXJhZGl1czoxNnB4OyIKICAgICAgICAgID4KICAgICAgICAgICAgPHRib2R5PgogICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICBzdHlsZT0iZGlyZWN0aW9uOmx0cjtmb250LXNpemU6MHB4O3BhZGRpbmc6MjBweCAwO3BhZGRpbmctbGVmdDowO3RleHQtYWxpZ246Y2VudGVyOyIKICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgcm9sZT0icHJlc2VudGF0aW9uIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRyPjx0ZCBjbGFzcz0iIiB3aWR0aD0iODAwcHgiID48IVtlbmRpZl0tLT4KCiAgICAgICAgICAgICAgICA8dGFibGUKICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9IndpZHRoOjEwMCU7IgogICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICA8dGQ+CgoKICAgICAgICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjx0YWJsZSBhbGlnbj0iY2VudGVyIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgY2xhc3M9IiIgc3R5bGU9IndpZHRoOjgwMHB4OyIgd2lkdGg9IjgwMCIgPjx0cj48dGQgc3R5bGU9ImxpbmUtaGVpZ2h0OjBweDtmb250LXNpemU6MHB4O21zby1saW5lLWhlaWdodC1ydWxlOmV4YWN0bHk7Ij48IVtlbmRpZl0tLT4KCgogICAgICAgICAgICAgICAgICAgICAgPGRpdiAgc3R5bGU9Im1hcmdpbjowcHggYXV0bzttYXgtd2lkdGg6ODAwcHg7Ij4KCiAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIGJvcmRlcj0iMCIgY2VsbHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIiByb2xlPSJwcmVzZW50YXRpb24iIHN0eWxlPSJ3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgIDx0Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImRpcmVjdGlvbjpsdHI7Zm9udC1zaXplOjBweDtwYWRkaW5nOjA7dGV4dC1hbGlnbjpjZW50ZXI7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgcm9sZT0icHJlc2VudGF0aW9uIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRyPjx0ZCBjbGFzcz0iIiBzdHlsZT0id2lkdGg6ODAwcHg7IiA+PCFbZW5kaWZdLS0+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xhc3M9Im1qLWNvbHVtbi1wZXItMTAwIG1qLW91dGxvb2stZ3JvdXAtZml4IiBzdHlsZT0iZm9udC1zaXplOjA7bGluZS1oZWlnaHQ6MDt0ZXh0LWFsaWduOmxlZnQ7ZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6MTAwJTtkaXJlY3Rpb246bHRyOyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjx0YWJsZSBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiA+PHRyPjx0ZCBzdHlsZT0idmVydGljYWwtYWxpZ246dG9wO3dpZHRoOjgwMHB4OyIgPjwhW2VuZGlmXS0tPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGFzcz0ibWotY29sdW1uLXBlci0xMDAgbWotb3V0bG9vay1ncm91cC1maXgiIHN0eWxlPSJmb250LXNpemU6MHB4O3RleHQtYWxpZ246bGVmdDtkaXJlY3Rpb246bHRyO2Rpc3BsYXk6aW5saW5lLWJsb2NrO3ZlcnRpY2FsLWFsaWduOnRvcDt3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvcmRlcj0iMCIgY2VsbHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIiByb2xlPSJwcmVzZW50YXRpb24iIHdpZHRoPSIxMDAlIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjp0b3A7cGFkZGluZzowOyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7e2lmIC5Mb2dvVVJMfX0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iIiB3aWR0aD0iMTAwJSIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRib2R5PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgc3R5bGU9ImZvbnQtc2l6ZTowcHg7cGFkZGluZzo1MHB4IDAgMzBweCAwO3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iYm9yZGVyLWNvbGxhcHNlOmNvbGxhcHNlO2JvcmRlci1zcGFjaW5nOjBweDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgc3R5bGU9IndpZHRoOjE4MHB4OyI+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGltZwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZWlnaHQ9ImF1dG8iIHNyYz0ie3suTG9nb1VSTH19IiBzdHlsZT0iYm9yZGVyOjA7Ym9yZGVyLXJhZGl1czo4cHg7ZGlzcGxheTpibG9jaztvdXRsaW5lOm5vbmU7dGV4dC1kZWNvcmF0aW9uOm5vbmU7aGVpZ2h0OmF1dG87d2lkdGg6MTAwJTtmb250LXNpemU6MTNweDsiIHdpZHRoPSIxODAiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAge3tlbmR9fQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCEtLVtpZiBtc28gfCBJRV0+PC90ZD48L3RyPjwvdGFibGU+PCFbZW5kaWZdLS0+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCEtLVtpZiBtc28gfCBJRV0+PC90ZD48L3RyPjwvdGFibGU+PCFbZW5kaWZdLS0+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPC90Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj4KCgogICAgICAgICAgICAgICAgICAgICAgPCEtLVtpZiBtc28gfCBJRV0+PC90ZD48L3RyPjwvdGFibGU+PCFbZW5kaWZdLS0+CgoKICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48L3RkPjwvdHI+PHRyPjx0ZCBjbGFzcz0iIiB3aWR0aD0iODAwcHgiID48IVtlbmRpZl0tLT4KCiAgICAgICAgICAgICAgICA8dGFibGUKICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9IndpZHRoOjEwMCU7IgogICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICA8dGQ+CgoKICAgICAgICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjx0YWJsZSBhbGlnbj0iY2VudGVyIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgY2xhc3M9IiIgc3R5bGU9IndpZHRoOjgwMHB4OyIgd2lkdGg9IjgwMCIgPjx0cj48dGQgc3R5bGU9ImxpbmUtaGVpZ2h0OjBweDtmb250LXNpemU6MHB4O21zby1saW5lLWhlaWdodC1ydWxlOmV4YWN0bHk7Ij48IVtlbmRpZl0tLT4KCgogICAgICAgICAgICAgICAgICAgICAgPGRpdiAgc3R5bGU9Im1hcmdpbjowcHggYXV0bzttYXgtd2lkdGg6ODAwcHg7Ij4KCiAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIGJvcmRlcj0iMCIgY2VsbHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIiByb2xlPSJwcmVzZW50YXRpb24iIHN0eWxlPSJ3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgIDx0Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImRpcmVjdGlvbjpsdHI7Zm9udC1zaXplOjBweDtwYWRkaW5nOjA7dGV4dC1hbGlnbjpjZW50ZXI7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgcm9sZT0icHJlc2VudGF0aW9uIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRyPjx0ZCBjbGFzcz0iIiBzdHlsZT0idmVydGljYWwtYWxpZ246dG9wO3dpZHRoOjQ4MHB4OyIgPjwhW2VuZGlmXS0tPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsYXNzPSJtai1jb2x1bW4tcGVyLTYwIG1qLW91dGxvb2stZ3JvdXAtZml4IiBzdHlsZT0iZm9udC1zaXplOjBweDt0ZXh0LWFsaWduOmxlZnQ7ZGlyZWN0aW9uOmx0cjtkaXNwbGF5OmlubGluZS1ibG9jazt2ZXJ0aWNhbC1hbGlnbjp0b3A7d2lkdGg6MTAwJTsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiB3aWR0aD0iMTAwJSIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgc3R5bGU9InZlcnRpY2FsLWFsaWduOnRvcDtwYWRkaW5nOjA7Ij4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iIiB3aWR0aD0iMTAwJSIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGJvZHk+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbGlnbj0iY2VudGVyIiBzdHlsZT0iZm9udC1zaXplOjBweDtwYWRkaW5nOjEwcHggMjVweDt3b3JkLWJyZWFrOmJyZWFrLXdvcmQ7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0eWxlPSJmb250LWZhbWlseTp7ey5Gb250RmFtaWx5fX07Zm9udC1zaXplOjI0cHg7Zm9udC13ZWlnaHQ6NTAwO2xpbmUtaGVpZ2h0OjE7dGV4dC1hbGlnbjpjZW50ZXI7Y29sb3I6e3suRm9udENvbG9yfX07IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID57ey5HcmVldGluZ319PC9kaXY+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIHN0eWxlPSJmb250LXNpemU6MHB4O3BhZGRpbmc6MTBweCAyNXB4O3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImZvbnQtZmFtaWx5Ont7LkZvbnRGYW1pbHl9fTtmb250LXNpemU6MTZweDtmb250LXdlaWdodDpsaWdodDtsaW5lLWhlaWdodDoxLjU7dGV4dC1hbGlnbjpjZW50ZXI7Y29sb3I6e3suRm9udENvbG9yfX07IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID57ey5UZXh0fX08L2Rpdj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIHZlcnRpY2FsLWFsaWduPSJtaWRkbGUiIGNsYXNzPSJzaGFkb3ciIHN0eWxlPSJmb250LXNpemU6MHB4O3BhZGRpbmc6MTBweCAyNXB4O3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iYm9yZGVyLWNvbGxhcHNlOnNlcGFyYXRlO2xpbmUtaGVpZ2h0OjEwMCU7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYmdjb2xvcj0ie3suUHJpbWFyeUNvbG9yfX0iIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci1yYWRpdXM6NnB4O2N1cnNvcjphdXRvO21zby1wYWRkaW5nLWFsdDoxMHB4IDI1cHg7YmFja2dyb3VuZDp7ey5QcmltYXJ5Q29sb3J9fTsiIHZhbGlnbj0ibWlkZGxlIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhyZWY9Int7LlVSTH19IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIgbm90cmFjayIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO2JhY2tncm91bmQ6e3suUHJpbWFyeUNvbG9yfX07Y29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTp7ey5Gb250RmFtaWx5fX07Zm9udC1zaXplOjE0cHg7Zm9udC13ZWlnaHQ6NTAwO2xpbmUtaGVpZ2h0OjEyMCU7bWFyZ2luOjA7dGV4dC1kZWNvcmF0aW9uOm5vbmU7dGV4dC10cmFuc2Zvcm06bm9uZTtwYWRkaW5nOjEwcHggMjVweDttc28tcGFkZGluZy1hbHQ6MHB4O2JvcmRlci1yYWRpdXM6NnB4OyIgdGFyZ2V0PSJfYmxhbmsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAge3suQnV0dG9uVGV4dH19CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9hPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7e2lmIC5JbmNsdWRlRm9vdGVyfX0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgc3R5bGU9ImZvbnQtc2l6ZTowcHg7cGFkZGluZzoxMHB4IDI1cHg7cGFkZGluZy10b3A6MjBweDtwYWRkaW5nLXJpZ2h0OjIwcHg7cGFkZGluZy1ib3R0b206MjBweDtwYWRkaW5nLWxlZnQ6MjBweDt3b3JkLWJyZWFrOmJyZWFrLXdvcmQ7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHlsZT0iYm9yZGVyLXRvcDpzb2xpZCAycHggI2RiZGJkYjtmb250LXNpemU6MXB4O21hcmdpbjowcHggYXV0bzt3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9wPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHN0eWxlPSJib3JkZXItdG9wOnNvbGlkIDJweCAjZGJkYmRiO2ZvbnQtc2l6ZToxcHg7bWFyZ2luOjBweCBhdXRvO3dpZHRoOjQ0MHB4OyIgcm9sZT0icHJlc2VudGF0aW9uIiB3aWR0aD0iNDQwcHgiID48dHI+PHRkIHN0eWxlPSJoZWlnaHQ6MDtsaW5lLWhlaWdodDowOyI+ICZuYnNwOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+PC90cj48L3RhYmxlPjwhW2VuZGlmXS0tPgoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgc3R5bGU9ImZvbnQtc2l6ZTowcHg7cGFkZGluZzoxNnB4O3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImZvbnQtZmFtaWx5Ont7LkZvbnRGYW1pbHl9fTtmb250LXNpemU6MTNweDtsaW5lLWhlaWdodDoxO3RleHQtYWxpZ246Y2VudGVyO2NvbG9yOnt7LkZvbnRDb2xvcn19OyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+e3suRm9vdGVyVGV4dH19PC9kaXY+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHt7ZW5kfX0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48L3RkPjwvdHI+PC90YWJsZT48IVtlbmRpZl0tLT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PgoKCiAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48L3RkPjwvdHI+PC90YWJsZT48IVtlbmRpZl0tLT4KCgogICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjwvdGQ+PC90cj48L3RhYmxlPjwhW2VuZGlmXS0tPgogICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICA8L2Rpdj4KCgogICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjwvdGQ+PC90cj48L3RhYmxlPjwhW2VuZGlmXS0tPgoKCiAgICAgIDwvdGQ+CiAgICA8L3RyPgogICAgPC90Ym9keT4KICA8L3RhYmxlPgoKPC9kaXY+Cgo8L2JvZHk+CjwvaHRtbD4K"}		338293185505656835	1758134452.502632	24
338293185505656835	org	338293185505722371	org.added	1	1	2025-09-17 18:40:52.502632+00	{"name": "ZITADEL"}		338293185505722371	1758134452.502632	25
338293185505656835	org	338293185505722371	org.domain.added	2	1	2025-09-17 18:40:52.502632+00	{"domain": "zitadel.localhost"}		338293185505722371	1758134452.502632	26
338293185505656835	org	338293185505722371	org.domain.verified	3	1	2025-09-17 18:40:52.502632+00	{"domain": "zitadel.localhost"}		338293185505722371	1758134452.502632	27
338293185505656835	org	338293185505722371	org.domain.primary.set	4	1	2025-09-17 18:40:52.502632+00	{"domain": "zitadel.localhost"}		338293185505722371	1758134452.502632	28
338293185505656835	instance	338293185505656835	instance.default.org.set	25	1	2025-09-17 18:40:52.502632+00	{"orgId": "338293185505722371"}		338293185505656835	1758134452.502632	29
338293185505656835	user	338293185506246659	user.human.added	1	2	2025-09-17 18:40:52.502632+00	{"email": "zitadel-admin@zitadel.localhost", "lastName": "Admin", "userName": "zitadel-admin@zitadel.localhost", "firstName": "ZITADEL", "displayName": "ZITADEL Admin", "encodedHash": "$2a$14$je2Z.CcZrTZPI8nSt218U.nT4a4dXLrJ.expbnwqXRc5MFO/Uz6E2", "preferredLanguage": "en"}		338293185505722371	1758134452.502632	30
338293185505656835	user	338293185506246659	user.human.email.verified	2	2	2025-09-17 18:40:52.502632+00	\N		338293185505722371	1758134452.502632	31
338293185505656835	org	338293185505722371	org.member.added	5	1	2025-09-17 18:40:52.502632+00	{"roles": ["ORG_OWNER"], "userId": "338293185506246659"}		338293185505722371	1758134452.502632	32
338293185505656835	instance	338293185505656835	instance.member.added	26	1	2025-09-17 18:40:52.502632+00	{"roles": ["IAM_OWNER"], "userId": "338293185506246659"}		338293185505656835	1758134452.502632	33
338293185505656835	user	338293185506312195	user.machine.added	1	2	2025-09-17 18:40:52.502632+00	{"name": "Automatically Initialized IAM_LOGIN_CLIENT", "userName": "login-client"}		338293185505722371	1758134452.502632	34
338293185505656835	instance	338293185505656835	instance.member.added	27	1	2025-09-17 18:40:52.502632+00	{"roles": ["IAM_LOGIN_CLIENT"], "userId": "338293185506312195"}		338293185505656835	1758134452.502632	35
338293185505656835	user	338293185506312195	user.pat.added	2	2	2025-09-17 18:40:52.502632+00	{"scopes": null, "tokenId": "338293185506377731", "expiration": "2029-01-01T00:00:00Z"}		338293185505722371	1758134452.502632	36
338293185505656835	project	338293185505787907	project.added	1	1	2025-09-17 18:40:52.502632+00	{"name": "ZITADEL"}		338293185505722371	1758134452.502632	37
338293185505656835	instance	338293185505656835	instance.iam.project.set	28	1	2025-09-17 18:40:52.502632+00	{"iamProjectId": "338293185505787907"}		338293185505656835	1758134452.502632	38
338293185505656835	project	338293185505787907	project.application.added	2	1	2025-09-17 18:40:52.502632+00	{"name": "Management-API", "appId": "338293185505853443"}		338293185505722371	1758134452.502632	39
338293185505656835	project	338293185505787907	project.application.config.api.added	3	1	2025-09-17 18:40:52.502632+00	{"appId": "338293185505853443", "clientId": "338293186696839171", "authMethodType": 1}		338293185505722371	1758134452.502632	40
338293185505656835	project	338293185505787907	project.application.added	4	1	2025-09-17 18:40:52.502632+00	{"name": "Admin-API", "appId": "338293185505918979"}		338293185505722371	1758134452.502632	41
338293185505656835	project	338293185505787907	project.application.config.api.added	5	1	2025-09-17 18:40:52.502632+00	{"appId": "338293185505918979", "clientId": "338293186696904707", "authMethodType": 1}		338293185505722371	1758134452.502632	42
338293185505656835	project	338293185505787907	project.application.added	6	1	2025-09-17 18:40:52.502632+00	{"name": "Auth-API", "appId": "338293185505984515"}		338293185505722371	1758134452.502632	43
338293185505656835	project	338293185505787907	project.application.config.api.added	7	1	2025-09-17 18:40:52.502632+00	{"appId": "338293185505984515", "clientId": "338293186696970243", "authMethodType": 1}		338293185505722371	1758134452.502632	44
338293185505656835	project	338293185505787907	project.application.added	8	1	2025-09-17 18:40:52.502632+00	{"name": "Console", "appId": "338293185506050051"}		338293185505722371	1758134452.502632	45
338293185505656835	project	338293185505787907	project.application.config.oidc.added	9	1	2025-09-17 18:40:52.502632+00	{"appId": "338293185506050051", "devMode": true, "clientId": "338293186697035779", "grantTypes": [0], "responseTypes": [0], "authMethodType": 2, "applicationType": 1}		338293185505722371	1758134452.502632	46
338293185505656835	instance	338293185505656835	instance.iam.console.set	29	1	2025-09-17 18:40:52.502632+00	{"appId": "338293185506050051", "clientId": "338293186697035779"}		338293185505656835	1758134452.502632	47
338293185505656835	instance	338293185505656835	instance.domain.added	30	1	2025-09-17 18:40:52.502632+00	{"domain": "zitadel-3ar3jm.localhost", "generated": true}		338293185505656835	1758134452.502632	48
338293185505656835	project	338293185505787907	project.application.config.oidc.changed	10	1	2025-09-17 18:40:52.502632+00	{"appId": "338293185506050051", "redirectUris": ["http://zitadel-3ar3jm.localhost:8080/ui/console/auth/callback"], "postLogoutRedirectUris": ["http://zitadel-3ar3jm.localhost:8080/ui/console/signedout"]}		338293185505722371	1758134452.502632	49
338293185505656835	instance	338293185505656835	instance.domain.primary.set	31	1	2025-09-17 18:40:52.502632+00	{"domain": "zitadel-3ar3jm.localhost"}		338293185505656835	1758134452.502632	50
338293185505656835	instance	338293185505656835	instance.domain.added	32	1	2025-09-17 18:40:52.502632+00	{"domain": "localhost"}		338293185505656835	1758134452.502632	51
338293185505656835	project	338293185505787907	project.application.config.oidc.changed	11	1	2025-09-17 18:40:52.502632+00	{"appId": "338293185506050051", "redirectUris": ["http://zitadel-3ar3jm.localhost:8080/ui/console/auth/callback", "http://localhost:8080/ui/console/auth/callback"], "postLogoutRedirectUris": ["http://zitadel-3ar3jm.localhost:8080/ui/console/signedout", "http://localhost:8080/ui/console/signedout"]}		338293185505722371	1758134452.502632	52
338293185505656835	instance	338293185505656835	instance.domain.primary.set	33	1	2025-09-17 18:40:52.502632+00	{"domain": "localhost"}		338293185505656835	1758134452.502632	53
338293185505656835	instance	338293185505656835	instance.customtext.set	34	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "InitCode"}		338293185505656835	1758134452.502632	54
338293185505656835	instance	338293185505656835	instance.customtext.set	35	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "User initialisieren", "language": "de", "template": "InitCode"}		338293185505656835	1758134452.502632	55
338293185505656835	instance	338293185505656835	instance.customtext.set	36	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - User initialisieren", "language": "de", "template": "InitCode"}		338293185505656835	1758134452.502632	56
338293185505656835	instance	338293185505656835	instance.customtext.set	37	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "User initialisieren", "language": "de", "template": "InitCode"}		338293185505656835	1758134452.502632	57
338293185505656835	instance	338293185505656835	instance.customtext.set	38	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "Dieser Benutzer wurde soeben im Zitadel erstellt. Mit dem Benutzernamen <br><strong>{{.PreferredLoginName}}</strong><br> kannst du dich anmelden. Nutze den untenstehenden Button, um die Initialisierung abzuschliessen <br>(Code <strong>{{.Code}}</strong>).<br> Falls du dieses Mail nicht angefordert hast, kannst du es einfach ignorieren.", "language": "de", "template": "InitCode"}		338293185505656835	1758134452.502632	58
338293185505656835	instance	338293185505656835	instance.customtext.set	39	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Initialisierung abschliessen", "language": "de", "template": "InitCode"}		338293185505656835	1758134452.502632	59
338293185505656835	instance	338293185505656835	instance.customtext.set	40	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "PasswordReset"}		338293185505656835	1758134452.502632	60
338293185505656835	instance	338293185505656835	instance.customtext.set	41	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		338293185505656835	1758134452.502632	61
338293185505656835	instance	338293185505656835	instance.customtext.set	42	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		338293185505656835	1758134452.502632	62
338293185505656835	instance	338293185505656835	instance.customtext.set	43	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		338293185505656835	1758134452.502632	63
338293185505656835	instance	338293185505656835	instance.customtext.set	44	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "Wir haben eine Anfrage für das Zurücksetzen deines Passwortes bekommen. Du kannst den untenstehenden Button verwenden, um dein Passwort zurückzusetzen <br>(Code <strong>{{.Code}}</strong>).<br> Falls du dieses Mail nicht angefordert hast, kannst du es ignorieren.", "language": "de", "template": "PasswordReset"}		338293185505656835	1758134452.502632	64
338293185505656835	instance	338293185505656835	instance.customtext.set	45	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		338293185505656835	1758134452.502632	65
338293185505656835	instance	338293185505656835	instance.customtext.set	46	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	66
338293185505656835	instance	338293185505656835	instance.customtext.set	47	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Email verifizieren", "language": "de", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	67
338293185505656835	instance	338293185505656835	instance.customtext.set	48	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Email verifizieren", "language": "de", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	68
338293185505656835	instance	338293185505656835	instance.customtext.set	49	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Email verifizieren", "language": "de", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	69
338293185505656835	instance	338293185505656835	instance.customtext.set	50	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "Eine neue E-Mail Adresse wurde hinzugefügt. Bitte verwende den untenstehenden Button um diese zu verifizieren <br>(Code <strong>{{.Code}}</strong>).<br> Falls du deine E-Mail Adresse nicht selber hinzugefügt hast, kannst du dieses E-Mail ignorieren.", "language": "de", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	70
338293185505656835	instance	338293185505656835	instance.customtext.set	51	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Email verifizieren", "language": "de", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	71
338293185505656835	instance	338293185505656835	instance.customtext.set	52	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	72
338293185505656835	instance	338293185505656835	instance.customtext.set	53	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Telefonnummer verifizieren", "language": "de", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	73
338293185505656835	instance	338293185505656835	instance.customtext.set	54	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Telefonnummer verifizieren", "language": "de", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	74
338293185505656835	instance	338293185505656835	instance.customtext.set	55	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Telefonnummer verifizieren", "language": "de", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	75
338293185505656835	instance	338293185505656835	instance.customtext.set	56	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "Eine Telefonnummer wurde hinzugefügt. Bitte verifiziere diese in dem du folgenden Code eingibst (Code {{.Code}})", "language": "de", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	76
338293185505656835	instance	338293185505656835	instance.customtext.set	57	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Telefon verifizieren", "language": "de", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	77
338293185505656835	instance	338293185505656835	instance.customtext.set	58	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	78
338293185505656835	instance	338293185505656835	instance.customtext.set	59	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Domain wurde beansprucht", "language": "de", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	79
338293185505656835	instance	338293185505656835	instance.customtext.set	60	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Domain wurde beansprucht", "language": "de", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	80
338293185505656835	instance	338293185505656835	instance.customtext.set	61	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Email / Username ändern", "language": "de", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	81
338293185505656835	instance	338293185505656835	instance.customtext.set	62	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "Die Domain {{.Domain}} wurde von einer Organisation beansprucht. Dein derzeitiger User {{.Username}} ist nicht Teil dieser Organisation. Daher musst du beim nächsten Login eine neue Email hinterlegen. Für diesen Login haben wir dir einen temporären Usernamen ({{.TempUsername}}) erstellt.", "language": "de", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	82
338293185505656835	instance	338293185505656835	instance.customtext.set	63	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Login", "language": "de", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	83
338293185505656835	instance	338293185505656835	instance.customtext.set	64	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "PasswordChange"}		338293185505656835	1758134452.502632	84
338293185505656835	instance	338293185505656835	instance.customtext.set	65	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Passwort von Benutzer wurde geändert", "language": "de", "template": "PasswordChange"}		338293185505656835	1758134452.502632	85
338293185505656835	instance	338293185505656835	instance.customtext.set	66	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "ZITADEL - Passwort von Benutzer wurde geändert", "language": "de", "template": "PasswordChange"}		338293185505656835	1758134452.502632	86
338293185505656835	instance	338293185505656835	instance.customtext.set	67	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Passwort Änderung", "language": "de", "template": "PasswordChange"}		338293185505656835	1758134452.502632	87
338293185505656835	instance	338293185505656835	instance.customtext.set	68	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "Das Password vom Benutzer wurde geändert. Wenn diese Änderung von jemand anderem gemacht wurde, empfehlen wir die sofortige Zurücksetzung ihres Passworts.", "language": "de", "template": "PasswordChange"}		338293185505656835	1758134452.502632	88
338293185505656835	instance	338293185505656835	instance.customtext.set	69	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Login", "language": "de", "template": "PasswordChange"}		338293185505656835	1758134452.502632	89
338293185505656835	instance	338293185505656835	instance.customtext.set	70	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "InitCode"}		338293185505656835	1758134452.502632	90
338293185505656835	instance	338293185505656835	instance.customtext.set	71	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Initialize User", "language": "en", "template": "InitCode"}		338293185505656835	1758134452.502632	91
338293185505656835	instance	338293185505656835	instance.customtext.set	72	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Initialize User", "language": "en", "template": "InitCode"}		338293185505656835	1758134452.502632	92
338293185505656835	instance	338293185505656835	instance.customtext.set	73	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Initialize User", "language": "en", "template": "InitCode"}		338293185505656835	1758134452.502632	93
338293185505656835	instance	338293185505656835	instance.customtext.set	74	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "This user was created in Zitadel. Use the username {{.PreferredLoginName}} to login. Please click the button below to finish the initialization process. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.", "language": "en", "template": "InitCode"}		338293185505656835	1758134452.502632	94
338293185505656835	instance	338293185505656835	instance.customtext.set	75	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Finish initialization", "language": "en", "template": "InitCode"}		338293185505656835	1758134452.502632	95
338293185505656835	instance	338293185505656835	instance.customtext.set	76	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "PasswordReset"}		338293185505656835	1758134452.502632	96
338293185505656835	instance	338293185505656835	instance.customtext.set	77	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Reset password", "language": "en", "template": "PasswordReset"}		338293185505656835	1758134452.502632	97
338293185505656835	instance	338293185505656835	instance.customtext.set	78	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Reset password", "language": "en", "template": "PasswordReset"}		338293185505656835	1758134452.502632	98
338293185505656835	instance	338293185505656835	instance.customtext.set	79	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Reset password", "language": "en", "template": "PasswordReset"}		338293185505656835	1758134452.502632	99
338293185505656835	instance	338293185505656835	instance.customtext.set	80	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "We received a password reset request. Please use the button below to reset your password. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.", "language": "en", "template": "PasswordReset"}		338293185505656835	1758134452.502632	100
338293185505656835	instance	338293185505656835	instance.customtext.set	81	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Reset password", "language": "en", "template": "PasswordReset"}		338293185505656835	1758134452.502632	101
338293185505656835	instance	338293185505656835	instance.customtext.set	82	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	102
338293185505656835	instance	338293185505656835	instance.customtext.set	83	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Verify email", "language": "en", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	103
338293185505656835	instance	338293185505656835	instance.customtext.set	84	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Verify email", "language": "en", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	104
338293185505656835	instance	338293185505656835	instance.customtext.set	85	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Verify email", "language": "en", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	105
338293185505656835	instance	338293185505656835	instance.customtext.set	86	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "A new email has been added. Please use the button below to verify your email. (Code {{.Code}}) If you didn't add a new email, please ignore this email.", "language": "en", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	106
338293185505656835	instance	338293185505656835	instance.customtext.set	87	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Verify email", "language": "en", "template": "VerifyEmail"}		338293185505656835	1758134452.502632	107
338293185505656835	instance	338293185505656835	instance.customtext.set	88	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	108
338293185505656835	instance	338293185505656835	instance.customtext.set	89	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Verify phone", "language": "en", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	109
338293185505656835	instance	338293185505656835	instance.customtext.set	90	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Verify phone", "language": "en", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	110
338293185505656835	instance	338293185505656835	instance.customtext.set	91	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Verify phone", "language": "en", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	111
338293185505656835	instance	338293185505656835	instance.customtext.set	92	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "A new phone number has been added. Please use the following code to verify it {{.Code}}.", "language": "en", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	112
338293185505656835	instance	338293185505656835	instance.customtext.set	93	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Verify phone", "language": "en", "template": "VerifyPhone"}		338293185505656835	1758134452.502632	113
338293185505656835	instance	338293185505656835	instance.customtext.set	94	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	114
338293185505656835	instance	338293185505656835	instance.customtext.set	95	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Domain has been claimed", "language": "en", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	115
338293185505656835	instance	338293185505656835	instance.customtext.set	96	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "Zitadel - Domain has been claimed", "language": "en", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	116
338293185505656835	instance	338293185505656835	instance.customtext.set	97	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Change email/username", "language": "en", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	117
338293185505656835	instance	338293185505656835	instance.customtext.set	98	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "The domain {{.Domain}} has been claimed by an organization. Your current user {{.UserName}} is not part of this organization. Therefore you'll have to change your email when you login. We have created a temporary username ({{.TempUsername}}) for this login.", "language": "en", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	118
338293185505656835	instance	338293185505656835	instance.customtext.set	99	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Login", "language": "en", "template": "DomainClaimed"}		338293185505656835	1758134452.502632	119
338293185505656835	instance	338293185505656835	instance.customtext.set	100	1	2025-09-17 18:40:52.502632+00	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "PasswordChange"}		338293185505656835	1758134452.502632	120
338293185505656835	instance	338293185505656835	instance.customtext.set	101	1	2025-09-17 18:40:52.502632+00	{"key": "Subject", "text": "Password of user has changed", "language": "en", "template": "PasswordChange"}		338293185505656835	1758134452.502632	121
338293185505656835	instance	338293185505656835	instance.customtext.set	102	1	2025-09-17 18:40:52.502632+00	{"key": "Title", "text": "ZITADEL - Password of user has changed", "language": "en", "template": "PasswordChange"}		338293185505656835	1758134452.502632	122
338293185505656835	instance	338293185505656835	instance.customtext.set	103	1	2025-09-17 18:40:52.502632+00	{"key": "PreHeader", "text": "Change password", "language": "en", "template": "PasswordChange"}		338293185505656835	1758134452.502632	123
338293185505656835	instance	338293185505656835	instance.customtext.set	104	1	2025-09-17 18:40:52.502632+00	{"key": "Text", "text": "The password of your user has changed. If this change was not done by you, please be advised to immediately reset your password.", "language": "en", "template": "PasswordChange"}		338293185505656835	1758134452.502632	124
338293185505656835	instance	338293185505656835	instance.customtext.set	105	1	2025-09-17 18:40:52.502632+00	{"key": "ButtonText", "text": "Login", "language": "en", "template": "PasswordChange"}		338293185505656835	1758134452.502632	125
338293185505656835	web_key	338293186697101315	web_key.added	1	1	2025-09-17 18:40:52.502632+00	{"config": {"Bits": "2048", "Hasher": "SHA256"}, "publicKey": {"e": "AQAB", "n": "ucX6OC29cEIF-jKtPPJ2VVq4jxqtVhRoigLoOWX7P7KA6L1fCiY4e2SYRHJ4bXawQozVP_ikGm9_-mJdj4cuRtCDqLwCTZknO5eW1shBdo6jPmbBNTbrSdJYgA0_l5OFDd6ixYMPxLh8yjs3w6tFVy1OsGa6iN2wjX5mEfruyVqzYDWK6aEDLUYcLYHzAvc3E8jrJbXy19tNF2JkrBY8G16TDRTZ9TOk24Id7MWkL9RNvFACTq1d7ti1uhe8WH6iP9sR3hlzREUJIe-TnnyOMdsKgegZFP3cUy7C6XLRdUFvvZqbcMX2iX5Hfj51mfdiqiPkHGxmQiy3OBHxMaWE_Q", "alg": "RS256", "kid": "338293186697101315", "kty": "RSA", "use": "sig"}, "configType": "RSA", "privateKey": {"KeyID": "oidcKey", "Crypted": "1GQyw0O6Iz1/7uSx4B7lfiGI00Y+0vOc8znF7Ip+rjrRsGspGi0bp/IeHmuRoWnZnLHNhTXAPXBC+B6HcJa8rcQuDfJdWc5ic9QjgPyDpruWMO5s/oyzPTT4BNUkwzt66mjKizQgXOIUSvJ3M4u6cqkClPyDMcLruk0AsitU6h1ugOCHC2y+9vx9sDHiPwPJPSUm6FBs92q9XPyS0ynPid8kLKmkdEhnPS4KOYrtiowvDo5lukJWWscCu+ahr0CXXOUzl3sJh9j8VmIfH30XW7LSsLGdgIlrq0QvGJ3CeUVmZabr4z/onkE8aHlHuqqWVzwDuHyMKKobETy4maCfqU/HpuMM2FZolOHZDJPYleOL5dhpUAyhmruVIWx//oE2H0v14oTOfNsCVn0EzhBPp0MSBliPyUwlE8sojtO3HPODmiOE3dkn8xP15X9qjwkjOUIk7EXW5t9yCzJWUSXnjJ9+6dzTaXQcbbUNPEmVVkyj1FxOboBJFDdnyOUtzX5rhdvgB54HowV+eprfmq62LXmzIRx3hFuUAVwZve5ibBInPKzp9CVTIm/UXh1YARA3TLAuEqlqciFkkQucHFnZjgdlU8hpI8MZtz3j/Z562bpoqPNkop20HV63uibw0VdzNsslgyLjgfhuaq7vfAZcY4Bi5YraX+dP5VVrsu0VUa6mGh7ghXncmLr2g8BvEU2yaXYLpdr9/2Bb6OqcBnhMn35NWNy7DfGyTKLUmz3xxspZfopShqWJICuIZzgb+Ag6hzRuhMwMaDl4CrbErWvZbclCiRmUnnJQ7pcSaz4mbd4qNDm1kdUYBPwH+KJ+XWeUP3aXnxQww7UhqeAk81i1G0XrgEaFED1Yc2/BWl/LO+6b4b9ERfYKv3pBU7YyovQGAAO55ESohGDZ6W/G8xU2hzSE8tOydDvICGftWpv0RzKC4XMvSK5kCJXPPqB28O/6YLnsaJ/HdHBnAUydbG4eoNMaxGGsEqohDXa6Z2HMo4cZCJ+DeDFeQQqy/PD8/3wvppbE8xk0nPYB+oeh9X2LvroYLe0rODN4fiac6dItmogknQfhNUxmnEw+d6abt44ei6sgZPSk/jjUJ+TI6n1ScqLe55XJwLYh2MCgPWPd4qdh6w7deWYyZ7YI9I/5IjF7IPWlbNtspDb0qJHhtrwKkxWPGrUeGUQSITQ/YUiIEv0MZnDPddNFyVvZOUHrDXvxDqIUHiWNuyL9oee3G+PpEamcR5YRIXBhJHpBfDQhfNCmG1C2ZjvnPXugaKYOzDr8dOSgmvKGrbQdl6tIzbf/CWlEKzq/KDv26kApGoiErctZjKOjcHVFICe9nBxKs+kPI7zdyXjbZUf6sw5rIZXoZKujuyEivLvBBVqS8KXjy9bHrnwrLwTq6K0cdErG2F6yZ2k5vA0eTwrjzKlgjgpk3VTXmeYbzc0sbriPt0Gof3kUKiu1EZunMiyQkACn3JxTgNiAghWwMis4ShFp2XVJnYS9qJ5DYrEZf84e9px7Bzne5yIz2COTGwA+gRcyuEhSjTTyFNq0JXe5DWvav1Rn6WZ1SEjlF57YhC0sOASFHtCkjbzhrgZ4XCQu/ql07Lj1Eoxvhv201G4rZ35NsLCgFj4tRRUJBvg2+kIrpf6j4LoS4HuP7+63/WRhqmj4SKhv1AHhr+o6zqTX2Z52u2NCjVEcPNhnWgtqAbPhCQJm1iwOZnmVpbIkZ2haEcb4B3eRz9tqPW2pKSzW8EjhOLAZ8FRKLcbdpIKXKDZ/wdWsyRSacT5fRtuyG/LXvsExkKV6CVsi0swlAfy5UvHfWJfMT6pSAoexemsjHFsJ+CutJHCv0b+GbwN1Jc/2uIYlI4jaKJmdrsDSyV7d4R24X431c3p3S/WzXNTe0VjDSxyMfeniHS3E7+ePfYT+DK60yg1S6ggFkVxrDL/kr5gR1P/qgn7cz4WwflsVSHq19zHx3whvJckfbT6Hag6EAlBTTUcra7wZH0uQeEXrpAfwFnEsFSipT50hVWAxgs6jnoUNkcpFW5INa1M2jgriABFNbzm0mCeHKSKTaCahPqfHZvKrNkEMsLc2CvY0uuKMTniGQeNMY9CHjpvbTZxZ+hehHk7NzJjWBnFrsmkZxTs7b7TQCSsf4kUbJLH5VuVw27NffCLNshlkA2o9JdkbW8sg23HKLjQBDr4VCvOoB4yu14JUDmlb7H8gpKyftorbM+T0W69V/pDn1aeDjLL3A7zF0pT38+iHZA==", "Algorithm": "aes", "CryptoType": 0}}		338293185505656835	1758134452.502632	126
338293185505656835	web_key	338293186697101315	web_key.activated	2	1	2025-09-17 18:40:52.502632+00	{}		338293185505656835	1758134452.502632	127
338293185505656835	web_key	338293186797502467	web_key.added	1	1	2025-09-17 18:40:52.502632+00	{"config": {"Bits": "2048", "Hasher": "SHA256"}, "publicKey": {"e": "AQAB", "n": "0MoI5_hiV2wJgHpjonl4FBm_4O1CoZvMmmO8t1Hc-h3ZXkh1TpMUiJ4UrxH_yC818CKDyNPVef1MqkQe-Jyvoi4WG24RS20xPW4Gire3YNCKMRV_Bw6AP8QASnh1y06fgZal-I6rsO-YpE1kZ8zieel552qhpsjbUaQroEZqGWKZMg4cdEAzOpvUdcEbBKeRPuVQES5dKktebS9vvQ7XAucXf-wZKyOUeSgrutNCa85oJIi2nJ_B-1KXZdn5EVSEWaMRtW7YYo1XR-kfKqPl_RXygfjnY9OrZ0vZexS6ceaH8mG-PUGMc_VwZ2PBEw1eUJLXLDBVlylQ3NLHznSjIQ", "alg": "RS256", "kid": "338293186797502467", "kty": "RSA", "use": "sig"}, "configType": "RSA", "privateKey": {"KeyID": "oidcKey", "Crypted": "9iwnQsZFYbLlFqnhmzzUC/EYYwkGdEjS6L2KJtrewTV32oxd3CgBTqsN1+epf7ORDkWsnbK4TquySyWgnLJ89HpATkYnwy+rFFjNdBN576uZcbbiaXQFvUubkm2y2MJAAlB+FxR87LmE04wBK3ItF+ht/ma3yme1dwZFzCo8CT1V2Yt+mAyyP3QWujByvWfZtg5RqA1Wjh86vT4ABWLv50d/tfffZDX8dOguzB48mHUZELdd2gaUIfGFLgL26R7hRelLtUEMj1+zPehtMN8wl5eUZVQB0XObYIMKjHPeM1az173OFF81BlTLuGBEIQeJsl/AkyMgMGZNNF9t4fQ8B/RhIqlIlfdyOHKpiDNO0lUEPBlMAGRUULHHQk6nOdwu30CA/KasQIJUFN9qEb0bMxn40Zwh8folJfCwoJwq77AMFGp4KRUhSUO8vV3yYCgVbNX9cXDjTgMUS0juLl8DDPS0ku80rQV4HGMNDW6jbJPxMiYJxsaAH8PatlMZa08AboP8FumLFOaJd5JLNP9O8+ZP3k+XTrATyXdFRn5o5VnrKZjAm3LxkghSWfjHmav8SBiM+1UNTT1kx1Pl4ISnbno8+d/E8UXvbFDmNEamoiOljPUMcJIx2/CnrobqdqlrrVxnBPtS8/QAtzgLB1Yr4PmjdS721zD4PHrv0sXcnWUibd7wojzD4Lefq17yjPO0rt1ZMPNnZCxlDlSGipt58jgJflxaI1bXrLVpQOQcwUWa6UoqHSSy3baWn7+boihwR0TIX5NpNIFOrvcjq8QuQpdtYeewld2E5jzESrbZKaOQJ1OYd2ts8b3qNfXCue/S3vFPLfx5GfPoeTipf1e69PQmAIXp/hdRhxdwGf47w/9cedJ1JTnB3kdwGRZ78Cr7Qz5MfJ5ohww3ml1BzWduZ5pzvRb3jwh2ykhbN9f0VBL8Aq8jdKo/Cyn+nSFiKW6Nd5sAFb6+0LuVZOl5vyWjOYCf6C+iZoXhCqbiVEye06QcO9WGSsxaQGzyycpuz6gW8Gd80QyTcmq13jRJzyTLsoLbidwA8WUKwLLn9qEgA7Xq16qLaVpxwLM6WARGHnPfAVSTynwwLZ/VsbaexxFLF5URZXilhiyCN09ItJP5GXOdqQ+yDWlQMgIHVD4bxWAA/B0WDNdsO0axYNhZx8rs0s+tClAvAWqY3jQUwZP7HQMrNdkw2c/MNpkF167tj+R5SL7yK80bnCDc/SLoQWITYFT2norREbli3z0v5YxDSe7nv9/6ca+uoOvXUlzyoVAFU6W6nZHlxxUuTT6YKW90xUJ5dGAdOh8YJNOiHfTO9e5PjA6RxTOxXVQ8tlGrKBYkfGmavYg1CZ7z+8DxRBAgIBXWvlS4xu2/GW9HYV2/o7Di3knIZpW0T5hK4/OQUDM67dYo1MHfeL5bf6E/xUxoC+IY0TZqnO1TKn/I24BVa8RhIFlkRVWYVXUoVJM3fdZNYbav05Cl3WtBl/DX7kpv6PLOAaViwDW11qBEsURmo4Oh6vaNDzLBKjuXHDBmyq+5RKIbbPHeEUgpCumVuPBq11lih6H/FWytBVjUAvJL+yFRK41IoTfacg1PSkqX8qnGp0a/xNBtIJxDeoryklzfLRskvxwIyBy7CV2+GN7o7uukeapb+RadgUaYK8lJvthzGmaH8piKmc3D2Xlqa/2TDqYG9e15zpxixfVTgMmVqhisGVHE73dhREreSiPEw+BiTWRfMSsFq04/z48vKFnp1t9zlPSr+bitIYqPHxzisA7VQdI1f3l7bszH7kYQYdbHARe2Fu79J0J4avZTSQnXr4lOGgMl3aBsy4MRrrNwhd1VoDNPCA4k1yZHlGLYTHZtwHQfXOmcEQEZba+Q/CM0r5miNXmd6UfYh32Mcsy4vys2TdEkzXKj1gpSu5U6KcLgP/F820/n1EEBHIufqXjRDpOl5fZMWtLpfmU8xTAjidxX9Z3dgO7s7HRBtpTYoVlU40QiaG/aVxCNODtyhV/1u28Lb37H0bu3/KHT+olwSvWnfn5UgBCl8JIeSTticsbQp+MHHUVIcZPfxFMQGuqnhLECr/xIPq1cD71yBHXBDO2x3fSFIu6CRF+EFPoAe4EPbPJofc4WyC/SIEM/tSHSjd8KSyemsAMkKsDNwscj66cdviL8a8FcDEZjUIrnlDjNdzIbTSE3DgwSsMM/mOQQ5Qx0MLz4m+GE/fYI3Hl2OmhPSdlNleKmW2A0pbOxV6eOcyrgJQ==", "Algorithm": "aes", "CryptoType": 0}}		338293185505656835	1758134452.502632	128
338293185505656835	instance	338293185505656835	instance.oidc.settings.added	106	1	2025-09-17 18:40:52.502632+00	{"idTokenLifetime": 43200000000000, "accessTokenLifetime": 43200000000000, "refreshTokenExpiration": 7776000000000000, "refreshTokenIdleExpiration": 2592000000000000}		338293185505656835	1758134452.502632	129
338293185505656835	feature	338293185505656835	feature.instance.login_default_org.set	1	2	2025-09-17 18:40:52.502632+00	{"Value": true}		338293185505656835	1758134452.502632	130
338293185505656835	feature	338293185505656835	feature.instance.login_v2.set	2	2	2025-09-17 18:40:52.502632+00	{"Value": {"required": true}}		338293185505656835	1758134452.502632	131
338293185505656835	milestone	338293185505656835	milestone.v2.reached	1	2	2025-09-17 18:40:52.502632+00	{"type": "InstanceCreated"}		338293185505656835	1758134452.502632	132
338293185505656835	permission	338293185505656835	permission.added	1	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.read"}		338293185505656835	1758134452.522019	1
338293185505656835	permission	338293185505656835	permission.added	2	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.write"}		338293185505656835	1758134452.522019	2
338293185505656835	permission	338293185505656835	permission.added	3	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.policy.read"}		338293185505656835	1758134452.522019	3
338293185505656835	permission	338293185505656835	permission.added	4	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.policy.write"}		338293185505656835	1758134452.522019	4
338293185505656835	permission	338293185505656835	permission.added	5	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.policy.delete"}		338293185505656835	1758134452.522019	5
338293185505656835	permission	338293185505656835	permission.added	6	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.member.read"}		338293185505656835	1758134452.522019	6
338293185505656835	permission	338293185505656835	permission.added	7	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.member.write"}		338293185505656835	1758134452.522019	7
338293185505656835	permission	338293185505656835	permission.added	8	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.member.delete"}		338293185505656835	1758134452.522019	8
338293185505656835	permission	338293185505656835	permission.added	9	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.idp.read"}		338293185505656835	1758134452.522019	9
338293185505656835	permission	338293185505656835	permission.added	10	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.idp.write"}		338293185505656835	1758134452.522019	10
338293185505656835	permission	338293185505656835	permission.added	11	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.idp.delete"}		338293185505656835	1758134452.522019	11
338293185505656835	permission	338293185505656835	permission.added	12	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.action.read"}		338293185505656835	1758134452.522019	12
338293185505656835	permission	338293185505656835	permission.added	13	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.action.write"}		338293185505656835	1758134452.522019	13
338293185505656835	permission	338293185505656835	permission.added	14	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.action.delete"}		338293185505656835	1758134452.522019	14
338293185505656835	permission	338293185505656835	permission.added	15	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.flow.read"}		338293185505656835	1758134452.522019	15
338293185505656835	permission	338293185505656835	permission.added	16	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.flow.write"}		338293185505656835	1758134452.522019	16
338293185505656835	permission	338293185505656835	permission.added	17	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.flow.delete"}		338293185505656835	1758134452.522019	17
338293185505656835	permission	338293185505656835	permission.added	18	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.feature.read"}		338293185505656835	1758134452.522019	18
338293185505656835	permission	338293185505656835	permission.added	19	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.feature.write"}		338293185505656835	1758134452.522019	19
338293185505656835	permission	338293185505656835	permission.added	20	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.feature.delete"}		338293185505656835	1758134452.522019	20
338293185505656835	permission	338293185505656835	permission.added	21	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.restrictions.read"}		338293185505656835	1758134452.522019	21
338293185505656835	permission	338293185505656835	permission.added	22	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.restrictions.write"}		338293185505656835	1758134452.522019	22
338293185505656835	permission	338293185505656835	permission.added	23	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.web_key.write"}		338293185505656835	1758134452.522019	23
338293185505656835	permission	338293185505656835	permission.added	24	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.web_key.delete"}		338293185505656835	1758134452.522019	24
338293185505656835	permission	338293185505656835	permission.added	25	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.web_key.read"}		338293185505656835	1758134452.522019	25
338293185505656835	permission	338293185505656835	permission.added	26	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.debug.write"}		338293185505656835	1758134452.522019	26
338293185505656835	permission	338293185505656835	permission.added	27	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "iam.debug.read"}		338293185505656835	1758134452.522019	27
338293185505656835	permission	338293185505656835	permission.added	28	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.read"}		338293185505656835	1758134452.522019	28
338293185505656835	permission	338293185505656835	permission.added	29	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.global.read"}		338293185505656835	1758134452.522019	29
338293185505656835	permission	338293185505656835	permission.added	30	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.create"}		338293185505656835	1758134452.522019	30
338293185505656835	permission	338293185505656835	permission.added	31	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.write"}		338293185505656835	1758134452.522019	31
338293185505656835	permission	338293185505656835	permission.added	32	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.delete"}		338293185505656835	1758134452.522019	32
338293185505656835	permission	338293185505656835	permission.added	33	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.member.read"}		338293185505656835	1758134452.522019	33
338293185505656835	permission	338293185505656835	permission.added	34	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.member.write"}		338293185505656835	1758134452.522019	34
338293185505656835	permission	338293185505656835	permission.added	35	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.member.delete"}		338293185505656835	1758134452.522019	35
338293185505656835	permission	338293185505656835	permission.added	36	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.idp.read"}		338293185505656835	1758134452.522019	36
338293185505656835	permission	338293185505656835	permission.added	37	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.idp.write"}		338293185505656835	1758134452.522019	37
338293185505656835	permission	338293185505656835	permission.added	38	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.idp.delete"}		338293185505656835	1758134452.522019	38
338293185505656835	permission	338293185505656835	permission.added	39	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.action.read"}		338293185505656835	1758134452.522019	39
338293185505656835	permission	338293185505656835	permission.added	40	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.action.write"}		338293185505656835	1758134452.522019	40
338293185505656835	permission	338293185505656835	permission.added	41	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.action.delete"}		338293185505656835	1758134452.522019	41
338293185505656835	permission	338293185505656835	permission.added	42	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.flow.read"}		338293185505656835	1758134452.522019	42
338293185505656835	permission	338293185505656835	permission.added	43	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.flow.write"}		338293185505656835	1758134452.522019	43
338293185505656835	permission	338293185505656835	permission.added	44	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.flow.delete"}		338293185505656835	1758134452.522019	44
338293185505656835	permission	338293185505656835	permission.added	45	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.feature.read"}		338293185505656835	1758134452.522019	45
338293185505656835	permission	338293185505656835	permission.added	46	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.feature.write"}		338293185505656835	1758134452.522019	46
338293185505656835	permission	338293185505656835	permission.added	47	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "org.feature.delete"}		338293185505656835	1758134452.522019	47
338293185505656835	permission	338293185505656835	permission.added	48	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.read"}		338293185505656835	1758134452.522019	48
338293185505656835	permission	338293185505656835	permission.added	49	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	49
338293185505656835	permission	338293185505656835	permission.added	50	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.write"}		338293185505656835	1758134452.522019	50
338293185505656835	permission	338293185505656835	permission.added	51	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.delete"}		338293185505656835	1758134452.522019	51
338293185505656835	permission	338293185505656835	permission.added	52	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	52
338293185505656835	permission	338293185505656835	permission.added	53	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	53
338293185505656835	permission	338293185505656835	permission.added	54	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	54
338293185505656835	permission	338293185505656835	permission.added	55	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	55
338293185505656835	permission	338293185505656835	permission.added	56	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.credential.write"}		338293185505656835	1758134452.522019	56
338293185505656835	permission	338293185505656835	permission.added	57	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.passkey.write"}		338293185505656835	1758134452.522019	57
338293185505656835	permission	338293185505656835	permission.added	58	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	58
338293185505656835	permission	338293185505656835	permission.added	59	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.feature.write"}		338293185505656835	1758134452.522019	59
338293185505656835	permission	338293185505656835	permission.added	60	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "user.feature.delete"}		338293185505656835	1758134452.522019	60
338293185505656835	permission	338293185505656835	permission.added	61	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "policy.read"}		338293185505656835	1758134452.522019	61
338293185505656835	permission	338293185505656835	permission.added	62	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "policy.write"}		338293185505656835	1758134452.522019	62
338293185505656835	permission	338293185505656835	permission.added	63	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "policy.delete"}		338293185505656835	1758134452.522019	63
338293185505656835	permission	338293185505656835	permission.added	64	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.read"}		338293185505656835	1758134452.522019	64
338293185505656835	permission	338293185505656835	permission.added	65	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.create"}		338293185505656835	1758134452.522019	65
338293185505656835	permission	338293185505656835	permission.added	66	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.write"}		338293185505656835	1758134452.522019	66
338293185505656835	permission	338293185505656835	permission.added	67	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.delete"}		338293185505656835	1758134452.522019	67
338293185505656835	permission	338293185505656835	permission.added	68	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	68
338293185505656835	permission	338293185505656835	permission.added	69	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.member.write"}		338293185505656835	1758134452.522019	69
338293185505656835	permission	338293185505656835	permission.added	70	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.member.delete"}		338293185505656835	1758134452.522019	70
338293185505656835	permission	338293185505656835	permission.added	71	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	71
338293185505656835	permission	338293185505656835	permission.added	72	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.role.write"}		338293185505656835	1758134452.522019	72
338293185505656835	permission	338293185505656835	permission.added	73	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.role.delete"}		338293185505656835	1758134452.522019	73
338293185505656835	permission	338293185505656835	permission.added	74	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	74
338293185505656835	permission	338293185505656835	permission.added	75	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.app.write"}		338293185505656835	1758134452.522019	75
338293185505656835	permission	338293185505656835	permission.added	76	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.app.delete"}		338293185505656835	1758134452.522019	76
338293185505656835	permission	338293185505656835	permission.added	77	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	77
338293185505656835	permission	338293185505656835	permission.added	78	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.grant.write"}		338293185505656835	1758134452.522019	78
338293185505656835	permission	338293185505656835	permission.added	79	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.grant.delete"}		338293185505656835	1758134452.522019	79
338293185505656835	permission	338293185505656835	permission.added	80	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	80
338293185505656835	permission	338293185505656835	permission.added	81	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.grant.member.write"}		338293185505656835	1758134452.522019	81
338293185505656835	permission	338293185505656835	permission.added	82	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "project.grant.member.delete"}		338293185505656835	1758134452.522019	82
338293185505656835	permission	338293185505656835	permission.added	83	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "events.read"}		338293185505656835	1758134452.522019	83
338293185505656835	permission	338293185505656835	permission.added	84	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "milestones.read"}		338293185505656835	1758134452.522019	84
338293185505656835	permission	338293185505656835	permission.added	85	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "session.read"}		338293185505656835	1758134452.522019	85
338293185505656835	permission	338293185505656835	permission.added	86	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "session.write"}		338293185505656835	1758134452.522019	86
338293185505656835	permission	338293185505656835	permission.added	87	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "session.delete"}		338293185505656835	1758134452.522019	87
338293185505656835	permission	338293185505656835	permission.added	88	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "action.target.read"}		338293185505656835	1758134452.522019	88
338293185505656835	permission	338293185505656835	permission.added	89	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "action.target.write"}		338293185505656835	1758134452.522019	89
338293185505656835	permission	338293185505656835	permission.added	90	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "action.target.delete"}		338293185505656835	1758134452.522019	90
338293185505656835	permission	338293185505656835	permission.added	91	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "action.execution.read"}		338293185505656835	1758134452.522019	91
338293185505656835	permission	338293185505656835	permission.added	92	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "action.execution.write"}		338293185505656835	1758134452.522019	92
338293185505656835	permission	338293185505656835	permission.added	93	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "userschema.read"}		338293185505656835	1758134452.522019	93
338293185505656835	permission	338293185505656835	permission.added	94	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "userschema.write"}		338293185505656835	1758134452.522019	94
338293185505656835	permission	338293185505656835	permission.added	95	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER", "permission": "userschema.delete"}		338293185505656835	1758134452.522019	95
338293185505656835	permission	338293185505656835	permission.added	96	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.read"}		338293185505656835	1758134452.522019	96
338293185505656835	permission	338293185505656835	permission.added	97	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.global.read"}		338293185505656835	1758134452.522019	97
338293185505656835	permission	338293185505656835	permission.added	98	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.write"}		338293185505656835	1758134452.522019	98
338293185505656835	permission	338293185505656835	permission.added	99	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.delete"}		338293185505656835	1758134452.522019	99
338293185505656835	permission	338293185505656835	permission.added	100	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.member.read"}		338293185505656835	1758134452.522019	100
338293185505656835	permission	338293185505656835	permission.added	101	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.member.write"}		338293185505656835	1758134452.522019	101
338293185505656835	permission	338293185505656835	permission.added	102	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.member.delete"}		338293185505656835	1758134452.522019	102
338293185505656835	permission	338293185505656835	permission.added	103	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.idp.read"}		338293185505656835	1758134452.522019	103
338293185505656835	permission	338293185505656835	permission.added	104	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.idp.write"}		338293185505656835	1758134452.522019	104
338293185505656835	permission	338293185505656835	permission.added	105	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.idp.delete"}		338293185505656835	1758134452.522019	105
338293185505656835	permission	338293185505656835	permission.added	106	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.action.read"}		338293185505656835	1758134452.522019	106
338293185505656835	permission	338293185505656835	permission.added	107	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.action.write"}		338293185505656835	1758134452.522019	107
338293185505656835	permission	338293185505656835	permission.added	108	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.action.delete"}		338293185505656835	1758134452.522019	108
338293185505656835	permission	338293185505656835	permission.added	109	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.flow.read"}		338293185505656835	1758134452.522019	109
338293185505656835	permission	338293185505656835	permission.added	110	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.flow.write"}		338293185505656835	1758134452.522019	110
338293185505656835	permission	338293185505656835	permission.added	111	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.flow.delete"}		338293185505656835	1758134452.522019	111
338293185505656835	permission	338293185505656835	permission.added	112	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.feature.read"}		338293185505656835	1758134452.522019	112
338293185505656835	permission	338293185505656835	permission.added	113	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.feature.write"}		338293185505656835	1758134452.522019	113
338293185505656835	permission	338293185505656835	permission.added	114	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "org.feature.delete"}		338293185505656835	1758134452.522019	114
338293185505656835	permission	338293185505656835	permission.added	115	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.read"}		338293185505656835	1758134452.522019	115
338293185505656835	permission	338293185505656835	permission.added	116	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	116
338293185505656835	permission	338293185505656835	permission.added	117	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.write"}		338293185505656835	1758134452.522019	117
338293185505656835	permission	338293185505656835	permission.added	118	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.delete"}		338293185505656835	1758134452.522019	118
338293185505656835	permission	338293185505656835	permission.added	119	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	119
338293185505656835	permission	338293185505656835	permission.added	120	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	120
338293185505656835	permission	338293185505656835	permission.added	121	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	121
338293185505656835	permission	338293185505656835	permission.added	122	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	122
338293185505656835	permission	338293185505656835	permission.added	123	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.credential.write"}		338293185505656835	1758134452.522019	123
338293185505656835	permission	338293185505656835	permission.added	124	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.passkey.write"}		338293185505656835	1758134452.522019	124
338293185505656835	permission	338293185505656835	permission.added	125	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	125
338293185505656835	permission	338293185505656835	permission.added	126	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.feature.write"}		338293185505656835	1758134452.522019	126
338293185505656835	permission	338293185505656835	permission.added	127	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "user.feature.delete"}		338293185505656835	1758134452.522019	127
338293185505656835	permission	338293185505656835	permission.added	128	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "policy.read"}		338293185505656835	1758134452.522019	128
338293185505656835	permission	338293185505656835	permission.added	129	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "policy.write"}		338293185505656835	1758134452.522019	129
338293185505656835	permission	338293185505656835	permission.added	130	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "policy.delete"}		338293185505656835	1758134452.522019	130
338293185505656835	permission	338293185505656835	permission.added	131	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.read"}		338293185505656835	1758134452.522019	131
338293185505656835	permission	338293185505656835	permission.added	132	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.create"}		338293185505656835	1758134452.522019	132
338293185505656835	permission	338293185505656835	permission.added	133	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.write"}		338293185505656835	1758134452.522019	133
338293185505656835	permission	338293185505656835	permission.added	134	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.delete"}		338293185505656835	1758134452.522019	134
338293185505656835	permission	338293185505656835	permission.added	135	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	135
338293185505656835	permission	338293185505656835	permission.added	136	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.member.write"}		338293185505656835	1758134452.522019	136
338293185505656835	permission	338293185505656835	permission.added	137	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.member.delete"}		338293185505656835	1758134452.522019	137
338293185505656835	permission	338293185505656835	permission.added	138	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	138
338293185505656835	permission	338293185505656835	permission.added	139	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.role.write"}		338293185505656835	1758134452.522019	139
338293185505656835	permission	338293185505656835	permission.added	140	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.role.delete"}		338293185505656835	1758134452.522019	140
338293185505656835	permission	338293185505656835	permission.added	141	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	141
338293185505656835	permission	338293185505656835	permission.added	142	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.app.write"}		338293185505656835	1758134452.522019	142
338293185505656835	permission	338293185505656835	permission.added	143	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	143
338293185505656835	permission	338293185505656835	permission.added	144	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.grant.write"}		338293185505656835	1758134452.522019	144
338293185505656835	permission	338293185505656835	permission.added	145	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.grant.delete"}		338293185505656835	1758134452.522019	145
338293185505656835	permission	338293185505656835	permission.added	146	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	146
338293185505656835	permission	338293185505656835	permission.added	147	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.grant.member.write"}		338293185505656835	1758134452.522019	147
338293185505656835	permission	338293185505656835	permission.added	148	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "project.grant.member.delete"}		338293185505656835	1758134452.522019	148
338293185505656835	permission	338293185505656835	permission.added	149	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "session.read"}		338293185505656835	1758134452.522019	149
338293185505656835	permission	338293185505656835	permission.added	150	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER", "permission": "session.delete"}		338293185505656835	1758134452.522019	150
338293185505656835	permission	338293185505656835	permission.added	151	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "org.global.read"}		338293185505656835	1758134452.522019	151
338293185505656835	permission	338293185505656835	permission.added	152	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "policy.read"}		338293185505656835	1758134452.522019	152
338293185505656835	permission	338293185505656835	permission.added	153	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.read"}		338293185505656835	1758134452.522019	153
338293185505656835	permission	338293185505656835	permission.added	154	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.write"}		338293185505656835	1758134452.522019	154
338293185505656835	permission	338293185505656835	permission.added	155	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.delete"}		338293185505656835	1758134452.522019	155
338293185505656835	permission	338293185505656835	permission.added	156	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	156
338293185505656835	permission	338293185505656835	permission.added	157	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.member.write"}		338293185505656835	1758134452.522019	157
338293185505656835	permission	338293185505656835	permission.added	158	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.member.delete"}		338293185505656835	1758134452.522019	158
338293185505656835	permission	338293185505656835	permission.added	159	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	159
338293185505656835	permission	338293185505656835	permission.added	160	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.role.write"}		338293185505656835	1758134452.522019	160
338293185505656835	permission	338293185505656835	permission.added	161	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.role.delete"}		338293185505656835	1758134452.522019	161
338293185505656835	permission	338293185505656835	permission.added	162	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	162
338293185505656835	permission	338293185505656835	permission.added	163	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.app.write"}		338293185505656835	1758134452.522019	163
338293185505656835	permission	338293185505656835	permission.added	164	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.app.delete"}		338293185505656835	1758134452.522019	164
338293185505656835	permission	338293185505656835	permission.added	165	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	165
338293185505656835	permission	338293185505656835	permission.added	166	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.grant.write"}		338293185505656835	1758134452.522019	166
338293185505656835	permission	338293185505656835	permission.added	167	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.grant.delete"}		338293185505656835	1758134452.522019	167
338293185505656835	permission	338293185505656835	permission.added	168	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	168
338293185505656835	permission	338293185505656835	permission.added	169	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.grant.member.write"}		338293185505656835	1758134452.522019	169
338293185505656835	permission	338293185505656835	permission.added	170	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "project.grant.member.delete"}		338293185505656835	1758134452.522019	170
338293185505656835	permission	338293185505656835	permission.added	171	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "user.read"}		338293185505656835	1758134452.522019	171
338293185505656835	permission	338293185505656835	permission.added	172	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	172
338293185505656835	permission	338293185505656835	permission.added	173	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	173
338293185505656835	permission	338293185505656835	permission.added	174	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	174
338293185505656835	permission	338293185505656835	permission.added	175	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	175
338293185505656835	permission	338293185505656835	permission.added	176	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	176
338293185505656835	permission	338293185505656835	permission.added	177	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.read"}		338293185505656835	1758134452.522019	177
338293185505656835	permission	338293185505656835	permission.added	178	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.global.read"}		338293185505656835	1758134452.522019	178
338293185505656835	permission	338293185505656835	permission.added	179	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.create"}		338293185505656835	1758134452.522019	179
338293185505656835	permission	338293185505656835	permission.added	180	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.write"}		338293185505656835	1758134452.522019	180
338293185505656835	permission	338293185505656835	permission.added	181	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.delete"}		338293185505656835	1758134452.522019	181
338293185505656835	permission	338293185505656835	permission.added	182	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.member.read"}		338293185505656835	1758134452.522019	182
338293185505656835	permission	338293185505656835	permission.added	183	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.member.write"}		338293185505656835	1758134452.522019	183
338293185505656835	permission	338293185505656835	permission.added	184	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.member.delete"}		338293185505656835	1758134452.522019	184
338293185505656835	permission	338293185505656835	permission.added	185	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.idp.read"}		338293185505656835	1758134452.522019	185
338293185505656835	permission	338293185505656835	permission.added	186	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.idp.write"}		338293185505656835	1758134452.522019	186
338293185505656835	permission	338293185505656835	permission.added	187	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.idp.delete"}		338293185505656835	1758134452.522019	187
338293185505656835	permission	338293185505656835	permission.added	188	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.action.read"}		338293185505656835	1758134452.522019	188
338293185505656835	permission	338293185505656835	permission.added	189	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.action.write"}		338293185505656835	1758134452.522019	189
338293185505656835	permission	338293185505656835	permission.added	190	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.action.delete"}		338293185505656835	1758134452.522019	190
338293185505656835	permission	338293185505656835	permission.added	191	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.flow.read"}		338293185505656835	1758134452.522019	191
338293185505656835	permission	338293185505656835	permission.added	192	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.flow.write"}		338293185505656835	1758134452.522019	192
338293185505656835	permission	338293185505656835	permission.added	193	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.flow.delete"}		338293185505656835	1758134452.522019	193
338293185505656835	permission	338293185505656835	permission.added	194	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.feature.read"}		338293185505656835	1758134452.522019	194
338293185505656835	permission	338293185505656835	permission.added	195	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.feature.write"}		338293185505656835	1758134452.522019	195
338293185505656835	permission	338293185505656835	permission.added	196	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "org.feature.delete"}		338293185505656835	1758134452.522019	196
338293185505656835	permission	338293185505656835	permission.added	197	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.read"}		338293185505656835	1758134452.522019	197
338293185505656835	permission	338293185505656835	permission.added	198	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	198
338293185505656835	permission	338293185505656835	permission.added	199	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.write"}		338293185505656835	1758134452.522019	199
338293185505656835	permission	338293185505656835	permission.added	200	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.delete"}		338293185505656835	1758134452.522019	200
338293185505656835	permission	338293185505656835	permission.added	201	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	201
338293185505656835	permission	338293185505656835	permission.added	202	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	202
338293185505656835	permission	338293185505656835	permission.added	203	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	203
338293185505656835	permission	338293185505656835	permission.added	204	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	204
338293185505656835	permission	338293185505656835	permission.added	205	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.credential.write"}		338293185505656835	1758134452.522019	205
338293185505656835	permission	338293185505656835	permission.added	206	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.passkey.write"}		338293185505656835	1758134452.522019	206
338293185505656835	permission	338293185505656835	permission.added	207	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	207
338293185505656835	permission	338293185505656835	permission.added	208	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.feature.write"}		338293185505656835	1758134452.522019	208
338293185505656835	permission	338293185505656835	permission.added	209	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "user.feature.delete"}		338293185505656835	1758134452.522019	209
338293185505656835	permission	338293185505656835	permission.added	210	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "policy.read"}		338293185505656835	1758134452.522019	210
338293185505656835	permission	338293185505656835	permission.added	211	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "policy.write"}		338293185505656835	1758134452.522019	211
338293185505656835	permission	338293185505656835	permission.added	212	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "policy.delete"}		338293185505656835	1758134452.522019	212
338293185505656835	permission	338293185505656835	permission.added	213	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.read"}		338293185505656835	1758134452.522019	213
338293185505656835	permission	338293185505656835	permission.added	214	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.create"}		338293185505656835	1758134452.522019	214
338293185505656835	permission	338293185505656835	permission.added	215	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.write"}		338293185505656835	1758134452.522019	215
338293185505656835	permission	338293185505656835	permission.added	216	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.delete"}		338293185505656835	1758134452.522019	216
338293185505656835	permission	338293185505656835	permission.added	217	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	217
338293185505656835	permission	338293185505656835	permission.added	218	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.member.write"}		338293185505656835	1758134452.522019	218
338293185505656835	permission	338293185505656835	permission.added	219	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.member.delete"}		338293185505656835	1758134452.522019	219
338293185505656835	permission	338293185505656835	permission.added	220	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	220
338293185505656835	permission	338293185505656835	permission.added	221	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.role.write"}		338293185505656835	1758134452.522019	221
338293185505656835	permission	338293185505656835	permission.added	222	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.role.delete"}		338293185505656835	1758134452.522019	222
338293185505656835	permission	338293185505656835	permission.added	223	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	223
338293185505656835	permission	338293185505656835	permission.added	224	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.app.write"}		338293185505656835	1758134452.522019	224
338293185505656835	permission	338293185505656835	permission.added	225	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.app.delete"}		338293185505656835	1758134452.522019	225
338293185505656835	permission	338293185505656835	permission.added	226	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	226
338293185505656835	permission	338293185505656835	permission.added	227	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.grant.write"}		338293185505656835	1758134452.522019	227
338293185505656835	permission	338293185505656835	permission.added	228	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.grant.delete"}		338293185505656835	1758134452.522019	228
338293185505656835	permission	338293185505656835	permission.added	229	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	229
338293185505656835	permission	338293185505656835	permission.added	230	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.grant.member.write"}		338293185505656835	1758134452.522019	230
338293185505656835	permission	338293185505656835	permission.added	231	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "project.grant.member.delete"}		338293185505656835	1758134452.522019	231
338293185505656835	permission	338293185505656835	permission.added	232	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "session.read"}		338293185505656835	1758134452.522019	232
338293185505656835	permission	338293185505656835	permission.added	233	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ORG_MANAGER", "permission": "session.delete"}		338293185505656835	1758134452.522019	233
338293185505656835	permission	338293185505656835	permission.added	234	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "iam.read"}		338293185505656835	1758134452.522019	234
338293185505656835	permission	338293185505656835	permission.added	235	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "iam.policy.read"}		338293185505656835	1758134452.522019	235
338293185505656835	permission	338293185505656835	permission.added	236	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "iam.member.read"}		338293185505656835	1758134452.522019	236
338293185505656835	permission	338293185505656835	permission.added	237	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "iam.member.write"}		338293185505656835	1758134452.522019	237
338293185505656835	permission	338293185505656835	permission.added	238	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "iam.idp.read"}		338293185505656835	1758134452.522019	238
338293185505656835	permission	338293185505656835	permission.added	239	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "iam.feature.read"}		338293185505656835	1758134452.522019	239
338293185505656835	permission	338293185505656835	permission.added	240	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "iam.restrictions.read"}		338293185505656835	1758134452.522019	240
338293185505656835	permission	338293185505656835	permission.added	241	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "org.read"}		338293185505656835	1758134452.522019	241
338293185505656835	permission	338293185505656835	permission.added	242	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "org.member.read"}		338293185505656835	1758134452.522019	242
338293185505656835	permission	338293185505656835	permission.added	243	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "org.member.write"}		338293185505656835	1758134452.522019	243
338293185505656835	permission	338293185505656835	permission.added	244	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "org.idp.read"}		338293185505656835	1758134452.522019	244
338293185505656835	permission	338293185505656835	permission.added	245	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "org.feature.read"}		338293185505656835	1758134452.522019	245
338293185505656835	permission	338293185505656835	permission.added	246	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.read"}		338293185505656835	1758134452.522019	246
338293185505656835	permission	338293185505656835	permission.added	247	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.write"}		338293185505656835	1758134452.522019	247
338293185505656835	permission	338293185505656835	permission.added	248	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	248
338293185505656835	permission	338293185505656835	permission.added	249	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	249
338293185505656835	permission	338293185505656835	permission.added	250	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	250
338293185505656835	permission	338293185505656835	permission.added	251	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.credential.write"}		338293185505656835	1758134452.522019	251
338293185505656835	permission	338293185505656835	permission.added	252	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.passkey.write"}		338293185505656835	1758134452.522019	252
338293185505656835	permission	338293185505656835	permission.added	253	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	253
338293185505656835	permission	338293185505656835	permission.added	254	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "policy.read"}		338293185505656835	1758134452.522019	254
338293185505656835	permission	338293185505656835	permission.added	255	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.read"}		338293185505656835	1758134452.522019	255
338293185505656835	permission	338293185505656835	permission.added	256	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.member.read"}		338293185505656835	1758134452.522019	256
338293185505656835	permission	338293185505656835	permission.added	257	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.member.write"}		338293185505656835	1758134452.522019	257
338293185505656835	permission	338293185505656835	permission.added	258	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.role.read"}		338293185505656835	1758134452.522019	258
338293185505656835	permission	338293185505656835	permission.added	259	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.app.read"}		338293185505656835	1758134452.522019	259
338293185505656835	permission	338293185505656835	permission.added	260	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.member.read"}		338293185505656835	1758134452.522019	260
338293185505656835	permission	338293185505656835	permission.added	261	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.member.write"}		338293185505656835	1758134452.522019	261
338293185505656835	permission	338293185505656835	permission.added	262	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	262
338293185505656835	permission	338293185505656835	permission.added	263	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	263
338293185505656835	permission	338293185505656835	permission.added	264	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "project.grant.member.write"}		338293185505656835	1758134452.522019	264
338293185505656835	permission	338293185505656835	permission.added	265	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "session.read"}		338293185505656835	1758134452.522019	265
338293185505656835	permission	338293185505656835	permission.added	266	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "session.write"}		338293185505656835	1758134452.522019	266
338293185505656835	permission	338293185505656835	permission.added	267	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "session.link"}		338293185505656835	1758134452.522019	267
338293185505656835	permission	338293185505656835	permission.added	268	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "session.delete"}		338293185505656835	1758134452.522019	268
338293185505656835	permission	338293185505656835	permission.added	269	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_LOGIN_CLIENT", "permission": "userschema.read"}		338293185505656835	1758134452.522019	269
338293185505656835	permission	338293185505656835	permission.added	270	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.read"}		338293185505656835	1758134452.522019	270
338293185505656835	permission	338293185505656835	permission.added	271	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.policy.read"}		338293185505656835	1758134452.522019	271
338293185505656835	permission	338293185505656835	permission.added	272	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.member.read"}		338293185505656835	1758134452.522019	272
338293185505656835	permission	338293185505656835	permission.added	273	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.idp.read"}		338293185505656835	1758134452.522019	273
338293185505656835	permission	338293185505656835	permission.added	274	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.action.read"}		338293185505656835	1758134452.522019	274
338293185505656835	permission	338293185505656835	permission.added	275	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.flow.read"}		338293185505656835	1758134452.522019	275
338293185505656835	permission	338293185505656835	permission.added	276	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.restrictions.read"}		338293185505656835	1758134452.522019	276
338293185505656835	permission	338293185505656835	permission.added	277	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.feature.read"}		338293185505656835	1758134452.522019	277
338293185505656835	permission	338293185505656835	permission.added	278	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.web_key.read"}		338293185505656835	1758134452.522019	278
338293185505656835	permission	338293185505656835	permission.added	279	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "iam.debug.read"}		338293185505656835	1758134452.522019	279
338293185505656835	permission	338293185505656835	permission.added	280	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "org.read"}		338293185505656835	1758134452.522019	280
338293185505656835	permission	338293185505656835	permission.added	281	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "org.member.read"}		338293185505656835	1758134452.522019	281
338293185505656835	permission	338293185505656835	permission.added	282	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "org.idp.read"}		338293185505656835	1758134452.522019	282
338293185505656835	permission	338293185505656835	permission.added	283	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "org.action.read"}		338293185505656835	1758134452.522019	283
338293185505656835	permission	338293185505656835	permission.added	284	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "org.flow.read"}		338293185505656835	1758134452.522019	284
338293185505656835	permission	338293185505656835	permission.added	285	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "org.feature.read"}		338293185505656835	1758134452.522019	285
338293185505656835	permission	338293185505656835	permission.added	286	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "user.read"}		338293185505656835	1758134452.522019	286
338293185505656835	permission	338293185505656835	permission.added	287	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	287
338293185505656835	permission	338293185505656835	permission.added	288	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	288
338293185505656835	permission	338293185505656835	permission.added	289	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	289
338293185505656835	permission	338293185505656835	permission.added	290	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	290
338293185505656835	permission	338293185505656835	permission.added	291	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "policy.read"}		338293185505656835	1758134452.522019	291
338293185505656835	permission	338293185505656835	permission.added	292	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "project.read"}		338293185505656835	1758134452.522019	292
338293185505656835	permission	338293185505656835	permission.added	293	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	293
338293185505656835	permission	338293185505656835	permission.added	294	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	294
338293185505656835	permission	338293185505656835	permission.added	295	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	295
338293185505656835	permission	338293185505656835	permission.added	296	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	296
338293185505656835	permission	338293185505656835	permission.added	297	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	297
338293185505656835	permission	338293185505656835	permission.added	298	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "events.read"}		338293185505656835	1758134452.522019	298
338293185505656835	permission	338293185505656835	permission.added	299	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "milestones.read"}		338293185505656835	1758134452.522019	299
338293185505656835	permission	338293185505656835	permission.added	300	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "action.target.read"}		338293185505656835	1758134452.522019	300
338293185505656835	permission	338293185505656835	permission.added	301	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "action.execution.read"}		338293185505656835	1758134452.522019	301
338293185505656835	permission	338293185505656835	permission.added	302	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "userschema.read"}		338293185505656835	1758134452.522019	302
338293185505656835	permission	338293185505656835	permission.added	303	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_OWNER_VIEWER", "permission": "session.read"}		338293185505656835	1758134452.522019	303
338293185505656835	permission	338293185505656835	permission.added	304	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "org.read"}		338293185505656835	1758134452.522019	304
338293185505656835	permission	338293185505656835	permission.added	305	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "org.global.read"}		338293185505656835	1758134452.522019	305
338293185505656835	permission	338293185505656835	permission.added	306	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "org.member.read"}		338293185505656835	1758134452.522019	306
338293185505656835	permission	338293185505656835	permission.added	307	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "org.member.delete"}		338293185505656835	1758134452.522019	307
338293185505656835	permission	338293185505656835	permission.added	308	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.read"}		338293185505656835	1758134452.522019	308
338293185505656835	permission	338293185505656835	permission.added	309	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	309
338293185505656835	permission	338293185505656835	permission.added	310	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.write"}		338293185505656835	1758134452.522019	310
338293185505656835	permission	338293185505656835	permission.added	311	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.delete"}		338293185505656835	1758134452.522019	311
338293185505656835	permission	338293185505656835	permission.added	312	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	312
338293185505656835	permission	338293185505656835	permission.added	313	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	313
338293185505656835	permission	338293185505656835	permission.added	314	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	314
338293185505656835	permission	338293185505656835	permission.added	315	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	315
338293185505656835	permission	338293185505656835	permission.added	316	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.passkey.write"}		338293185505656835	1758134452.522019	316
338293185505656835	permission	338293185505656835	permission.added	317	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	317
338293185505656835	permission	338293185505656835	permission.added	318	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.feature.write"}		338293185505656835	1758134452.522019	318
338293185505656835	permission	338293185505656835	permission.added	319	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "user.feature.delete"}		338293185505656835	1758134452.522019	319
338293185505656835	permission	338293185505656835	permission.added	320	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.read"}		338293185505656835	1758134452.522019	320
338293185505656835	permission	338293185505656835	permission.added	321	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	321
338293185505656835	permission	338293185505656835	permission.added	322	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	322
338293185505656835	permission	338293185505656835	permission.added	323	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	323
338293185505656835	permission	338293185505656835	permission.added	324	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	324
338293185505656835	permission	338293185505656835	permission.added	325	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.grant.write"}		338293185505656835	1758134452.522019	325
338293185505656835	permission	338293185505656835	permission.added	326	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.grant.delete"}		338293185505656835	1758134452.522019	326
338293185505656835	permission	338293185505656835	permission.added	327	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	327
338293185505656835	permission	338293185505656835	permission.added	328	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "session.read"}		338293185505656835	1758134452.522019	328
338293185505656835	permission	338293185505656835	permission.added	329	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_USER_MANAGER", "permission": "session.delete"}		338293185505656835	1758134452.522019	329
338293185505656835	permission	338293185505656835	permission.added	330	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "org.read"}		338293185505656835	1758134452.522019	330
338293185505656835	permission	338293185505656835	permission.added	331	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "org.member.read"}		338293185505656835	1758134452.522019	331
338293185505656835	permission	338293185505656835	permission.added	332	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "org.idp.read"}		338293185505656835	1758134452.522019	332
338293185505656835	permission	338293185505656835	permission.added	333	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "org.action.read"}		338293185505656835	1758134452.522019	333
338293185505656835	permission	338293185505656835	permission.added	334	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "org.flow.read"}		338293185505656835	1758134452.522019	334
338293185505656835	permission	338293185505656835	permission.added	335	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "org.feature.read"}		338293185505656835	1758134452.522019	335
338293185505656835	permission	338293185505656835	permission.added	336	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "user.read"}		338293185505656835	1758134452.522019	336
338293185505656835	permission	338293185505656835	permission.added	337	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	337
338293185505656835	permission	338293185505656835	permission.added	338	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	338
338293185505656835	permission	338293185505656835	permission.added	339	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	339
338293185505656835	permission	338293185505656835	permission.added	340	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	340
338293185505656835	permission	338293185505656835	permission.added	341	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "policy.read"}		338293185505656835	1758134452.522019	341
338293185505656835	permission	338293185505656835	permission.added	342	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "project.read"}		338293185505656835	1758134452.522019	342
338293185505656835	permission	338293185505656835	permission.added	343	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	343
338293185505656835	permission	338293185505656835	permission.added	344	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	344
338293185505656835	permission	338293185505656835	permission.added	345	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	345
338293185505656835	permission	338293185505656835	permission.added	346	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	346
338293185505656835	permission	338293185505656835	permission.added	347	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	347
338293185505656835	permission	338293185505656835	permission.added	348	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_OWNER_VIEWER", "permission": "project.grant.user.grant.read"}		338293185505656835	1758134452.522019	348
338293185505656835	permission	338293185505656835	permission.added	349	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "org.read"}		338293185505656835	1758134452.522019	349
338293185505656835	permission	338293185505656835	permission.added	350	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.read"}		338293185505656835	1758134452.522019	350
338293185505656835	permission	338293185505656835	permission.added	351	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	351
338293185505656835	permission	338293185505656835	permission.added	352	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.write"}		338293185505656835	1758134452.522019	352
338293185505656835	permission	338293185505656835	permission.added	353	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.delete"}		338293185505656835	1758134452.522019	353
338293185505656835	permission	338293185505656835	permission.added	354	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	354
338293185505656835	permission	338293185505656835	permission.added	355	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	355
338293185505656835	permission	338293185505656835	permission.added	356	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	356
338293185505656835	permission	338293185505656835	permission.added	357	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	357
338293185505656835	permission	338293185505656835	permission.added	358	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.feature.read"}		338293185505656835	1758134452.522019	358
338293185505656835	permission	338293185505656835	permission.added	359	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.feature.write"}		338293185505656835	1758134452.522019	359
338293185505656835	permission	338293185505656835	permission.added	360	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "user.feature.delete"}		338293185505656835	1758134452.522019	360
338293185505656835	permission	338293185505656835	permission.added	361	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "policy.read"}		338293185505656835	1758134452.522019	361
338293185505656835	permission	338293185505656835	permission.added	362	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "project.read"}		338293185505656835	1758134452.522019	362
338293185505656835	permission	338293185505656835	permission.added	363	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	363
338293185505656835	permission	338293185505656835	permission.added	364	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "session.read"}		338293185505656835	1758134452.522019	364
338293185505656835	permission	338293185505656835	permission.added	365	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_MANAGER", "permission": "session.delete"}		338293185505656835	1758134452.522019	365
338293185505656835	permission	338293185505656835	permission.added	366	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_CREATOR", "permission": "user.global.read"}		338293185505656835	1758134452.522019	366
338293185505656835	permission	338293185505656835	permission.added	367	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_CREATOR", "permission": "policy.read"}		338293185505656835	1758134452.522019	367
338293185505656835	permission	338293185505656835	permission.added	368	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_CREATOR", "permission": "project.read:self"}		338293185505656835	1758134452.522019	368
338293185505656835	permission	338293185505656835	permission.added	369	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_CREATOR", "permission": "project.create"}		338293185505656835	1758134452.522019	369
338293185505656835	permission	338293185505656835	permission.added	370	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "policy.read"}		338293185505656835	1758134452.522019	370
338293185505656835	permission	338293185505656835	permission.added	371	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "org.global.read"}		338293185505656835	1758134452.522019	371
338293185505656835	permission	338293185505656835	permission.added	372	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "project.read"}		338293185505656835	1758134452.522019	372
338293185505656835	permission	338293185505656835	permission.added	373	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	373
338293185505656835	permission	338293185505656835	permission.added	374	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	374
338293185505656835	permission	338293185505656835	permission.added	375	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "project.grant.member.write"}		338293185505656835	1758134452.522019	375
338293185505656835	permission	338293185505656835	permission.added	376	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "project.grant.member.delete"}		338293185505656835	1758134452.522019	376
338293185505656835	permission	338293185505656835	permission.added	377	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "user.read"}		338293185505656835	1758134452.522019	377
338293185505656835	permission	338293185505656835	permission.added	378	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	378
338293185505656835	permission	338293185505656835	permission.added	379	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	379
338293185505656835	permission	338293185505656835	permission.added	380	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	380
338293185505656835	permission	338293185505656835	permission.added	381	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	381
338293185505656835	permission	338293185505656835	permission.added	382	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	382
338293185505656835	permission	338293185505656835	permission.added	383	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.read"}		338293185505656835	1758134452.522019	383
338293185505656835	permission	338293185505656835	permission.added	384	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.write"}		338293185505656835	1758134452.522019	384
338293185505656835	permission	338293185505656835	permission.added	385	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.member.read"}		338293185505656835	1758134452.522019	385
338293185505656835	permission	338293185505656835	permission.added	386	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.idp.read"}		338293185505656835	1758134452.522019	386
338293185505656835	permission	338293185505656835	permission.added	387	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.idp.write"}		338293185505656835	1758134452.522019	387
338293185505656835	permission	338293185505656835	permission.added	388	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.idp.delete"}		338293185505656835	1758134452.522019	388
338293185505656835	permission	338293185505656835	permission.added	389	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.feature.read"}		338293185505656835	1758134452.522019	389
338293185505656835	permission	338293185505656835	permission.added	390	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.feature.write"}		338293185505656835	1758134452.522019	390
338293185505656835	permission	338293185505656835	permission.added	391	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "org.feature.delete"}		338293185505656835	1758134452.522019	391
338293185505656835	permission	338293185505656835	permission.added	392	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "policy.read"}		338293185505656835	1758134452.522019	392
338293185505656835	permission	338293185505656835	permission.added	393	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "policy.write"}		338293185505656835	1758134452.522019	393
338293185505656835	permission	338293185505656835	permission.added	394	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_SETTINGS_MANAGER", "permission": "policy.delete"}		338293185505656835	1758134452.522019	394
	system	SYSTEM	system.migration.done	32	1	2025-09-17 18:40:52.644738+00	{"name": "16_unique_constraint_lower"}	system	SYSTEM	1758134452.644738	1
338293185505656835	permission	338293185505656835	permission.added	395	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "org.global.read"}		338293185505656835	1758134452.522019	395
338293185505656835	permission	338293185505656835	permission.added	396	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "policy.read"}		338293185505656835	1758134452.522019	396
338293185505656835	permission	338293185505656835	permission.added	397	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.read"}		338293185505656835	1758134452.522019	397
338293185505656835	permission	338293185505656835	permission.added	398	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.write"}		338293185505656835	1758134452.522019	398
338293185505656835	permission	338293185505656835	permission.added	399	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.delete"}		338293185505656835	1758134452.522019	399
338293185505656835	permission	338293185505656835	permission.added	400	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.member.read"}		338293185505656835	1758134452.522019	400
338293185505656835	permission	338293185505656835	permission.added	401	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.member.write"}		338293185505656835	1758134452.522019	401
338293185505656835	permission	338293185505656835	permission.added	402	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.member.delete"}		338293185505656835	1758134452.522019	402
338293185505656835	permission	338293185505656835	permission.added	403	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.role.read"}		338293185505656835	1758134452.522019	403
338293185505656835	permission	338293185505656835	permission.added	404	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.role.write"}		338293185505656835	1758134452.522019	404
338293185505656835	permission	338293185505656835	permission.added	405	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.role.delete"}		338293185505656835	1758134452.522019	405
338293185505656835	permission	338293185505656835	permission.added	406	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.app.read"}		338293185505656835	1758134452.522019	406
338293185505656835	permission	338293185505656835	permission.added	407	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.app.write"}		338293185505656835	1758134452.522019	407
338293185505656835	permission	338293185505656835	permission.added	408	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "project.app.delete"}		338293185505656835	1758134452.522019	408
338293185505656835	permission	338293185505656835	permission.added	409	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "user.global.read"}		338293185505656835	1758134452.522019	409
338293185505656835	permission	338293185505656835	permission.added	410	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	410
338293185505656835	permission	338293185505656835	permission.added	411	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	411
338293185505656835	permission	338293185505656835	permission.added	412	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	412
338293185505656835	permission	338293185505656835	permission.added	413	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_GLOBAL", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	413
338293185505656835	permission	338293185505656835	permission.added	414	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "policy.read"}		338293185505656835	1758134452.522019	414
338293185505656835	permission	338293185505656835	permission.added	415	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "project.read"}		338293185505656835	1758134452.522019	415
338293185505656835	permission	338293185505656835	permission.added	416	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "project.member.read"}		338293185505656835	1758134452.522019	416
338293185505656835	permission	338293185505656835	permission.added	417	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "project.role.read"}		338293185505656835	1758134452.522019	417
338293185505656835	permission	338293185505656835	permission.added	418	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "project.app.read"}		338293185505656835	1758134452.522019	418
338293185505656835	permission	338293185505656835	permission.added	419	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	419
338293185505656835	permission	338293185505656835	permission.added	420	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	420
338293185505656835	permission	338293185505656835	permission.added	421	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "user.read"}		338293185505656835	1758134452.522019	421
338293185505656835	permission	338293185505656835	permission.added	422	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	422
338293185505656835	permission	338293185505656835	permission.added	423	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	423
338293185505656835	permission	338293185505656835	permission.added	424	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	424
338293185505656835	permission	338293185505656835	permission.added	425	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_SELF_MANAGER", "permission": "policy.read"}		338293185505656835	1758134452.522019	425
338293185505656835	permission	338293185505656835	permission.added	426	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_SELF_MANAGER", "permission": "user.self.delete"}		338293185505656835	1758134452.522019	426
338293185505656835	permission	338293185505656835	permission.added	427	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ADMIN_IMPERSONATOR", "permission": "admin.impersonation"}		338293185505656835	1758134452.522019	427
338293185505656835	permission	338293185505656835	permission.added	428	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_ADMIN_IMPERSONATOR", "permission": "impersonation"}		338293185505656835	1758134452.522019	428
338293185505656835	permission	338293185505656835	permission.added	429	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_ADMIN_IMPERSONATOR", "permission": "admin.impersonation"}		338293185505656835	1758134452.522019	429
338293185505656835	permission	338293185505656835	permission.added	430	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_ADMIN_IMPERSONATOR", "permission": "impersonation"}		338293185505656835	1758134452.522019	430
338293185505656835	permission	338293185505656835	permission.added	431	1	2025-09-17 18:40:52.522019+00	{"role": "SELF_MANAGEMENT_GLOBAL", "permission": "org.create"}		338293185505656835	1758134452.522019	431
338293185505656835	permission	338293185505656835	permission.added	432	1	2025-09-17 18:40:52.522019+00	{"role": "SELF_MANAGEMENT_GLOBAL", "permission": "policy.read"}		338293185505656835	1758134452.522019	432
338293185505656835	permission	338293185505656835	permission.added	433	1	2025-09-17 18:40:52.522019+00	{"role": "SELF_MANAGEMENT_GLOBAL", "permission": "user.self.delete"}		338293185505656835	1758134452.522019	433
338293185505656835	permission	338293185505656835	permission.added	434	1	2025-09-17 18:40:52.522019+00	{"role": "IAM_END_USER_IMPERSONATOR", "permission": "impersonation"}		338293185505656835	1758134452.522019	434
338293185505656835	permission	338293185505656835	permission.added	435	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_END_USER_IMPERSONATOR", "permission": "impersonation"}		338293185505656835	1758134452.522019	435
338293185505656835	permission	338293185505656835	permission.added	436	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "org.read"}		338293185505656835	1758134452.522019	436
338293185505656835	permission	338293185505656835	permission.added	437	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "org.member.read"}		338293185505656835	1758134452.522019	437
338293185505656835	permission	338293185505656835	permission.added	438	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "user.read"}		338293185505656835	1758134452.522019	438
338293185505656835	permission	338293185505656835	permission.added	439	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "user.global.read"}		338293185505656835	1758134452.522019	439
338293185505656835	permission	338293185505656835	permission.added	440	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	440
338293185505656835	permission	338293185505656835	permission.added	441	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	441
338293185505656835	permission	338293185505656835	permission.added	442	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	442
338293185505656835	permission	338293185505656835	permission.added	443	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "policy.read"}		338293185505656835	1758134452.522019	443
338293185505656835	permission	338293185505656835	permission.added	444	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "project.read"}		338293185505656835	1758134452.522019	444
338293185505656835	permission	338293185505656835	permission.added	445	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "project.member.read"}		338293185505656835	1758134452.522019	445
338293185505656835	permission	338293185505656835	permission.added	446	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "project.role.read"}		338293185505656835	1758134452.522019	446
338293185505656835	permission	338293185505656835	permission.added	447	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "project.app.read"}		338293185505656835	1758134452.522019	447
338293185505656835	permission	338293185505656835	permission.added	448	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	448
338293185505656835	permission	338293185505656835	permission.added	449	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_USER_PERMISSION_EDITOR", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	449
338293185505656835	permission	338293185505656835	permission.added	450	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "policy.read"}		338293185505656835	1758134452.522019	450
338293185505656835	permission	338293185505656835	permission.added	451	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "project.read"}		338293185505656835	1758134452.522019	451
338293185505656835	permission	338293185505656835	permission.added	452	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	452
338293185505656835	permission	338293185505656835	permission.added	453	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	453
338293185505656835	permission	338293185505656835	permission.added	454	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "user.read"}		338293185505656835	1758134452.522019	454
338293185505656835	permission	338293185505656835	permission.added	455	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "user.global.read"}		338293185505656835	1758134452.522019	455
338293185505656835	permission	338293185505656835	permission.added	456	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	456
338293185505656835	permission	338293185505656835	permission.added	457	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_GRANT_OWNER_VIEWER", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	457
338293185505656835	permission	338293185505656835	permission.added	458	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "policy.read"}		338293185505656835	1758134452.522019	458
338293185505656835	permission	338293185505656835	permission.added	459	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "project.read"}		338293185505656835	1758134452.522019	459
338293185505656835	permission	338293185505656835	permission.added	460	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "project.member.read"}		338293185505656835	1758134452.522019	460
338293185505656835	permission	338293185505656835	permission.added	461	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "project.role.read"}		338293185505656835	1758134452.522019	461
	system	SYSTEM	system.migration.started	33	1	2025-09-17 18:40:52.645954+00	{"name": "17_add_offset_col_to_current_states"}	system	SYSTEM	1758134452.645954	1
338293185505656835	permission	338293185505656835	permission.added	462	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "project.app.read"}		338293185505656835	1758134452.522019	462
338293185505656835	permission	338293185505656835	permission.added	463	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	463
338293185505656835	permission	338293185505656835	permission.added	464	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	464
338293185505656835	permission	338293185505656835	permission.added	465	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "user.global.read"}		338293185505656835	1758134452.522019	465
338293185505656835	permission	338293185505656835	permission.added	466	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	466
338293185505656835	permission	338293185505656835	permission.added	467	1	2025-09-17 18:40:52.522019+00	{"role": "PROJECT_OWNER_VIEWER_GLOBAL", "permission": "user.membership.read"}		338293185505656835	1758134452.522019	467
338293185505656835	permission	338293185505656835	permission.added	468	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "org.read"}		338293185505656835	1758134452.522019	468
338293185505656835	permission	338293185505656835	permission.added	469	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "org.member.read"}		338293185505656835	1758134452.522019	469
338293185505656835	permission	338293185505656835	permission.added	470	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "user.read"}		338293185505656835	1758134452.522019	470
338293185505656835	permission	338293185505656835	permission.added	471	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "user.global.read"}		338293185505656835	1758134452.522019	471
338293185505656835	permission	338293185505656835	permission.added	472	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "user.grant.read"}		338293185505656835	1758134452.522019	472
338293185505656835	permission	338293185505656835	permission.added	473	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "user.grant.write"}		338293185505656835	1758134452.522019	473
338293185505656835	permission	338293185505656835	permission.added	474	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "user.grant.delete"}		338293185505656835	1758134452.522019	474
338293185505656835	permission	338293185505656835	permission.added	475	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "policy.read"}		338293185505656835	1758134452.522019	475
338293185505656835	permission	338293185505656835	permission.added	476	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.read"}		338293185505656835	1758134452.522019	476
338293185505656835	permission	338293185505656835	permission.added	477	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.member.read"}		338293185505656835	1758134452.522019	477
338293185505656835	permission	338293185505656835	permission.added	478	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.role.read"}		338293185505656835	1758134452.522019	478
338293185505656835	permission	338293185505656835	permission.added	479	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.app.read"}		338293185505656835	1758134452.522019	479
338293185505656835	permission	338293185505656835	permission.added	480	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.grant.read"}		338293185505656835	1758134452.522019	480
338293185505656835	permission	338293185505656835	permission.added	481	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.grant.write"}		338293185505656835	1758134452.522019	481
338293185505656835	permission	338293185505656835	permission.added	482	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.grant.delete"}		338293185505656835	1758134452.522019	482
338293185505656835	permission	338293185505656835	permission.added	483	1	2025-09-17 18:40:52.522019+00	{"role": "ORG_PROJECT_PERMISSION_EDITOR", "permission": "project.grant.member.read"}		338293185505656835	1758134452.522019	483
	system	SYSTEM	system.migration.done	16	1	2025-09-17 18:40:52.598876+00	{"name": "03_default_instance"}	system	SYSTEM	1758134452.598876	1
	system	SYSTEM	system.migration.started	17	1	2025-09-17 18:40:52.600227+00	{"name": "05_last_failed"}	system	SYSTEM	1758134452.600227	1
	system	SYSTEM	system.migration.done	18	1	2025-09-17 18:40:52.603468+00	{"name": "05_last_failed"}	system	SYSTEM	1758134452.603468	1
	system	SYSTEM	system.migration.started	19	1	2025-09-17 18:40:52.604514+00	{"name": "06_resource_owner_columns"}	system	SYSTEM	1758134452.604514	1
	system	SYSTEM	system.migration.done	20	1	2025-09-17 18:40:52.616792+00	{"name": "06_resource_owner_columns"}	system	SYSTEM	1758134452.616792	1
	system	SYSTEM	system.migration.started	21	1	2025-09-17 18:40:52.618249+00	{"name": "07_logstore"}	system	SYSTEM	1758134452.618249	1
	system	SYSTEM	system.migration.done	22	1	2025-09-17 18:40:52.622509+00	{"name": "07_logstore"}	system	SYSTEM	1758134452.622509	1
	system	SYSTEM	system.migration.started	23	1	2025-09-17 18:40:52.624144+00	{"name": "08_auth_token_indexes"}	system	SYSTEM	1758134452.624144	1
	system	SYSTEM	system.migration.done	24	1	2025-09-17 18:40:52.627337+00	{"name": "08_auth_token_indexes"}	system	SYSTEM	1758134452.627337	1
	system	SYSTEM	system.migration.started	25	1	2025-09-17 18:40:52.628613+00	{"name": "12_auth_users_otp_columns"}	system	SYSTEM	1758134452.628613	1
	system	SYSTEM	system.migration.done	26	1	2025-09-17 18:40:52.631034+00	{"name": "12_auth_users_otp_columns"}	system	SYSTEM	1758134452.631034	1
	system	SYSTEM	system.migration.started	27	1	2025-09-17 18:40:52.632317+00	{"name": "13_fix_quota_constraints"}	system	SYSTEM	1758134452.632317	1
	system	SYSTEM	system.migration.done	28	1	2025-09-17 18:40:52.633315+00	{"name": "13_fix_quota_constraints"}	system	SYSTEM	1758134452.633315	1
	system	SYSTEM	system.migration.started	29	1	2025-09-17 18:40:52.634408+00	{"name": "15_current_projection_state"}	system	SYSTEM	1758134452.634408	1
	system	SYSTEM	system.migration.done	30	1	2025-09-17 18:40:52.642091+00	{"name": "15_current_projection_state"}	system	SYSTEM	1758134452.642091	1
	system	SYSTEM	system.migration.started	31	1	2025-09-17 18:40:52.643344+00	{"name": "16_unique_constraint_lower"}	system	SYSTEM	1758134452.643344	1
	system	SYSTEM	system.migration.done	34	1	2025-09-17 18:40:52.647599+00	{"name": "17_add_offset_col_to_current_states"}	system	SYSTEM	1758134452.647599	1
	system	SYSTEM	system.migration.started	35	1	2025-09-17 18:40:52.648702+00	{"name": "19_add_current_sequences_index"}	system	SYSTEM	1758134452.648702	1
	system	SYSTEM	system.migration.done	36	1	2025-09-17 18:40:52.651947+00	{"name": "19_add_current_sequences_index"}	system	SYSTEM	1758134452.651947	1
	system	SYSTEM	system.migration.started	37	1	2025-09-17 18:40:52.653468+00	{"name": "20_add_by_user_index_on_session"}	system	SYSTEM	1758134452.653468	1
	system	SYSTEM	system.migration.done	38	1	2025-09-17 18:40:52.656505+00	{"name": "20_add_by_user_index_on_session"}	system	SYSTEM	1758134452.656505	1
	system	SYSTEM	system.migration.started	39	1	2025-09-17 18:40:52.657701+00	{"name": "22_active_instance_events_index"}	system	SYSTEM	1758134452.657701	1
	system	SYSTEM	system.migration.done	40	1	2025-09-17 18:40:52.660754+00	{"name": "22_active_instance_events_index"}	system	SYSTEM	1758134452.660754	1
	system	SYSTEM	system.migration.started	41	1	2025-09-17 18:40:52.66229+00	{"name": "23_correct_global_unique_constraints"}	system	SYSTEM	1758134452.662290	1
	system	SYSTEM	system.migration.done	42	1	2025-09-17 18:40:52.663813+00	{"name": "23_correct_global_unique_constraints"}	system	SYSTEM	1758134452.663813	1
	system	SYSTEM	system.migration.started	43	1	2025-09-17 18:40:52.665036+00	{"name": "24_add_actor_col_to_auth_tokens"}	system	SYSTEM	1758134452.665036	1
	system	SYSTEM	system.migration.done	44	1	2025-09-17 18:40:52.666676+00	{"name": "24_add_actor_col_to_auth_tokens"}	system	SYSTEM	1758134452.666676	1
	system	SYSTEM	system.migration.started	45	1	2025-09-17 18:40:52.667991+00	{"name": "26_auth_users3"}	system	SYSTEM	1758134452.667991	1
	system	SYSTEM	system.migration.done	46	1	2025-09-17 18:40:52.670493+00	{"name": "26_auth_users3"}	system	SYSTEM	1758134452.670493	1
	system	SYSTEM	system.migration.started	47	1	2025-09-17 18:40:52.671709+00	{"name": "29_init_fields_for_project_grant"}	system	SYSTEM	1758134452.671709	1
	system	SYSTEM	system.migration.done	48	1	2025-09-17 18:40:52.684411+00	{"name": "29_init_fields_for_project_grant"}	system	SYSTEM	1758134452.684411	1
	system	SYSTEM	system.migration.started	49	1	2025-09-17 18:40:52.685767+00	{"name": "30_fill_fields_for_org_domain_verified"}	system	SYSTEM	1758134452.685767	1
	system	SYSTEM	system.migration.done	50	1	2025-09-17 18:40:52.689897+00	{"name": "30_fill_fields_for_org_domain_verified"}	system	SYSTEM	1758134452.689897	1
	system	SYSTEM	system.migration.started	51	1	2025-09-17 18:40:52.69111+00	{"name": "34_add_cache_schema"}	system	SYSTEM	1758134452.691110	1
	system	SYSTEM	system.migration.done	52	1	2025-09-17 18:40:52.695987+00	{"name": "34_add_cache_schema"}	system	SYSTEM	1758134452.695987	1
	system	SYSTEM	system.migration.started	53	1	2025-09-17 18:40:52.697635+00	{"name": "35_add_position_to_index_es_wm"}	system	SYSTEM	1758134452.697635	1
	system	SYSTEM	system.migration.done	54	1	2025-09-17 18:40:52.703836+00	{"name": "35_add_position_to_index_es_wm"}	system	SYSTEM	1758134452.703836	1
	system	SYSTEM	system.migration.started	55	1	2025-09-17 18:40:52.705438+00	{"name": "36_fill_v3_milestones"}	system	SYSTEM	1758134452.705438	1
	system	SYSTEM	system.migration.done	56	1	2025-09-17 18:40:52.706718+00	{"name": "36_fill_v3_milestones"}	system	SYSTEM	1758134452.706718	1
	system	SYSTEM	system.migration.started	57	1	2025-09-17 18:40:52.707855+00	{"name": "38_back_channel_logout_notification_start_"}	system	SYSTEM	1758134452.707855	1
	system	SYSTEM	system.migration.done	58	1	2025-09-17 18:40:52.709534+00	{"name": "38_back_channel_logout_notification_start_"}	system	SYSTEM	1758134452.709534	1
	system	SYSTEM	system.migration.started	59	1	2025-09-17 18:40:52.710807+00	{"name": "44_replace_current_sequences_index"}	system	SYSTEM	1758134452.710807	1
	system	SYSTEM	system.migration.done	60	1	2025-09-17 18:40:52.715747+00	{"name": "44_replace_current_sequences_index"}	system	SYSTEM	1758134452.715747	1
	system	SYSTEM	system.migration.started	61	1	2025-09-17 18:40:52.717528+00	{"name": "43_correct_project_owners"}	system	SYSTEM	1758134452.717528	1
	system	SYSTEM	system.migration.done	62	1	2025-09-17 18:40:52.720739+00	{"name": "43_correct_project_owners"}	system	SYSTEM	1758134452.720739	1
	system	SYSTEM	system.migration.started	63	1	2025-09-17 18:40:52.721863+00	{"name": "47_fill_membership_fields"}	system	SYSTEM	1758134452.721863	1
	system	SYSTEM	system.migration.done	64	1	2025-09-17 18:40:52.726867+00	{"name": "47_fill_membership_fields"}	system	SYSTEM	1758134452.726867	1
	system	SYSTEM	system.migration.started	65	1	2025-09-17 18:40:52.728148+00	{"name": "49_init_permitted_orgs_function"}	system	SYSTEM	1758134452.728148	1
	system	SYSTEM	system.migration.done	66	1	2025-09-17 18:40:52.729994+00	{"name": "49_init_permitted_orgs_function"}	system	SYSTEM	1758134452.729994	1
	system	SYSTEM	system.migration.started	67	1	2025-09-17 18:40:52.73123+00	{"name": "50_idp_templates6_add_use_pkce"}	system	SYSTEM	1758134452.731230	1
	system	SYSTEM	system.migration.done	68	1	2025-09-17 18:40:52.732185+00	{"name": "50_idp_templates6_add_use_pkce"}	system	SYSTEM	1758134452.732185	1
	system	SYSTEM	system.migration.started	69	1	2025-09-17 18:40:52.733352+00	{"name": "51_idp_templates6_add_root_ca"}	system	SYSTEM	1758134452.733352	1
	system	SYSTEM	system.migration.done	70	1	2025-09-17 18:40:52.734205+00	{"name": "51_idp_templates6_add_root_ca"}	system	SYSTEM	1758134452.734205	1
	system	SYSTEM	system.migration.started	71	1	2025-09-17 18:40:52.735361+00	{"name": "52_idp_templates6_ldap2"}	system	SYSTEM	1758134452.735361	1
	system	SYSTEM	system.migration.done	72	1	2025-09-17 18:40:52.738395+00	{"name": "52_idp_templates6_ldap2"}	system	SYSTEM	1758134452.738395	1
	system	SYSTEM	system.migration.started	73	1	2025-09-17 18:40:52.739873+00	{"name": "53_init_permitted_orgs_function_v2"}	system	SYSTEM	1758134452.739873	1
	system	SYSTEM	system.migration.done	74	1	2025-09-17 18:40:52.744457+00	{"name": "53_init_permitted_orgs_function_v2"}	system	SYSTEM	1758134452.744457	1
	system	SYSTEM	system.migration.started	75	1	2025-09-17 18:40:52.745691+00	{"name": "54_instance_position_index_again"}	system	SYSTEM	1758134452.745691	1
	system	SYSTEM	system.migration.done	76	1	2025-09-17 18:40:52.749152+00	{"name": "54_instance_position_index_again"}	system	SYSTEM	1758134452.749152	1
	system	SYSTEM	system.migration.started	77	1	2025-09-17 18:40:52.750569+00	{"name": "55_execution_handler_start"}	system	SYSTEM	1758134452.750569	1
	system	SYSTEM	system.migration.done	78	1	2025-09-17 18:40:52.752331+00	{"name": "55_execution_handler_start"}	system	SYSTEM	1758134452.752331	1
	system	SYSTEM	system.migration.started	79	1	2025-09-17 18:40:52.753583+00	{"name": "56_idp_templates6_add_saml_federated_logout"}	system	SYSTEM	1758134452.753583	1
	system	SYSTEM	system.migration.done	80	1	2025-09-17 18:40:52.754482+00	{"name": "56_idp_templates6_add_saml_federated_logout"}	system	SYSTEM	1758134452.754482	1
	system	SYSTEM	system.migration.started	81	1	2025-09-17 18:40:52.755643+00	{"name": "57_create_resource_counts"}	system	SYSTEM	1758134452.755643	1
	system	SYSTEM	system.migration.done	82	1	2025-09-17 18:40:52.759405+00	{"name": "57_create_resource_counts"}	system	SYSTEM	1758134452.759405	1
	system	SYSTEM	system.migration.started	83	1	2025-09-17 18:40:52.760761+00	{"name": "58_replace_login_names3_view"}	system	SYSTEM	1758134452.760761	1
	system	SYSTEM	system.migration.done	84	1	2025-09-17 18:40:52.762222+00	{"name": "58_replace_login_names3_view"}	system	SYSTEM	1758134452.762222	1
	system	SYSTEM	system.migration.started	85	1	2025-09-17 18:40:52.76354+00	{"name": "60_generate_system_id"}	system	SYSTEM	1758134452.763540	1
	system	SYSTEM	system.id.generated	86	1	2025-09-17 18:40:52.764389+00	{"id": "zMpQsa7Ik87Gxy6DW21ZGiZmctDekAU7c8M-s9LWqD8P8Vcqw-B0wfmiULOCUiCPGjfZQlEqPMkowrYYEbiuwA"}		SYSTEM	1758134452.764389	1
	system	SYSTEM	system.migration.done	87	1	2025-09-17 18:40:52.765188+00	{"name": "60_generate_system_id"}	system	SYSTEM	1758134452.765188	1
	system	SYSTEM	system.migration.started	88	1	2025-09-17 18:40:52.77004+00	{"name": "config_change"}	system	SYSTEM	1758134452.770040	1
	system	SYSTEM	system.migration.repeatable.done	89	1	2025-09-17 18:40:52.770915+00	{"name": "config_change", "lastRun": {"externalPort": 8080, "externalDomain": "localhost", "externalSecure": false}}	system	SYSTEM	1758134452.770915	1
	system	SYSTEM	system.migration.started	90	1	2025-09-17 18:40:52.77244+00	{"name": "projection_tables"}	system	SYSTEM	1758134452.772440	1
	system	SYSTEM	system.migration.repeatable.done	91	1	2025-09-17 18:40:52.947603+00	{"name": "projection_tables", "lastRun": {"version": "v4.0.3"}}	system	SYSTEM	1758134452.947603	1
	system	SYSTEM	system.migration.started	92	1	2025-09-17 18:40:52.949393+00	{"name": "repeatable_delete_stale_org_fields"}	system	SYSTEM	1758134452.949393	1
	system	SYSTEM	system.migration.repeatable.done	93	1	2025-09-17 18:40:52.950892+00	{"name": "repeatable_delete_stale_org_fields", "lastRun": {}}	system	SYSTEM	1758134452.950892	1
	system	SYSTEM	system.migration.started	94	1	2025-09-17 18:40:52.952393+00	{"name": "repeatable_fill_fields_for_instance_domains"}	system	SYSTEM	1758134452.952393	1
	system	SYSTEM	system.migration.repeatable.done	95	1	2025-09-17 18:40:52.956882+00	{"name": "repeatable_fill_fields_for_instance_domains", "lastRun": {}}	system	SYSTEM	1758134452.956882	1
	system	SYSTEM	system.migration.started	96	1	2025-09-17 18:40:52.958369+00	{"name": "repeatable_sync_role_permissions"}	system	SYSTEM	1758134452.958369	1
	permission	SYSTEM	permission.added	1	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.instance.read"}		SYSTEM	1758134452.960228	1
	permission	SYSTEM	permission.added	2	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.instance.write"}		SYSTEM	1758134452.960228	2
	permission	SYSTEM	permission.added	3	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.instance.delete"}		SYSTEM	1758134452.960228	3
	permission	SYSTEM	permission.added	4	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.domain.read"}		SYSTEM	1758134452.960228	4
	permission	SYSTEM	permission.added	5	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.domain.write"}		SYSTEM	1758134452.960228	5
	permission	SYSTEM	permission.added	6	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.domain.delete"}		SYSTEM	1758134452.960228	6
	permission	SYSTEM	permission.added	7	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.debug.read"}		SYSTEM	1758134452.960228	7
	permission	SYSTEM	permission.added	8	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.debug.write"}		SYSTEM	1758134452.960228	8
	permission	SYSTEM	permission.added	9	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.debug.delete"}		SYSTEM	1758134452.960228	9
	permission	SYSTEM	permission.added	10	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.feature.read"}		SYSTEM	1758134452.960228	10
	permission	SYSTEM	permission.added	11	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.feature.write"}		SYSTEM	1758134452.960228	11
	permission	SYSTEM	permission.added	12	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.feature.delete"}		SYSTEM	1758134452.960228	12
	permission	SYSTEM	permission.added	13	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.limits.write"}		SYSTEM	1758134452.960228	13
	permission	SYSTEM	permission.added	14	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.limits.delete"}		SYSTEM	1758134452.960228	14
	permission	SYSTEM	permission.added	15	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.quota.write"}		SYSTEM	1758134452.960228	15
	permission	SYSTEM	permission.added	16	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.quota.delete"}		SYSTEM	1758134452.960228	16
	permission	SYSTEM	permission.added	17	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER", "permission": "system.iam.member.read"}		SYSTEM	1758134452.960228	17
	permission	SYSTEM	permission.added	18	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER_VIEWER", "permission": "system.instance.read"}		SYSTEM	1758134452.960228	18
	permission	SYSTEM	permission.added	19	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER_VIEWER", "permission": "system.domain.read"}		SYSTEM	1758134452.960228	19
	permission	SYSTEM	permission.added	20	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER_VIEWER", "permission": "system.debug.read"}		SYSTEM	1758134452.960228	20
	permission	SYSTEM	permission.added	21	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER_VIEWER", "permission": "system.feature.read"}		SYSTEM	1758134452.960228	21
	permission	SYSTEM	permission.added	22	1	2025-09-17 18:40:52.960228+00	{"role": "SYSTEM_OWNER_VIEWER", "permission": "system.iam.member.read"}		SYSTEM	1758134452.960228	22
	system	SYSTEM	system.migration.repeatable.done	97	1	2025-09-17 18:40:52.966368+00	{"name": "repeatable_sync_role_permissions", "lastRun": {}}	system	SYSTEM	1758134452.966368	1
	system	SYSTEM	system.migration.started	98	1	2025-09-17 18:40:52.967921+00	{"name": "repeatable_migrate_river"}	system	SYSTEM	1758134452.967921	1
	system	SYSTEM	system.migration.repeatable.done	99	1	2025-09-17 18:40:52.995653+00	{"name": "repeatable_migrate_river", "lastRun": {}}	system	SYSTEM	1758134452.995653	1
	system	SYSTEM	system.migration.started	100	1	2025-09-17 18:40:52.998077+00	{"name": "repeatable_instance_delete_parent_counts_trigger"}	system	SYSTEM	1758134452.998077	1
	system	SYSTEM	system.migration.started	174	1	2025-09-17 18:40:53.148878+00	{"name": "projections.project_grants4"}	system	SYSTEM	1758134453.148878	1
	system	SYSTEM	system.migration.repeatable.done	101	1	2025-09-17 18:40:53.000014+00	{"name": "repeatable_instance_delete_parent_counts_trigger", "lastRun": {"table": "projections.instances", "resource": "instance", "parent_type": "instance", "parent_id_column": "id", "instance_id_column": "id"}}	system	SYSTEM	1758134453.000014	1
	system	SYSTEM	system.migration.started	102	1	2025-09-17 18:40:53.00181+00	{"name": "repeatable_organization_delete_parent_counts_trigger"}	system	SYSTEM	1758134453.001810	1
	system	SYSTEM	system.migration.repeatable.done	103	1	2025-09-17 18:40:53.003518+00	{"name": "repeatable_organization_delete_parent_counts_trigger", "lastRun": {"table": "projections.orgs1", "resource": "organization", "parent_type": "organization", "parent_id_column": "id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.003518	1
	system	SYSTEM	system.migration.started	104	1	2025-09-17 18:40:53.004791+00	{"name": "repeatable_organization_count_trigger"}	system	SYSTEM	1758134453.004791	1
	system	SYSTEM	system.migration.repeatable.done	105	1	2025-09-17 18:40:53.007017+00	{"name": "repeatable_organization_count_trigger", "lastRun": {"table": "projections.orgs1", "resource": "organization", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.007017	1
	system	SYSTEM	system.migration.started	106	1	2025-09-17 18:40:53.008427+00	{"name": "repeatable_project_count_trigger"}	system	SYSTEM	1758134453.008427	1
	system	SYSTEM	system.migration.repeatable.done	107	1	2025-09-17 18:40:53.010414+00	{"name": "repeatable_project_count_trigger", "lastRun": {"table": "projections.projects4", "resource": "project", "parent_type": "organization", "parent_id_column": "resource_owner", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.010414	1
	system	SYSTEM	system.migration.started	108	1	2025-09-17 18:40:53.01176+00	{"name": "repeatable_user_count_trigger"}	system	SYSTEM	1758134453.011760	1
	system	SYSTEM	system.migration.repeatable.done	109	1	2025-09-17 18:40:53.013827+00	{"name": "repeatable_user_count_trigger", "lastRun": {"table": "projections.users14", "resource": "user", "parent_type": "organization", "parent_id_column": "resource_owner", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.013827	1
	system	SYSTEM	system.migration.started	110	1	2025-09-17 18:40:53.01518+00	{"name": "repeatable_iam_admin_count_trigger"}	system	SYSTEM	1758134453.015180	1
	system	SYSTEM	system.migration.repeatable.done	111	1	2025-09-17 18:40:53.017203+00	{"name": "repeatable_iam_admin_count_trigger", "lastRun": {"table": "projections.instance_members4", "resource": "iam_admin", "parent_type": "instance", "parent_id_column": "resource_owner", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.017203	1
	system	SYSTEM	system.migration.started	112	1	2025-09-17 18:40:53.018669+00	{"name": "repeatable_identity_provider_count_trigger"}	system	SYSTEM	1758134453.018669	1
	system	SYSTEM	system.migration.repeatable.done	113	1	2025-09-17 18:40:53.020448+00	{"name": "repeatable_identity_provider_count_trigger", "lastRun": {"table": "projections.idps3", "resource": "identity_provider", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.020448	1
	system	SYSTEM	system.migration.started	114	1	2025-09-17 18:40:53.021784+00	{"name": "repeatable_identity_provider_ldap_count_trigger"}	system	SYSTEM	1758134453.021784	1
	system	SYSTEM	system.migration.repeatable.done	115	1	2025-09-17 18:40:53.023557+00	{"name": "repeatable_identity_provider_ldap_count_trigger", "lastRun": {"table": "projections.idp_templates6_ldap2", "resource": "identity_provider_ldap", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.023557	1
	system	SYSTEM	system.migration.started	116	1	2025-09-17 18:40:53.024878+00	{"name": "repeatable_action_v1_count_trigger"}	system	SYSTEM	1758134453.024878	1
	system	SYSTEM	system.migration.repeatable.done	117	1	2025-09-17 18:40:53.02696+00	{"name": "repeatable_action_v1_count_trigger", "lastRun": {"table": "projections.actions3", "resource": "action_v1", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.026960	1
	system	SYSTEM	system.migration.started	118	1	2025-09-17 18:40:53.028393+00	{"name": "repeatable_execution_count_trigger"}	system	SYSTEM	1758134453.028393	1
	system	SYSTEM	system.migration.repeatable.done	119	1	2025-09-17 18:40:53.030264+00	{"name": "repeatable_execution_count_trigger", "lastRun": {"table": "projections.executions1", "resource": "execution", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.030264	1
	system	SYSTEM	system.migration.started	120	1	2025-09-17 18:40:53.031734+00	{"name": "repeatable_execution_target_count_trigger"}	system	SYSTEM	1758134453.031734	1
	system	SYSTEM	system.migration.repeatable.done	121	1	2025-09-17 18:40:53.033527+00	{"name": "repeatable_execution_target_count_trigger", "lastRun": {"table": "projections.executions1_targets", "resource": "execution_target", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.033527	1
	system	SYSTEM	system.migration.started	122	1	2025-09-17 18:40:53.03502+00	{"name": "repeatable_login_policy_count_trigger"}	system	SYSTEM	1758134453.035020	1
	system	SYSTEM	system.migration.repeatable.done	123	1	2025-09-17 18:40:53.036956+00	{"name": "repeatable_login_policy_count_trigger", "lastRun": {"table": "projections.login_policies5", "resource": "login_policy", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.036956	1
	system	SYSTEM	system.migration.started	124	1	2025-09-17 18:40:53.038606+00	{"name": "repeatable_password_complexity_policy_count_trigger"}	system	SYSTEM	1758134453.038606	1
	system	SYSTEM	system.migration.repeatable.done	125	1	2025-09-17 18:40:53.041405+00	{"name": "repeatable_password_complexity_policy_count_trigger", "lastRun": {"table": "projections.password_complexity_policies2", "resource": "password_complexity_policy", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.041405	1
	system	SYSTEM	system.migration.started	126	1	2025-09-17 18:40:53.043404+00	{"name": "repeatable_password_expiry_policy_count_trigger"}	system	SYSTEM	1758134453.043404	1
	system	SYSTEM	system.migration.repeatable.done	127	1	2025-09-17 18:40:53.046165+00	{"name": "repeatable_password_expiry_policy_count_trigger", "lastRun": {"table": "projections.password_age_policies2", "resource": "password_expiry_policy", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.046165	1
	system	SYSTEM	system.migration.started	128	1	2025-09-17 18:40:53.047908+00	{"name": "repeatable_lockout_policy_count_trigger"}	system	SYSTEM	1758134453.047908	1
	system	SYSTEM	system.migration.done	175	1	2025-09-17 18:40:53.156087+00	{"name": "projections.project_grants4"}	system	SYSTEM	1758134453.156087	1
	system	SYSTEM	system.migration.repeatable.done	129	1	2025-09-17 18:40:53.05019+00	{"name": "repeatable_lockout_policy_count_trigger", "lastRun": {"table": "projections.lockout_policies3", "resource": "lockout_policy", "parent_type": "instance", "parent_id_column": "instance_id", "instance_id_column": "instance_id"}}	system	SYSTEM	1758134453.050190	1
	system	SYSTEM	system.migration.started	130	1	2025-09-17 18:40:53.052172+00	{"name": "18_add_lower_fields_to_login_names"}	system	SYSTEM	1758134453.052172	1
	system	SYSTEM	system.migration.done	131	1	2025-09-17 18:40:53.059069+00	{"name": "18_add_lower_fields_to_login_names"}	system	SYSTEM	1758134453.059069	1
	system	SYSTEM	system.migration.started	132	1	2025-09-17 18:40:53.060592+00	{"name": "21_add_block_field_to_limits"}	system	SYSTEM	1758134453.060592	1
	system	SYSTEM	system.migration.done	133	1	2025-09-17 18:40:53.062059+00	{"name": "21_add_block_field_to_limits"}	system	SYSTEM	1758134453.062059	1
	system	SYSTEM	system.migration.started	134	1	2025-09-17 18:40:53.063558+00	{"name": "25_user14_add_lower_fields_to_verified_email"}	system	SYSTEM	1758134453.063558	1
	system	SYSTEM	system.migration.done	135	1	2025-09-17 18:40:53.067442+00	{"name": "25_user14_add_lower_fields_to_verified_email"}	system	SYSTEM	1758134453.067442	1
	system	SYSTEM	system.migration.started	136	1	2025-09-17 18:40:53.068813+00	{"name": "27_idp_templates6_add_saml_name_id_format"}	system	SYSTEM	1758134453.068813	1
	system	SYSTEM	system.migration.done	137	1	2025-09-17 18:40:53.070368+00	{"name": "27_idp_templates6_add_saml_name_id_format"}	system	SYSTEM	1758134453.070368	1
	system	SYSTEM	system.migration.started	138	1	2025-09-17 18:40:53.071809+00	{"name": "32_add_auth_sessionID"}	system	SYSTEM	1758134453.071809	1
	system	SYSTEM	system.migration.done	139	1	2025-09-17 18:40:53.073645+00	{"name": "32_add_auth_sessionID"}	system	SYSTEM	1758134453.073645	1
	system	SYSTEM	system.migration.started	140	1	2025-09-17 18:40:53.074949+00	{"name": "33_sms_configs3_twilio_add_verification_sid"}	system	SYSTEM	1758134453.074949	1
	system	SYSTEM	system.migration.done	141	1	2025-09-17 18:40:53.076387+00	{"name": "33_sms_configs3_twilio_add_verification_sid"}	system	SYSTEM	1758134453.076387	1
	system	SYSTEM	system.migration.started	142	1	2025-09-17 18:40:53.077781+00	{"name": "37_apps7_oidc_configs_add_back_channel_logout_uri"}	system	SYSTEM	1758134453.077781	1
	system	SYSTEM	system.migration.done	143	1	2025-09-17 18:40:53.079155+00	{"name": "37_apps7_oidc_configs_add_back_channel_logout_uri"}	system	SYSTEM	1758134453.079155	1
	system	SYSTEM	system.migration.started	144	1	2025-09-17 18:40:53.081528+00	{"name": "40_apps7_oidc_configs_login_version"}	system	SYSTEM	1758134453.081528	1
	system	SYSTEM	system.migration.done	145	1	2025-09-17 18:40:53.083128+00	{"name": "40_apps7_oidc_configs_login_version"}	system	SYSTEM	1758134453.083128	1
	system	SYSTEM	system.migration.started	146	1	2025-09-17 18:40:53.084988+00	{"name": "43_create_fields_domain_index"}	system	SYSTEM	1758134453.084988	1
	system	SYSTEM	system.migration.done	147	1	2025-09-17 18:40:53.08852+00	{"name": "43_create_fields_domain_index"}	system	SYSTEM	1758134453.088520	1
	system	SYSTEM	system.migration.started	148	1	2025-09-17 18:40:53.090239+00	{"name": "48_apps7_saml_configs_login_version"}	system	SYSTEM	1758134453.090239	1
	system	SYSTEM	system.migration.done	149	1	2025-09-17 18:40:53.091915+00	{"name": "48_apps7_saml_configs_login_version"}	system	SYSTEM	1758134453.091915	1
	system	SYSTEM	system.migration.started	150	1	2025-09-17 18:40:53.093777+00	{"name": "59_setup_webkeys"}	system	SYSTEM	1758134453.093777	1
	system	SYSTEM	system.migration.done	151	1	2025-09-17 18:40:53.095557+00	{"name": "59_setup_webkeys"}	system	SYSTEM	1758134453.095557	1
	system	SYSTEM	system.migration.started	152	1	2025-09-17 18:40:53.096878+00	{"name": "projections.orgs1"}	system	SYSTEM	1758134453.096878	1
	system	SYSTEM	system.migration.done	153	1	2025-09-17 18:40:53.101791+00	{"name": "projections.orgs1"}	system	SYSTEM	1758134453.101791	1
	system	SYSTEM	system.migration.started	154	1	2025-09-17 18:40:53.1038+00	{"name": "projections.org_metadata2"}	system	SYSTEM	1758134453.103800	1
	system	SYSTEM	system.migration.done	155	1	2025-09-17 18:40:53.106528+00	{"name": "projections.org_metadata2"}	system	SYSTEM	1758134453.106528	1
	system	SYSTEM	system.migration.started	156	1	2025-09-17 18:40:53.108807+00	{"name": "projections.actions3"}	system	SYSTEM	1758134453.108807	1
	system	SYSTEM	system.migration.done	157	1	2025-09-17 18:40:53.111463+00	{"name": "projections.actions3"}	system	SYSTEM	1758134453.111463	1
	system	SYSTEM	system.migration.started	158	1	2025-09-17 18:40:53.11283+00	{"name": "projections.flow_triggers3"}	system	SYSTEM	1758134453.112830	1
	system	SYSTEM	system.migration.done	159	1	2025-09-17 18:40:53.115351+00	{"name": "projections.flow_triggers3"}	system	SYSTEM	1758134453.115351	1
	system	SYSTEM	system.migration.started	160	1	2025-09-17 18:40:53.116671+00	{"name": "projections.projects4"}	system	SYSTEM	1758134453.116671	1
	system	SYSTEM	system.migration.done	161	1	2025-09-17 18:40:53.119711+00	{"name": "projections.projects4"}	system	SYSTEM	1758134453.119711	1
	system	SYSTEM	system.migration.started	162	1	2025-09-17 18:40:53.121032+00	{"name": "projections.password_complexity_policies2"}	system	SYSTEM	1758134453.121032	1
	system	SYSTEM	system.migration.done	163	1	2025-09-17 18:40:53.123871+00	{"name": "projections.password_complexity_policies2"}	system	SYSTEM	1758134453.123871	1
	system	SYSTEM	system.migration.started	164	1	2025-09-17 18:40:53.125093+00	{"name": "projections.password_age_policies2"}	system	SYSTEM	1758134453.125093	1
	system	SYSTEM	system.migration.done	165	1	2025-09-17 18:40:53.128262+00	{"name": "projections.password_age_policies2"}	system	SYSTEM	1758134453.128262	1
	system	SYSTEM	system.migration.started	166	1	2025-09-17 18:40:53.129733+00	{"name": "projections.lockout_policies3"}	system	SYSTEM	1758134453.129733	1
	system	SYSTEM	system.migration.done	167	1	2025-09-17 18:40:53.132403+00	{"name": "projections.lockout_policies3"}	system	SYSTEM	1758134453.132403	1
	system	SYSTEM	system.migration.started	168	1	2025-09-17 18:40:53.133938+00	{"name": "projections.privacy_policies4"}	system	SYSTEM	1758134453.133938	1
	system	SYSTEM	system.migration.done	169	1	2025-09-17 18:40:53.137462+00	{"name": "projections.privacy_policies4"}	system	SYSTEM	1758134453.137462	1
	system	SYSTEM	system.migration.started	170	1	2025-09-17 18:40:53.139156+00	{"name": "projections.domain_policies2"}	system	SYSTEM	1758134453.139156	1
	system	SYSTEM	system.migration.done	171	1	2025-09-17 18:40:53.142458+00	{"name": "projections.domain_policies2"}	system	SYSTEM	1758134453.142458	1
	system	SYSTEM	system.migration.started	172	1	2025-09-17 18:40:53.14396+00	{"name": "projections.label_policies3"}	system	SYSTEM	1758134453.143960	1
	system	SYSTEM	system.migration.done	173	1	2025-09-17 18:40:53.14749+00	{"name": "projections.label_policies3"}	system	SYSTEM	1758134453.147490	1
	system	SYSTEM	system.migration.started	176	1	2025-09-17 18:40:53.157796+00	{"name": "projections.project_roles4"}	system	SYSTEM	1758134453.157796	1
	system	SYSTEM	system.migration.done	177	1	2025-09-17 18:40:53.159914+00	{"name": "projections.project_roles4"}	system	SYSTEM	1758134453.159914	1
	system	SYSTEM	system.migration.started	178	1	2025-09-17 18:40:53.161223+00	{"name": "projections.org_domains2"}	system	SYSTEM	1758134453.161223	1
	system	SYSTEM	system.migration.done	179	1	2025-09-17 18:40:53.164307+00	{"name": "projections.org_domains2"}	system	SYSTEM	1758134453.164307	1
	system	SYSTEM	system.migration.started	180	1	2025-09-17 18:40:53.165756+00	{"name": "projections.login_policies5"}	system	SYSTEM	1758134453.165756	1
	system	SYSTEM	system.migration.done	181	1	2025-09-17 18:40:53.169166+00	{"name": "projections.login_policies5"}	system	SYSTEM	1758134453.169166	1
	system	SYSTEM	system.migration.started	182	1	2025-09-17 18:40:53.170605+00	{"name": "projections.idps3"}	system	SYSTEM	1758134453.170605	1
	system	SYSTEM	system.migration.done	183	1	2025-09-17 18:40:53.173237+00	{"name": "projections.idps3"}	system	SYSTEM	1758134453.173237	1
	system	SYSTEM	system.migration.started	184	1	2025-09-17 18:40:53.174763+00	{"name": "projections.idp_templates6"}	system	SYSTEM	1758134453.174763	1
	system	SYSTEM	system.migration.done	185	1	2025-09-17 18:40:53.177192+00	{"name": "projections.idp_templates6"}	system	SYSTEM	1758134453.177192	1
	system	SYSTEM	system.migration.started	186	1	2025-09-17 18:40:53.178727+00	{"name": "projections.apps7"}	system	SYSTEM	1758134453.178727	1
	system	SYSTEM	system.migration.done	187	1	2025-09-17 18:40:53.184049+00	{"name": "projections.apps7"}	system	SYSTEM	1758134453.184049	1
	system	SYSTEM	system.migration.started	188	1	2025-09-17 18:40:53.185917+00	{"name": "projections.idp_user_links3"}	system	SYSTEM	1758134453.185917	1
	system	SYSTEM	system.migration.done	189	1	2025-09-17 18:40:53.188348+00	{"name": "projections.idp_user_links3"}	system	SYSTEM	1758134453.188348	1
	system	SYSTEM	system.migration.started	190	1	2025-09-17 18:40:53.189904+00	{"name": "projections.idp_login_policy_links5"}	system	SYSTEM	1758134453.189904	1
	system	SYSTEM	system.migration.done	191	1	2025-09-17 18:40:53.192037+00	{"name": "projections.idp_login_policy_links5"}	system	SYSTEM	1758134453.192037	1
	system	SYSTEM	system.migration.started	192	1	2025-09-17 18:40:53.193481+00	{"name": "projections.mail_templates2"}	system	SYSTEM	1758134453.193481	1
	system	SYSTEM	system.migration.done	193	1	2025-09-17 18:40:53.196853+00	{"name": "projections.mail_templates2"}	system	SYSTEM	1758134453.196853	1
	system	SYSTEM	system.migration.started	194	1	2025-09-17 18:40:53.198317+00	{"name": "projections.message_texts2"}	system	SYSTEM	1758134453.198317	1
	system	SYSTEM	system.migration.done	195	1	2025-09-17 18:40:53.206992+00	{"name": "projections.message_texts2"}	system	SYSTEM	1758134453.206992	1
	system	SYSTEM	system.migration.started	196	1	2025-09-17 18:40:53.208545+00	{"name": "projections.custom_texts2"}	system	SYSTEM	1758134453.208545	1
	system	SYSTEM	system.migration.done	197	1	2025-09-17 18:40:53.217026+00	{"name": "projections.custom_texts2"}	system	SYSTEM	1758134453.217026	1
	system	SYSTEM	system.migration.started	198	1	2025-09-17 18:40:53.218541+00	{"name": "projections.users14"}	system	SYSTEM	1758134453.218541	1
	system	SYSTEM	system.migration.done	199	1	2025-09-17 18:40:53.223321+00	{"name": "projections.users14"}	system	SYSTEM	1758134453.223321	1
	system	SYSTEM	system.migration.started	200	1	2025-09-17 18:40:53.224814+00	{"name": "projections.login_names3"}	system	SYSTEM	1758134453.224814	1
	system	SYSTEM	system.migration.done	201	1	2025-09-17 18:40:53.228964+00	{"name": "projections.login_names3"}	system	SYSTEM	1758134453.228964	1
	system	SYSTEM	system.migration.started	202	1	2025-09-17 18:40:53.230497+00	{"name": "projections.org_members4"}	system	SYSTEM	1758134453.230497	1
	system	SYSTEM	system.migration.done	203	1	2025-09-17 18:40:53.239764+00	{"name": "projections.org_members4"}	system	SYSTEM	1758134453.239764	1
	system	SYSTEM	system.migration.started	204	1	2025-09-17 18:40:53.241335+00	{"name": "projections.instance_domains"}	system	SYSTEM	1758134453.241335	1
	system	SYSTEM	system.migration.done	205	1	2025-09-17 18:40:53.245637+00	{"name": "projections.instance_domains"}	system	SYSTEM	1758134453.245637	1
	system	SYSTEM	system.migration.started	206	1	2025-09-17 18:40:53.247428+00	{"name": "projections.instance_trusted_domains"}	system	SYSTEM	1758134453.247428	1
	system	SYSTEM	system.migration.done	207	1	2025-09-17 18:40:53.250229+00	{"name": "projections.instance_trusted_domains"}	system	SYSTEM	1758134453.250229	1
	system	SYSTEM	system.migration.started	208	1	2025-09-17 18:40:53.25219+00	{"name": "projections.instance_members4"}	system	SYSTEM	1758134453.252190	1
	system	SYSTEM	system.migration.done	209	1	2025-09-17 18:40:53.256626+00	{"name": "projections.instance_members4"}	system	SYSTEM	1758134453.256626	1
	system	SYSTEM	system.migration.started	210	1	2025-09-17 18:40:53.258711+00	{"name": "projections.project_members4"}	system	SYSTEM	1758134453.258711	1
	system	SYSTEM	system.migration.done	211	1	2025-09-17 18:40:53.261533+00	{"name": "projections.project_members4"}	system	SYSTEM	1758134453.261533	1
	system	SYSTEM	system.migration.started	212	1	2025-09-17 18:40:53.263373+00	{"name": "projections.project_grant_members4"}	system	SYSTEM	1758134453.263373	1
	system	SYSTEM	system.migration.done	213	1	2025-09-17 18:40:53.265929+00	{"name": "projections.project_grant_members4"}	system	SYSTEM	1758134453.265929	1
	system	SYSTEM	system.migration.started	214	1	2025-09-17 18:40:53.267781+00	{"name": "projections.authn_keys2"}	system	SYSTEM	1758134453.267781	1
	system	SYSTEM	system.migration.done	215	1	2025-09-17 18:40:53.270554+00	{"name": "projections.authn_keys2"}	system	SYSTEM	1758134453.270554	1
	system	SYSTEM	system.migration.started	216	1	2025-09-17 18:40:53.272477+00	{"name": "projections.personal_access_tokens3"}	system	SYSTEM	1758134453.272477	1
	system	SYSTEM	system.migration.done	217	1	2025-09-17 18:40:53.276028+00	{"name": "projections.personal_access_tokens3"}	system	SYSTEM	1758134453.276028	1
	system	SYSTEM	system.migration.started	218	1	2025-09-17 18:40:53.277521+00	{"name": "projections.user_grants5"}	system	SYSTEM	1758134453.277521	1
	system	SYSTEM	system.migration.done	219	1	2025-09-17 18:40:53.27951+00	{"name": "projections.user_grants5"}	system	SYSTEM	1758134453.279510	1
	system	SYSTEM	system.migration.started	220	1	2025-09-17 18:40:53.281039+00	{"name": "projections.user_metadata5"}	system	SYSTEM	1758134453.281039	1
	system	SYSTEM	system.migration.done	221	1	2025-09-17 18:40:53.283231+00	{"name": "projections.user_metadata5"}	system	SYSTEM	1758134453.283231	1
	system	SYSTEM	system.migration.started	222	1	2025-09-17 18:40:53.284725+00	{"name": "projections.user_auth_methods5"}	system	SYSTEM	1758134453.284725	1
	system	SYSTEM	system.migration.done	223	1	2025-09-17 18:40:53.28683+00	{"name": "projections.user_auth_methods5"}	system	SYSTEM	1758134453.286830	1
	system	SYSTEM	system.migration.started	224	1	2025-09-17 18:40:53.288492+00	{"name": "projections.instances"}	system	SYSTEM	1758134453.288492	1
	system	SYSTEM	system.migration.done	225	1	2025-09-17 18:40:53.292572+00	{"name": "projections.instances"}	system	SYSTEM	1758134453.292572	1
	system	SYSTEM	system.migration.started	226	1	2025-09-17 18:40:53.295247+00	{"name": "projections.secret_generators2"}	system	SYSTEM	1758134453.295247	1
	system	SYSTEM	system.migration.done	227	1	2025-09-17 18:40:53.298915+00	{"name": "projections.secret_generators2"}	system	SYSTEM	1758134453.298915	1
	system	SYSTEM	system.migration.started	228	1	2025-09-17 18:40:53.300516+00	{"name": "projections.smtp_configs5"}	system	SYSTEM	1758134453.300516	1
	system	SYSTEM	system.migration.done	229	1	2025-09-17 18:40:53.302634+00	{"name": "projections.smtp_configs5"}	system	SYSTEM	1758134453.302634	1
	system	SYSTEM	system.migration.started	230	1	2025-09-17 18:40:53.304094+00	{"name": "projections.sms_configs3"}	system	SYSTEM	1758134453.304094	1
	system	SYSTEM	system.migration.done	231	1	2025-09-17 18:40:53.306196+00	{"name": "projections.sms_configs3"}	system	SYSTEM	1758134453.306196	1
	system	SYSTEM	system.migration.started	232	1	2025-09-17 18:40:53.307813+00	{"name": "projections.oidc_settings2"}	system	SYSTEM	1758134453.307813	1
	system	SYSTEM	system.migration.done	233	1	2025-09-17 18:40:53.310353+00	{"name": "projections.oidc_settings2"}	system	SYSTEM	1758134453.310353	1
	system	SYSTEM	system.migration.started	234	1	2025-09-17 18:40:53.311819+00	{"name": "projections.notification_providers"}	system	SYSTEM	1758134453.311819	1
	system	SYSTEM	system.migration.done	235	1	2025-09-17 18:40:53.313844+00	{"name": "projections.notification_providers"}	system	SYSTEM	1758134453.313844	1
	system	SYSTEM	system.migration.started	236	1	2025-09-17 18:40:53.315357+00	{"name": "projections.keys4"}	system	SYSTEM	1758134453.315357	1
	system	SYSTEM	system.migration.done	237	1	2025-09-17 18:40:53.317452+00	{"name": "projections.keys4"}	system	SYSTEM	1758134453.317452	1
	system	SYSTEM	system.migration.started	238	1	2025-09-17 18:40:53.318907+00	{"name": "projections.security_policies2"}	system	SYSTEM	1758134453.318907	1
	system	SYSTEM	system.migration.done	239	1	2025-09-17 18:40:53.321038+00	{"name": "projections.security_policies2"}	system	SYSTEM	1758134453.321038	1
	system	SYSTEM	system.migration.started	240	1	2025-09-17 18:40:53.322684+00	{"name": "projections.notification_policies"}	system	SYSTEM	1758134453.322684	1
	system	SYSTEM	system.migration.done	241	1	2025-09-17 18:40:53.325516+00	{"name": "projections.notification_policies"}	system	SYSTEM	1758134453.325516	1
	system	SYSTEM	system.migration.started	242	1	2025-09-17 18:40:53.327088+00	{"name": "projections.device_auth_requests2"}	system	SYSTEM	1758134453.327088	1
	system	SYSTEM	system.migration.done	243	1	2025-09-17 18:40:53.329454+00	{"name": "projections.device_auth_requests2"}	system	SYSTEM	1758134453.329454	1
	system	SYSTEM	system.migration.started	244	1	2025-09-17 18:40:53.331042+00	{"name": "projections.sessions8"}	system	SYSTEM	1758134453.331042	1
	system	SYSTEM	system.migration.done	245	1	2025-09-17 18:40:53.333223+00	{"name": "projections.sessions8"}	system	SYSTEM	1758134453.333223	1
	system	SYSTEM	system.migration.started	246	1	2025-09-17 18:40:53.334754+00	{"name": "projections.auth_requests"}	system	SYSTEM	1758134453.334754	1
	system	SYSTEM	system.migration.done	247	1	2025-09-17 18:40:53.336979+00	{"name": "projections.auth_requests"}	system	SYSTEM	1758134453.336979	1
	system	SYSTEM	system.migration.started	248	1	2025-09-17 18:40:53.339179+00	{"name": "projections.saml_requests"}	system	SYSTEM	1758134453.339179	1
	system	SYSTEM	system.migration.done	249	1	2025-09-17 18:40:53.341389+00	{"name": "projections.saml_requests"}	system	SYSTEM	1758134453.341389	1
	system	SYSTEM	system.migration.started	250	1	2025-09-17 18:40:53.343039+00	{"name": "projections.milestones3"}	system	SYSTEM	1758134453.343039	1
	system	SYSTEM	system.migration.done	251	1	2025-09-17 18:40:53.3455+00	{"name": "projections.milestones3"}	system	SYSTEM	1758134453.345500	1
	system	SYSTEM	system.migration.started	252	1	2025-09-17 18:40:53.347144+00	{"name": "projections.quotas"}	system	SYSTEM	1758134453.347144	1
	system	SYSTEM	system.migration.done	253	1	2025-09-17 18:40:53.349492+00	{"name": "projections.quotas"}	system	SYSTEM	1758134453.349492	1
	system	SYSTEM	system.migration.started	254	1	2025-09-17 18:40:53.351107+00	{"name": "projections.limits"}	system	SYSTEM	1758134453.351107	1
	system	SYSTEM	system.migration.done	255	1	2025-09-17 18:40:53.353409+00	{"name": "projections.limits"}	system	SYSTEM	1758134453.353409	1
	system	SYSTEM	system.migration.started	256	1	2025-09-17 18:40:53.354987+00	{"name": "projections.restrictions2"}	system	SYSTEM	1758134453.354987	1
	system	SYSTEM	system.migration.done	257	1	2025-09-17 18:40:53.357141+00	{"name": "projections.restrictions2"}	system	SYSTEM	1758134453.357141	1
	system	SYSTEM	system.migration.started	258	1	2025-09-17 18:40:53.358688+00	{"name": "projections.system_features"}	system	SYSTEM	1758134453.358688	1
	system	SYSTEM	system.migration.done	259	1	2025-09-17 18:40:53.360572+00	{"name": "projections.system_features"}	system	SYSTEM	1758134453.360572	1
	system	SYSTEM	system.migration.started	260	1	2025-09-17 18:40:53.362047+00	{"name": "projections.instance_features2"}	system	SYSTEM	1758134453.362047	1
	system	SYSTEM	system.migration.done	261	1	2025-09-17 18:40:53.364765+00	{"name": "projections.instance_features2"}	system	SYSTEM	1758134453.364765	1
	system	SYSTEM	system.migration.started	262	1	2025-09-17 18:40:53.36654+00	{"name": "projections.targets2"}	system	SYSTEM	1758134453.366540	1
	system	SYSTEM	system.migration.done	263	1	2025-09-17 18:40:53.368522+00	{"name": "projections.targets2"}	system	SYSTEM	1758134453.368522	1
	system	SYSTEM	system.migration.started	264	1	2025-09-17 18:40:53.370098+00	{"name": "projections.executions1"}	system	SYSTEM	1758134453.370098	1
	system	SYSTEM	system.migration.done	265	1	2025-09-17 18:40:53.372282+00	{"name": "projections.executions1"}	system	SYSTEM	1758134453.372282	1
	system	SYSTEM	system.migration.started	266	1	2025-09-17 18:40:53.373803+00	{"name": "projections.user_schemas1"}	system	SYSTEM	1758134453.373803	1
	system	SYSTEM	system.migration.done	267	1	2025-09-17 18:40:53.375882+00	{"name": "projections.user_schemas1"}	system	SYSTEM	1758134453.375882	1
	system	SYSTEM	system.migration.started	268	1	2025-09-17 18:40:53.37753+00	{"name": "projections.web_keys1"}	system	SYSTEM	1758134453.377530	1
	system	SYSTEM	system.migration.done	269	1	2025-09-17 18:40:53.380684+00	{"name": "projections.web_keys1"}	system	SYSTEM	1758134453.380684	1
	system	SYSTEM	system.migration.started	270	1	2025-09-17 18:40:53.382234+00	{"name": "projections.debug_events"}	system	SYSTEM	1758134453.382234	1
	system	SYSTEM	system.migration.started	272	1	2025-09-17 18:40:53.386731+00	{"name": "projections.hosted_login_translations"}	system	SYSTEM	1758134453.386731	1
	system	SYSTEM	system.migration.done	273	1	2025-09-17 18:40:53.38905+00	{"name": "projections.hosted_login_translations"}	system	SYSTEM	1758134453.389050	1
	system	SYSTEM	system.migration.started	274	1	2025-09-17 18:40:53.390628+00	{"name": "adminapi.styling2"}	system	SYSTEM	1758134453.390628	1
	system	SYSTEM	system.migration.done	275	1	2025-09-17 18:40:53.397318+00	{"name": "adminapi.styling2"}	system	SYSTEM	1758134453.397318	1
	system	SYSTEM	system.migration.started	276	1	2025-09-17 18:40:53.399027+00	{"name": "auth.users3"}	system	SYSTEM	1758134453.399027	1
	system	SYSTEM	system.migration.done	277	1	2025-09-17 18:40:53.401713+00	{"name": "auth.users3"}	system	SYSTEM	1758134453.401713	1
	system	SYSTEM	system.migration.started	278	1	2025-09-17 18:40:53.403284+00	{"name": "auth.user_sessions"}	system	SYSTEM	1758134453.403284	1
	system	SYSTEM	system.migration.done	279	1	2025-09-17 18:40:53.405731+00	{"name": "auth.user_sessions"}	system	SYSTEM	1758134453.405731	1
	system	SYSTEM	system.migration.started	280	1	2025-09-17 18:40:53.408203+00	{"name": "auth.tokens"}	system	SYSTEM	1758134453.408203	1
	system	SYSTEM	system.migration.done	281	1	2025-09-17 18:40:53.412126+00	{"name": "auth.tokens"}	system	SYSTEM	1758134453.412126	1
	system	SYSTEM	system.migration.started	282	1	2025-09-17 18:40:53.413741+00	{"name": "auth.refresh_tokens"}	system	SYSTEM	1758134453.413741	1
	system	SYSTEM	system.migration.done	283	1	2025-09-17 18:40:53.415909+00	{"name": "auth.refresh_tokens"}	system	SYSTEM	1758134453.415909	1
	system	SYSTEM	system.migration.started	284	1	2025-09-17 18:40:53.417585+00	{"name": "projections.notifications"}	system	SYSTEM	1758134453.417585	1
	system	SYSTEM	system.migration.done	285	1	2025-09-17 18:40:53.419757+00	{"name": "projections.notifications"}	system	SYSTEM	1758134453.419757	1
	system	SYSTEM	system.migration.started	286	1	2025-09-17 18:40:53.421408+00	{"name": "projections.notifications_quota"}	system	SYSTEM	1758134453.421408	1
	system	SYSTEM	system.migration.done	287	1	2025-09-17 18:40:53.424629+00	{"name": "projections.notifications_quota"}	system	SYSTEM	1758134453.424629	1
	system	SYSTEM	system.migration.started	288	1	2025-09-17 18:40:53.426168+00	{"name": "projections.notifications_back_channel_logout"}	system	SYSTEM	1758134453.426168	1
	system	SYSTEM	system.migration.done	289	1	2025-09-17 18:40:53.428991+00	{"name": "projections.notifications_back_channel_logout"}	system	SYSTEM	1758134453.428991	1
338293185505656835	auth_request	V2_338293225653534723	auth_request.added	1	1	2025-09-17 18:41:15.455392+00	{"nonce": "ZERZcndMcU5pa0pWRDYzWXBqTlN-bTF1QjVvNjNmTHlsbkR2QTNyU3FRcFdy", "scope": ["openid", "profile", "email"], "state": "ZERZcndMcU5pa0pWRDYzWXBqTlN-bTF1QjVvNjNmTHlsbkR2QTNyU3FRcFdy;52210bfd-e261-4aa9-a02f-9172f59ef852", "issuer": "http://localhost:8080", "audience": ["338293186696839171", "338293186696904707", "338293186696970243", "338293186697035779", "338293185505787907"], "client_id": "338293186697035779", "login_hint": "zitadel-admin@zitadel.localhost", "login_client": "", "redirect_uri": "http://localhost:8080/ui/console/auth/callback", "code_challenge": {"Method": 1, "Challenge": "OQces_V4NBNVzvXEDYw-ay_WEfCmRzuvoK1LMjfTlok"}}		338293185505656835	1758134475.455392	1
338293185505656835	session	338293226257514499	session.added	1	1	2025-09-17 18:41:15.819256+00	{"user_agent": {"ip": "192.168.65.1", "header": {"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0"]}, "description": "Firefox, 142.0, ,    , Gecko, 142.0, , Linux, x86_64, ", "fingerprint_id": "5eeb504c-e0c9-461f-bcbb-8f7d307721e9"}}	338293185506312195	338293185505656835	1758134475.819256	1
338293185505656835	session	338293226257514499	session.user.checked	2	1	2025-09-17 18:41:15.819256+00	{"userID": "338293185506246659", "checkedAt": "2025-09-17T18:41:15.819191411Z", "preferredLanguage": "en", "userResourceOwner": "338293185505722371"}	338293185506312195	338293185505656835	1758134475.819256	2
338293185505656835	session	338293226257514499	session.lifetime.set	3	1	2025-09-17 18:41:15.819256+00	{"lifetime": 86400000000000}	338293185506312195	338293185505656835	1758134475.819256	3
338293185505656835	session	338293226257514499	session.token.set	4	1	2025-09-17 18:41:15.819256+00	{"tokenID": "338293226257580035"}	338293185506312195	338293185505656835	1758134475.819256	4
338293185505656835	user	338293185506246659	user.human.password.check.succeeded	3	2	2025-09-17 18:41:21.917903+00	{}	338293185506312195	338293185505722371	1758134481.917903	1
338293185505656835	session	338293226257514499	session.password.checked	5	1	2025-09-17 18:41:21.917903+00	{"checkedAt": "2025-09-17T18:41:21.917835314Z"}	338293185506312195	338293185505656835	1758134481.917903	2
338293185505656835	session	338293226257514499	session.lifetime.set	6	1	2025-09-17 18:41:21.917903+00	{"lifetime": 864000000000000}	338293185506312195	338293185505656835	1758134481.917903	3
338293185505656835	session	338293226257514499	session.token.set	7	1	2025-09-17 18:41:21.917903+00	{"tokenID": "338293236491616259"}	338293185506312195	338293185505656835	1758134481.917903	4
338293185505656835	user	338293185506246659	user.human.mfa.init.skipped	4	2	2025-09-17 18:41:24.208211+00	{}	338293185506312195	338293185505722371	1758134484.208211	1
338293185505656835	auth_request	V2_338293225653534723	auth_request.session.linked	2	1	2025-09-17 18:41:24.335006+00	{"user_id": "338293185506246659", "auth_time": "2025-09-17T18:41:21.917835314Z", "session_id": "338293226257514499", "auth_methods": [4]}	338293185506312195	338293185505656835	1758134484.335006	1
338293185505656835	auth_request	V2_338293225653534723	auth_request.code.added	3	1	2025-09-17 18:41:24.337228+00	{}	338293185506312195	338293185505656835	1758134484.337228	1
338293185505656835	auth_request	V2_338293225653534723	auth_request.code.exchanged	4	1	2025-09-17 18:41:24.761443+00	\N	SYSTEM	338293185505656835	1758134484.761443	1
338293185505656835	oidc_session	V2_338293241273122819	oidc_session.added	1	1	2025-09-17 18:41:24.761443+00	{"nonce": "ZERZcndMcU5pa0pWRDYzWXBqTlN-bTF1QjVvNjNmTHlsbkR2QTNyU3FRcFdy", "scope": ["openid", "profile", "email"], "userID": "338293185506246659", "audience": ["338293186696839171", "338293186696904707", "338293186696970243", "338293186697035779", "338293185505787907"], "authTime": "2025-09-17T18:41:21.917835314Z", "clientID": "338293186697035779", "sessionID": "338293226257514499", "userAgent": {"ip": "192.168.65.1", "header": {"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0"]}, "description": "Firefox, 142.0, ,    , Gecko, 142.0, , Linux, x86_64, ", "fingerprint_id": "5eeb504c-e0c9-461f-bcbb-8f7d307721e9"}, "authMethods": [4], "preferredLanguage": "en", "userResourceOwner": "338293185505722371"}	SYSTEM	338293185505722371	1758134484.761443	2
338293185505656835	user	338303017977643011	user.human.password.check.succeeded	3	2	2025-09-17 20:46:07.865056+00	{}	338293185506312195	338293185505722371	1758141967.865056	1
338293185505656835	oidc_session	V2_338293241273122819	oidc_session.access_token.added	2	1	2025-09-17 18:41:24.761443+00	{"id": "at_338293241273188355", "scope": ["openid", "profile", "email"], "reason": "auth_request", "lifetime": 43200000000000}	SYSTEM	338293185505722371	1758134484.761443	3
338293185505656835	auth_request	V2_338293225653534723	auth_request.succeeded	5	1	2025-09-17 18:41:24.761443+00	\N	SYSTEM	338293185505656835	1758134484.761443	4
338293185505656835	milestone	338293185505656835	milestone.v2.reached	2	2	2025-09-17 18:41:24.761443+00	{"type": "AuthenticationSucceededOnInstance"}	SYSTEM	338293185505656835	1758134484.761443	5
338293185505656835	project	338293275599306755	project.added	1	1	2025-09-17 18:41:45.226613+00	{"name": "modul_223"}	338293185506246659	338293185505722371	1758134505.226613	1
338293185505656835	milestone	338293185505656835	milestone.v2.reached	3	2	2025-09-17 18:41:45.226613+00	{"type": "ProjectCreated"}	338293185506246659	338293185505656835	1758134505.226613	2
338293185505656835	project	338293275599306755	project.application.added	2	1	2025-09-17 18:43:31.033346+00	{"name": "ruby-on-rails", "appId": "338293453102252035"}	338293185506246659	338293185505722371	1758134611.033346	1
338293185505656835	project	338293275599306755	project.application.config.oidc.added	3	1	2025-09-17 18:43:31.033346+00	{"appId": "338293453102252035", "clientId": "338293453119029251", "grantTypes": [0], "redirectUris": ["http://localhost:3000/auth/zitadel/callback"], "responseTypes": [0], "authMethodType": 2, "postLogoutRedirectUris": ["http://localhost:3000/"]}	338293185506246659	338293185505722371	1758134611.033346	2
338293185505656835	milestone	338293185505656835	milestone.v2.reached	4	2	2025-09-17 18:43:31.033346+00	{"type": "ApplicationCreated"}	338293185506246659	338293185505656835	1758134611.033346	3
338293185505656835	project	338293275599306755	project.application.config.oidc.changed	4	1	2025-09-17 20:08:07.556521+00	{"appId": "338293453102252035", "grantTypes": [0, 2], "loginVersion": 1}	338293185506246659	338293185505722371	1758139687.556521	1
338293185505656835	user	338303017977643011	user.human.added	1	2	2025-09-17 20:18:32.828518+00	{"email": "test@example.com", "gender": -1, "lastName": "family_name_test", "nickName": "tester", "userName": "Test", "firstName": "given_test_name", "displayName": "given_test_name family_name_test", "encodedHash": "$2a$14$2.MJ1An7z711AUAPMRz9PukNBt0REwDOT9whCk5pExpsFB8m.7po.", "changeRequired": true, "preferredLanguage": "und"}	338293185506246659	338293185505722371	1758140312.828518	1
338293185505656835	user	338303017977643011	user.human.email.verified	2	2	2025-09-17 20:18:32.828518+00	\N	338293185506246659	338293185505722371	1758140312.828518	2
338293185505656835	usergrant	338303078325288963	user.grant.added	1	1	2025-09-17 20:19:08.104219+00	{"userId": "338303017977643011", "projectId": "338293275599306755"}	338293185506246659	338293185505722371	1758140348.104219	1
338293185505656835	project	338293275599306755	project.application.config.oidc.changed	5	1	2025-09-17 20:25:24.982205+00	{"appId": "338293453102252035", "redirectUris": ["http://localhost:5000/auth/zitadel/callback"], "postLogoutRedirectUris": ["http://localhost:5000/"]}	338293185506246659	338293185505722371	1758140724.982205	1
338293185505656835	project	338293275599306755	project.application.config.oidc.changed	6	1	2025-09-17 20:25:58.686188+00	{"appId": "338293453102252035", "devMode": true}	338293185506246659	338293185505722371	1758140758.686188	1
338293185505656835	project	338293275599306755	project.application.config.oidc.changed	7	1	2025-09-17 20:33:31.766076+00	{"appId": "338293453102252035", "redirectUris": ["http://localhost:5000/auth/callback"]}	338293185506246659	338293185505722371	1758141211.766076	1
338293185505656835	project	338293275599306755	project.application.config.oidc.changed	8	1	2025-09-17 20:38:32.518665+00	{"appId": "338293453102252035", "redirectUris": ["http://127.0.0.1:5000/auth/callback"], "postLogoutRedirectUris": ["http://127.0.0.1:5000/"]}	338293185506246659	338293185505722371	1758141512.518665	1
338293185505656835	auth_request	V2_338305066140172291	auth_request.added	1	1	2025-09-17 20:38:52.933453+00	{"scope": ["openid", "profile", "email", "offline_access"], "issuer": "http://localhost:8080", "audience": ["338293453119029251", "338293275599306755"], "client_id": "338293453119029251", "login_client": "", "redirect_uri": "http://127.0.0.1:5000/auth/callback", "code_challenge": {"Method": 1, "Challenge": "zyjbFKF-toerp9vPBIosC9gvsqzR95yZk_CdeRaNQsg"}, "need_refresh_token": true}		338293185505656835	1758141532.933453	1
338293185505656835	auth_request	V2_338305066140172291	auth_request.session.linked	2	1	2025-09-17 20:38:52.995826+00	{"user_id": "338293185506246659", "auth_time": "2025-09-17T18:41:21.917835314Z", "session_id": "338293226257514499", "auth_methods": [4]}	338293185506312195	338293185505656835	1758141532.995826	1
338293185505656835	auth_request	V2_338305066140172291	auth_request.code.added	3	1	2025-09-17 20:38:52.997328+00	{}	338293185506312195	338293185505656835	1758141532.997328	1
338293185505656835	auth_request	V2_338305714629902339	auth_request.added	1	1	2025-09-17 20:45:19.465717+00	{"scope": ["openid", "profile", "email", "offline_access"], "issuer": "http://localhost:8080", "audience": ["338293453119029251", "338293275599306755"], "client_id": "338293453119029251", "login_client": "", "redirect_uri": "http://127.0.0.1:5000/auth/callback", "code_challenge": {"Method": 1, "Challenge": "YSZo8wcRDNH4dtBiV7jW2WAcCgJlh9dVWwCfoeJiqEk"}, "need_refresh_token": true}		338293185505656835	1758141919.465717	1
338293185505656835	auth_request	V2_338305714629902339	auth_request.session.linked	2	1	2025-09-17 20:45:19.516713+00	{"user_id": "338293185506246659", "auth_time": "2025-09-17T18:41:21.917835314Z", "session_id": "338293226257514499", "auth_methods": [4]}	338293185506312195	338293185505656835	1758141919.516713	1
338293185505656835	auth_request	V2_338305714629902339	auth_request.code.added	3	1	2025-09-17 20:45:19.518186+00	{}	338293185506312195	338293185505656835	1758141919.518186	1
338293185505656835	auth_request	V2_338305714629902339	auth_request.code.exchanged	4	1	2025-09-17 20:45:19.539767+00	\N	SYSTEM	338293185505656835	1758141919.539767	1
338293185505656835	oidc_session	V2_338305714747408387	oidc_session.added	1	1	2025-09-17 20:45:19.539767+00	{"scope": ["openid", "profile", "email", "offline_access"], "userID": "338293185506246659", "audience": ["338293453119029251", "338293275599306755"], "authTime": "2025-09-17T18:41:21.917835314Z", "clientID": "338293453119029251", "sessionID": "338293226257514499", "userAgent": {"ip": "192.168.65.1", "header": {"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0"]}, "description": "Firefox, 142.0, ,    , Gecko, 142.0, , Linux, x86_64, ", "fingerprint_id": "5eeb504c-e0c9-461f-bcbb-8f7d307721e9"}, "authMethods": [4], "preferredLanguage": "en", "userResourceOwner": "338293185505722371"}	SYSTEM	338293185505722371	1758141919.539767	2
338293185505656835	oidc_session	V2_338305714747408387	oidc_session.access_token.added	2	1	2025-09-17 20:45:19.539767+00	{"id": "at_338305714747473923", "scope": ["openid", "profile", "email", "offline_access"], "reason": "auth_request", "lifetime": 43200000000000}	SYSTEM	338293185505722371	1758141919.539767	3
338293185505656835	oidc_session	V2_338305714747408387	oidc_session.refresh_token.added	3	1	2025-09-17 20:45:19.539767+00	{"id": "rt_338305714747539459", "lifetime": 7776000000000000, "idleLifetime": 2592000000000000}	SYSTEM	338293185505722371	1758141919.539767	4
338293185505656835	auth_request	V2_338305714629902339	auth_request.succeeded	5	1	2025-09-17 20:45:19.539767+00	\N	SYSTEM	338293185505656835	1758141919.539767	5
338293185505656835	milestone	338293185505656835	milestone.v2.reached	5	2	2025-09-17 20:45:19.539767+00	{"type": "AuthenticationSucceededOnApplication"}	SYSTEM	338293185505656835	1758141919.539767	6
338293185505656835	auth_request	V2_338305771471175683	auth_request.session.linked	2	1	2025-09-17 20:46:27.777696+00	{"user_id": "338303017977643011", "auth_time": "2025-09-17T20:46:26.122473744Z", "session_id": "338305782527295491", "auth_methods": [4]}	338293185506312195	338293185505656835	1758141987.777696	1
338293185505656835	auth_request	V2_338305771471175683	auth_request.code.added	3	1	2025-09-17 20:46:27.779025+00	{}	338293185506312195	338293185505656835	1758141987.779025	1
338293185505656835	auth_request	V2_338305771471175683	auth_request.code.exchanged	4	1	2025-09-17 20:46:27.810431+00	\N	SYSTEM	338293185505656835	1758141987.810431	1
338293185505656835	oidc_session	V2_338305829302173699	oidc_session.added	1	1	2025-09-17 20:46:27.810431+00	{"scope": ["openid", "profile", "email", "offline_access"], "userID": "338303017977643011", "audience": ["338293453119029251", "338293275599306755"], "authTime": "2025-09-17T20:46:26.122473744Z", "clientID": "338293453119029251", "sessionID": "338305782527295491", "userAgent": {"ip": "192.168.65.1", "header": {"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:143.0) Gecko/20100101 Firefox/143.0"]}, "description": "Firefox, 143.0, ,    , Gecko, 143.0, , Linux, x86_64, ", "fingerprint_id": "583c0a22-5a2c-42a3-9968-393e3a841f55"}, "authMethods": [4], "userResourceOwner": "338293185505722371"}	SYSTEM	338293185505722371	1758141987.810431	2
338293185505656835	oidc_session	V2_338305829302173699	oidc_session.access_token.added	2	1	2025-09-17 20:46:27.810431+00	{"id": "at_338305829302239235", "scope": ["openid", "profile", "email", "offline_access"], "reason": "auth_request", "lifetime": 43200000000000}	SYSTEM	338293185505722371	1758141987.810431	3
338293185505656835	oidc_session	V2_338305829302173699	oidc_session.refresh_token.added	3	1	2025-09-17 20:46:27.810431+00	{"id": "rt_338305829302304771", "lifetime": 7776000000000000, "idleLifetime": 2592000000000000}	SYSTEM	338293185505722371	1758141987.810431	4
338293185505656835	auth_request	V2_338305771471175683	auth_request.succeeded	5	1	2025-09-17 20:46:27.810431+00	\N	SYSTEM	338293185505656835	1758141987.810431	5
338293185505656835	auth_request	V2_338305771471175683	auth_request.added	1	1	2025-09-17 20:45:53.346748+00	{"scope": ["openid", "profile", "email", "offline_access"], "issuer": "http://localhost:8080", "audience": ["338293453119029251", "338293275599306755"], "client_id": "338293453119029251", "login_client": "", "redirect_uri": "http://127.0.0.1:5000/auth/callback", "code_challenge": {"Method": 1, "Challenge": "hpiTapi7viFbkWgAXhdoiQejUmqSYV0mZu4xVdzwlz0"}, "need_refresh_token": true}		338293185505656835	1758141953.346748	1
338293185505656835	user	338303017977643011	user.human.password.changed	4	2	2025-09-17 20:46:25.16009+00	{"encodedHash": "$2a$14$9buvkb7Cqp2MDuOutMbRRu0WBzk3HpLfWGk8AjPhqS4toCKs1Dzhe", "triggerOrigin": "http://localhost:8080", "changeRequired": false}	338303017977643011	338293185505722371	1758141985.160090	1
338293185505656835	session	338305782527295491	session.added	1	1	2025-09-17 20:45:59.940174+00	{"user_agent": {"ip": "192.168.65.1", "header": {"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:143.0) Gecko/20100101 Firefox/143.0"]}, "description": "Firefox, 143.0, ,    , Gecko, 143.0, , Linux, x86_64, ", "fingerprint_id": "583c0a22-5a2c-42a3-9968-393e3a841f55"}}	338293185506312195	338293185505656835	1758141959.940174	1
338293185505656835	session	338305782527295491	session.user.checked	2	1	2025-09-17 20:45:59.940174+00	{"userID": "338303017977643011", "checkedAt": "2025-09-17T20:45:59.940076347Z", "userResourceOwner": "338293185505722371"}	338293185506312195	338293185505656835	1758141959.940174	2
338293185505656835	session	338305782527295491	session.lifetime.set	3	1	2025-09-17 20:45:59.940174+00	{"lifetime": 86400000000000}	338293185506312195	338293185505656835	1758141959.940174	3
338293185505656835	session	338305782527295491	session.token.set	4	1	2025-09-17 20:45:59.940174+00	{"tokenID": "338305782544072707"}	338293185506312195	338293185505656835	1758141959.940174	4
338293185505656835	session	338305782527295491	session.password.checked	5	1	2025-09-17 20:46:07.865056+00	{"checkedAt": "2025-09-17T20:46:07.864924344Z"}	338293185506312195	338293185505656835	1758141967.865056	2
338293185505656835	session	338305782527295491	session.lifetime.set	6	1	2025-09-17 20:46:07.865056+00	{"lifetime": 864000000000000}	338293185506312195	338293185505656835	1758141967.865056	3
338293185505656835	session	338305782527295491	session.token.set	7	1	2025-09-17 20:46:07.865056+00	{"tokenID": "338305795831627779"}	338293185506312195	338293185505656835	1758141967.865056	4
338293185505656835	user	338303017977643011	user.human.password.check.succeeded	5	2	2025-09-17 20:46:26.122538+00	{}	338293185506312195	338293185505722371	1758141986.122538	1
338293185505656835	session	338305782527295491	session.password.checked	8	1	2025-09-17 20:46:26.122538+00	{"checkedAt": "2025-09-17T20:46:26.122473744Z"}	338293185506312195	338293185505656835	1758141986.122538	2
338293185505656835	session	338305782527295491	session.lifetime.set	9	1	2025-09-17 20:46:26.122538+00	{"lifetime": 864000000000000}	338293185506312195	338293185505656835	1758141986.122538	3
338293185505656835	session	338305782527295491	session.token.set	10	1	2025-09-17 20:46:26.122538+00	{"tokenID": "338305826466824195"}	338293185506312195	338293185505656835	1758141986.122538	4
338293185505656835	user	338303017977643011	user.human.mfa.init.skipped	6	2	2025-09-17 20:46:27.721909+00	{}	338293185506312195	338293185505722371	1758141987.721909	1
	system	SYSTEM	system.migration.started	290	1	2025-09-17 21:20:22.708673+00	{"name": "repeatable_delete_stale_org_fields"}	system	SYSTEM	1758144022.708673	1
	system	SYSTEM	system.migration.repeatable.done	291	1	2025-09-17 21:20:22.720514+00	{"name": "repeatable_delete_stale_org_fields", "lastRun": {}}	system	SYSTEM	1758144022.720514	1
	system	SYSTEM	system.migration.started	292	1	2025-09-17 21:20:22.724567+00	{"name": "repeatable_fill_fields_for_instance_domains"}	system	SYSTEM	1758144022.724567	1
	system	SYSTEM	system.migration.repeatable.done	293	1	2025-09-17 21:20:22.732252+00	{"name": "repeatable_fill_fields_for_instance_domains", "lastRun": {}}	system	SYSTEM	1758144022.732252	1
	system	SYSTEM	system.migration.started	294	1	2025-09-17 21:20:22.735356+00	{"name": "repeatable_sync_role_permissions"}	system	SYSTEM	1758144022.735356	1
	system	SYSTEM	system.migration.repeatable.done	295	1	2025-09-17 21:20:22.743229+00	{"name": "repeatable_sync_role_permissions", "lastRun": {}}	system	SYSTEM	1758144022.743229	1
	system	SYSTEM	system.migration.started	296	1	2025-09-17 21:20:22.746725+00	{"name": "repeatable_migrate_river"}	system	SYSTEM	1758144022.746725	1
	system	SYSTEM	system.migration.repeatable.done	297	1	2025-09-17 21:20:22.759312+00	{"name": "repeatable_migrate_river", "lastRun": {}}	system	SYSTEM	1758144022.759312	1
338293185505656835	auth_request	V2_338309262256111619	auth_request.added	1	1	2025-09-17 21:20:34.01249+00	{"nonce": "RDNaSWlLdG1IMXh5ZVNEamRzODE1R2NhY1hiT1V1amt0cUNYLnQuUUFKRUFs", "scope": ["openid", "profile", "email"], "state": "RDNaSWlLdG1IMXh5ZVNEamRzODE1R2NhY1hiT1V1amt0cUNYLnQuUUFKRUFs;5975955c-6534-4759-ba31-63a53b156570", "issuer": "http://localhost:8080", "audience": ["338293186696839171", "338293186696904707", "338293186696970243", "338293186697035779", "338293185505787907"], "client_id": "338293186697035779", "login_hint": "zitadel-admin@zitadel.localhost", "login_client": "", "redirect_uri": "http://localhost:8080/ui/console/auth/callback", "code_challenge": {"Method": 1, "Challenge": "BLr6l_wyHvi2nkF7TzDrOP8DWuo2jxyPkAeX-pvRKVA"}}		338293185505656835	1758144034.012490	1
338293185505656835	auth_request	V2_338309262256111619	auth_request.session.linked	2	1	2025-09-17 21:20:34.119433+00	{"user_id": "338293185506246659", "auth_time": "2025-09-17T18:41:21.917835314Z", "session_id": "338293226257514499", "auth_methods": [4]}	338293185506312195	338293185505656835	1758144034.119433	1
338293185505656835	auth_request	V2_338309262256111619	auth_request.code.added	3	1	2025-09-17 21:20:34.121677+00	{}	338293185506312195	338293185505656835	1758144034.121677	1
338293185505656835	auth_request	V2_338309262256111619	auth_request.code.exchanged	4	1	2025-09-17 21:20:34.585778+00	\N	SYSTEM	338293185505656835	1758144034.585778	1
338293185505656835	oidc_session	V2_338309263212412931	oidc_session.added	1	1	2025-09-17 21:20:34.585778+00	{"nonce": "RDNaSWlLdG1IMXh5ZVNEamRzODE1R2NhY1hiT1V1amt0cUNYLnQuUUFKRUFs", "scope": ["openid", "profile", "email"], "userID": "338293185506246659", "audience": ["338293186696839171", "338293186696904707", "338293186696970243", "338293186697035779", "338293185505787907"], "authTime": "2025-09-17T18:41:21.917835314Z", "clientID": "338293186697035779", "sessionID": "338293226257514499", "userAgent": {"ip": "192.168.65.1", "header": {"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0"]}, "description": "Firefox, 142.0, ,    , Gecko, 142.0, , Linux, x86_64, ", "fingerprint_id": "5eeb504c-e0c9-461f-bcbb-8f7d307721e9"}, "authMethods": [4], "preferredLanguage": "en", "userResourceOwner": "338293185505722371"}	SYSTEM	338293185505722371	1758144034.585778	2
338293185505656835	oidc_session	V2_338309263212412931	oidc_session.access_token.added	2	1	2025-09-17 21:20:34.585778+00	{"id": "at_338309263212478467", "scope": ["openid", "profile", "email"], "reason": "auth_request", "lifetime": 43200000000000}	SYSTEM	338293185505722371	1758144034.585778	3
338293185505656835	auth_request	V2_338309262256111619	auth_request.succeeded	5	1	2025-09-17 21:20:34.585778+00	\N	SYSTEM	338293185505656835	1758144034.585778	4
\.


--
-- Data for Name: fields; Type: TABLE DATA; Schema: eventstore; Owner: -
--

COPY eventstore.fields (id, instance_id, resource_owner, aggregate_type, aggregate_id, object_type, object_id, object_revision, field_name, value, value_must_be_unique, should_index) FROM stdin;
32c64868-590b-4caa-b07b-759acf4537d3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.read"	f	t
5522efb2-cbcd-48a0-a731-b635448258b6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.write"	f	t
016493c0-82ab-46eb-8104-53b41b391f4a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.policy.read"	f	t
9616c339-5260-475f-99aa-063a0d777ea2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.policy.write"	f	t
8c4c045c-0f08-46e6-ac95-beb82b9960d5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.policy.delete"	f	t
4e6fc9f1-7a62-4445-9c0f-35e54f841a98	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.member.read"	f	t
11a1cfa1-a01a-42d0-9874-bdee974a986e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.member.write"	f	t
bb9006c4-5ac7-4387-8314-d2fb2812fae3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.member.delete"	f	t
bc2b05e9-04ba-4180-a39a-0d5246e8d277	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.idp.read"	f	t
3618a56a-1b51-4c84-8b6f-c29ab99a9afb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.idp.write"	f	t
557c751c-0507-479d-a7b2-bfd0f650f85d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.idp.delete"	f	t
eb3c3148-5245-4314-85c7-e238288582f8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.action.read"	f	t
9153180a-edeb-4843-bb47-83f489d879e6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.action.write"	f	t
19b4e8cc-8e13-4a62-8463-379602a7f42e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.action.delete"	f	t
63ec09a7-4311-4207-b045-7a0bb11b869d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.flow.read"	f	t
92de8867-c27e-4f1d-901d-6f3f32f34a53	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.flow.write"	f	t
f8bb6b21-cb81-4c73-bc0a-5a3b0e7daf8e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.flow.delete"	f	t
e8a9c826-e8a0-4257-bdc7-becc28195433	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.feature.read"	f	t
d9df7f63-6481-4c68-aa4a-554538569aa3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.feature.write"	f	t
4a12d24a-3eb8-4b1f-88b9-36af43492ceb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.feature.delete"	f	t
0506ef46-3557-429e-886f-c2d864434bf8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.restrictions.read"	f	t
7d7c4e6f-b69d-4358-ba24-dff963a83cf6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.restrictions.write"	f	t
12b1728d-2198-418c-ad45-31318b877238	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.web_key.write"	f	t
810b04ed-64dd-4a5f-a124-3d81777f3f5a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.web_key.delete"	f	t
62f69b44-6032-452f-9b09-a2aae7835186	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.web_key.read"	f	t
80272e30-ea77-4ef5-b86b-8bbfb76dc50b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.debug.write"	f	t
84391161-8310-4cbf-8a0d-4a6766bb2c84	338293185505656835	338293185505656835	instance	338293185505656835	instance_member_role	338293185506246659	1	instance_role	"IAM_OWNER"	f	t
92d6a62f-123a-4c7b-82d7-986babf4ef07	338293185505656835	338293185505656835	instance	338293185505656835	instance_member_role	338293185506312195	1	instance_role	"IAM_LOGIN_CLIENT"	f	t
486f8209-2c58-451b-8d78-75d5fbe4f542	338293185505656835	338293185505656835	instance	338293185505656835	instance_domain	zitadel-3ar3jm.localhost	1	domain	"zitadel-3ar3jm.localhost"	f	t
4a0d57d8-e49a-4642-83a1-ab8c1c036e93	338293185505656835	338293185505656835	instance	338293185505656835	instance_domain	localhost	1	domain	"localhost"	f	t
fabec812-7178-46be-9c8b-b1c2f93d119e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"iam.debug.read"	f	t
c20ed4ba-b0e5-4bd5-b8e2-740570043576	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.read"	f	t
9de26d6b-92a6-4593-a8ca-93d6c7025a43	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.global.read"	f	t
a864e363-ea40-4a50-a0a9-7a31019e5efa	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.create"	f	t
8eb88f88-c462-415f-9dc0-4c57d8d9484a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.write"	f	t
9f6716ff-a1cf-4aeb-a661-fa86398257ab	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.delete"	f	t
731ff6ef-58e0-470c-9e38-51ebf93da82b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.member.read"	f	t
d8820175-1cee-47f8-9207-51888a2033d2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.member.write"	f	t
9c86b2e1-8290-4f59-a1d9-6c3e09976a82	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.member.delete"	f	t
4ffcb342-6ee7-4460-bf6d-0645af57ebc9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.idp.read"	f	t
11747add-54cc-4ef6-b364-20ee65999c70	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.idp.write"	f	t
c72683fa-ffce-4679-86cc-f88ca231e46d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.idp.delete"	f	t
9938eebd-3fe6-40d7-b37b-af1bcc237851	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.action.read"	f	t
71d378e8-e5fc-4b26-9602-6d043a93380c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.action.write"	f	t
e06c523a-9bed-47ac-851c-dd876e643058	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.action.delete"	f	t
310a82b4-b52c-48bf-b375-f2dae9992b98	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.flow.read"	f	t
250d181c-6a0f-4ac9-87d8-df1cb78eef65	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.flow.write"	f	t
08972388-800f-4d92-936a-e10158530259	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.flow.delete"	f	t
8b872c1b-687e-497d-a8ea-0ead3f473655	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.feature.read"	f	t
d2a5e636-244b-4029-b9ca-5498ea0ee2d8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.feature.write"	f	t
aaaa6291-3e90-4a19-9f51-fef74eb8097f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"org.feature.delete"	f	t
b2f59169-33e5-4f9c-82ca-c4b7a4dc4faf	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.read"	f	t
8f832dbe-82dd-48aa-bd70-ad83f02c3124	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.global.read"	f	t
94433961-eca3-4712-b19f-f910f1909c0f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.write"	f	t
8211b2dd-28f3-41d7-b2f8-101149af4e53	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.delete"	f	t
7c4984ff-6980-484e-b415-1d996e41d6de	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.grant.read"	f	t
f08ce5ee-afd8-438d-98b0-4130f299ebe1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.grant.write"	f	t
f769a466-8df4-4148-af75-bf45eb43078b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.grant.delete"	f	t
57d8f9b3-41cf-42a6-8612-3434c6438120	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.membership.read"	f	t
e8b7dd97-d170-4e82-8fa5-a740789646a8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.credential.write"	f	t
036209a2-eb47-4ac2-a7cb-75853178a170	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.passkey.write"	f	t
f1a5bc12-cbab-4bca-8074-36f0f99bc3cc	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.feature.read"	f	t
53e8016d-d50c-46da-9841-6393073bc8a2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.feature.write"	f	t
12ec109c-12f7-4147-adf2-45110385de93	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"user.feature.delete"	f	t
309d057e-8327-4109-a815-110429023067	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"policy.read"	f	t
239cb024-379c-4544-b2bc-5221980d3406	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"policy.write"	f	t
2b3f6c52-0736-4cd8-b483-6414318bd681	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"policy.delete"	f	t
f2701d65-beb9-4c5f-be28-fb8624679aca	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.read"	f	t
e62f993b-e89e-4d6b-abdd-5ae34bfb90e0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.create"	f	t
d7757852-5cae-46d3-ac94-267bccdf6425	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.write"	f	t
beb4efe7-b0b4-40d6-88cd-ce7942a1b68b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.delete"	f	t
e05910bb-ebd2-4362-8170-293546e1a91a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.member.read"	f	t
78b43c30-3682-4ebd-ab2e-fecab512a776	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.member.write"	f	t
e7adc33b-b8d1-41ee-8735-d082ecd3ea0e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.member.delete"	f	t
487abc0f-8e5d-4c5e-a473-4da289937e36	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.role.read"	f	t
00a46e1b-54a5-415b-b220-dde62fd71859	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.role.write"	f	t
76dbffff-8622-43cb-a84f-1436ae5e49b1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.role.delete"	f	t
9da0870c-ccbd-4e32-9b55-252f028e4983	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.app.read"	f	t
03630671-f91a-441d-abab-cd11edce4894	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.app.write"	f	t
72edd315-bfc6-40cb-a761-3415d365845e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.app.delete"	f	t
55c7387c-f20d-4676-85d3-c97248833fee	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.grant.read"	f	t
3ec3c477-6496-4cb6-9c57-a2edbe443108	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.grant.write"	f	t
55f40614-7816-4a13-bbda-fc9dbf6653c8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.grant.delete"	f	t
152c2c21-3d52-4101-809a-5c808a81591f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.grant.member.read"	f	t
04002f94-72a7-43d3-8f35-850c460240fa	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.grant.member.write"	f	t
bd9256b9-5216-4c3d-998f-e6299d6ece29	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"project.grant.member.delete"	f	t
4e8dc672-445c-4b9f-acd6-caeb6e4a8591	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"events.read"	f	t
6df8a6c1-51a9-4f5b-b00d-8051416f94db	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"milestones.read"	f	t
d817a2eb-4427-4db2-a91f-0c2680d73b58	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"session.read"	f	t
477ba664-1044-4e04-bd58-da80a60d39e2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"session.write"	f	t
f03fe9f7-9d93-437d-977b-37088da50b45	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"session.delete"	f	t
ecf19842-27fc-4e6a-8d18-4b92cbb76ef6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"action.target.read"	f	t
c9329461-6231-4aaf-8ee2-fd0471289ff6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"action.target.write"	f	t
c812fff9-e338-4225-80b0-458c76fe45dc	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"action.target.delete"	f	t
233653a5-64e3-4846-b886-bc1f3407f102	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"action.execution.read"	f	t
e48df7dd-2d43-4de3-9e47-50a71519f2f7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"action.execution.write"	f	t
fda0b5de-dfa1-4d14-b2a2-95d550a69232	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"userschema.read"	f	t
d1d61a7f-0341-4491-a8fd-0955629f8c0f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"userschema.write"	f	t
44fd5bbb-b918-486c-9349-cc4d7eef3dbb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER	1	permission	"userschema.delete"	f	t
75cfe7ea-21b8-4041-8f77-e09f9c6fd3e5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.read"	f	t
92edbf8b-085f-4f15-bede-5c8ebc9f6934	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.global.read"	f	t
a0ef0398-0867-43f2-ba8e-f70d54a98080	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.write"	f	t
4bb0ce13-c2bd-4a54-a713-e48dd09cebf8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.delete"	f	t
0a34cf1d-04a3-4b7c-a0f2-62e1507c9a50	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.member.read"	f	t
1c3aa9e9-9427-46db-9540-c93e65af2ff8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.member.write"	f	t
602d5ab1-a761-4f0d-91c0-e90200e53cd9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.member.delete"	f	t
f59e0b29-77f2-4c8b-af90-cb54162ce9e3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.idp.read"	f	t
06776526-551b-4e85-b1e2-22c78933552b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.idp.write"	f	t
bbe7bb96-8214-4f38-ae48-575b84b207a0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.idp.delete"	f	t
9fc3a6e8-9997-4dfb-91c8-8ad70d837105	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.action.read"	f	t
02b7db08-3443-4e3b-8084-9098fa38313e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.action.write"	f	t
88779db8-75a3-4bb7-bf3a-91b336079bf2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.action.delete"	f	t
f43aa61e-8632-4570-a757-a526cd849853	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.flow.read"	f	t
e21cd084-b382-4d3a-b1ea-2b7eaa2fdd45	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.flow.write"	f	t
75e2d548-c150-4399-9250-dbac4fc433b7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.flow.delete"	f	t
978e7118-9eb5-41d3-9ffd-90f8fe28e4d9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.feature.read"	f	t
c9b775eb-cffe-4f47-8b16-da93a9077fd0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.feature.write"	f	t
7c520d8b-b1be-4cb9-913c-7e7a5cbfe7e0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"org.feature.delete"	f	t
10266875-31ab-4f18-859b-020488678422	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.read"	f	t
4820a364-e0aa-4da1-a27a-16a0139a1784	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.global.read"	f	t
66eb613d-a40f-4cb5-b948-70ca133cffb5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.write"	f	t
f4a783ae-433d-4f61-a156-22ba73625bd2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.delete"	f	t
c4a5e568-9057-43cf-853b-eaf81ec8a395	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.grant.read"	f	t
cf239f1d-d9e4-4665-9dce-baff3b895825	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.grant.write"	f	t
e945cd5c-119a-4d74-9e16-d3d485a9d1ad	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.grant.delete"	f	t
02241594-e2dd-422b-9782-91f5d348f095	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.membership.read"	f	t
e0b196df-71e1-4b5f-a1ba-6910b0d2eebb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.credential.write"	f	t
253e80de-0edf-41b2-844a-d802041e0747	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.passkey.write"	f	t
d9d98959-a580-4133-a911-0748d98ddc07	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.feature.read"	f	t
5fd84d71-d7e4-474b-958b-1cb70ca90ebb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.feature.write"	f	t
dc0e5443-1c07-4f84-8f63-24b088fdb7b3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"user.feature.delete"	f	t
128f0ff3-f3c9-413c-b5b2-99ecf07c6998	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"policy.read"	f	t
372ad1fc-78a3-4733-91d1-b22995ac77df	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"policy.write"	f	t
e9a79a0d-ab8c-410d-af29-559c47a3b70c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"policy.delete"	f	t
62b895cd-522a-41a6-a4d1-0730f96fb1c0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.read"	f	t
9ad6ffb2-5339-417f-ac63-41521f62751b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.create"	f	t
b9e2dc77-2d72-4013-ad4e-1aa5216793d7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.write"	f	t
e41e2398-4314-4f89-81df-faa85245adda	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.delete"	f	t
052a0ac0-bce6-460d-a2d9-723c124b06fd	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.member.read"	f	t
4f8597cd-e1b0-4520-9838-f350fa73f4c5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.member.write"	f	t
996d53da-fa95-4d4f-bb70-9753985e54aa	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.member.delete"	f	t
2d37eeab-fec9-4e48-963c-030318ea704f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.role.read"	f	t
b62c6bdd-ae9d-4f72-b4c7-d551b426a526	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.role.write"	f	t
0f0e6713-73e9-4b03-a64a-4a75136fa326	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.role.delete"	f	t
5d2b99aa-86d0-46fd-85c6-1ddb1df9809e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.app.read"	f	t
b610543b-974e-4fee-ada7-fd695ff86a36	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.app.write"	f	t
2431d1a8-7e9e-412b-a39f-496c90cc4e5c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.grant.read"	f	t
65f419b9-0ebd-4c8b-a2b0-63e9942905bd	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.grant.write"	f	t
750743bd-b2a9-4f5d-9a76-810aa2857283	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.grant.delete"	f	t
623812e9-8052-4db6-96b6-0a6cd5a817ca	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.grant.member.read"	f	t
b9abd18f-f4f0-4e9f-b618-cb20d93dc673	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.grant.member.write"	f	t
0810f1cd-da34-4314-88dd-9c879e232a29	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"project.grant.member.delete"	f	t
b1d06516-61cd-4627-9352-3e6fbfc821b9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"session.read"	f	t
e96bb553-c485-44d6-b33c-fcedb59fa7bb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER	1	permission	"session.delete"	f	t
7664d367-bb2d-4fe0-8cce-acddd0960903	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"org.global.read"	f	t
9380f742-a4a5-4b50-9eda-262ebc88a2f8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"policy.read"	f	t
6dd25e36-626d-4162-a56b-f5758456dba7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.read"	f	t
f3f14502-9b15-4fc6-8872-b1409145dca2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.write"	f	t
ba7469f3-561f-4264-a2b1-264d15d92487	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.delete"	f	t
ea2a726c-d95a-4519-a240-4d62bd2aa3e0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.member.read"	f	t
e5374743-613a-4367-8182-dfae4a62dd61	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.member.write"	f	t
49e04e8f-814e-4d61-92e5-7ecedf99febb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.member.delete"	f	t
19b1ff33-73da-49b0-af09-62e2c4fd0c7c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.role.read"	f	t
16f58f33-8eec-4510-9be0-b01de83a9d2f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.role.write"	f	t
3eb6833a-a04f-4d23-bdb8-d07b351316ff	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.role.delete"	f	t
a9c0b5c7-8224-44aa-9a47-61197a308002	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.app.read"	f	t
5d177f13-dfcf-4b15-91a9-aa31c35b6167	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.app.write"	f	t
ad8cbd60-da9b-45c1-9ab1-d7099399c2e1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.app.delete"	f	t
c10925f3-0b96-4881-9092-3590cd92298e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.grant.read"	f	t
0ee2eb0f-2117-46a3-bd85-6d044eae3651	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.grant.write"	f	t
b728a4ec-32b3-4691-b1c7-be337f7e2ec2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.grant.delete"	f	t
e0fb491f-5e8a-4103-ae14-75bbc7848ff5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.grant.member.read"	f	t
7c4cbd61-2892-476a-9d8b-0c05009f145a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.grant.member.write"	f	t
adbd8206-4cb0-4245-9ee8-279559fb467b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"project.grant.member.delete"	f	t
91836baa-f166-4f75-82b2-cf55793fea56	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"user.read"	f	t
fa4e618c-3328-45b0-b9fc-02327ad8e64f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"user.global.read"	f	t
a8b779c1-3c2e-45f4-8aeb-a3dd2a02d4d1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"user.grant.read"	f	t
9e3fcb41-a5da-4088-b11b-c7c06d4135b0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"user.grant.write"	f	t
a9b7a426-6965-434c-a2c8-fe751a9dc91c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"user.grant.delete"	f	t
63b2459e-6dd5-422c-b359-3737cc8bfc69	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER	1	permission	"user.membership.read"	f	t
2472d9ad-0fc6-4539-844a-60d1762c1302	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.read"	f	t
4df1e882-10b1-4830-b194-a93fa912db71	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.global.read"	f	t
a8bde4c6-bf80-4ae5-a219-f93b5f96d6a1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.create"	f	t
cd9dc697-48f9-4828-a9b2-09e156308095	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.write"	f	t
106d72cf-09ca-4f81-9078-5c498b532b6f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.delete"	f	t
c26732f4-19e4-4e8b-95b9-80979d5f7573	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.member.read"	f	t
27a7a72a-70d4-45a2-862a-51914455e79b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.member.write"	f	t
cbd830a9-9141-48bf-8ac4-20be4ab91d3a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.member.delete"	f	t
97020354-e409-4815-8f9d-7c54f0ea3e72	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.idp.read"	f	t
071fec62-f6c1-44eb-9401-b48672a217e6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.idp.write"	f	t
92ab0c9c-6b71-4963-89ca-2040eb67e7f8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.idp.delete"	f	t
1e9417b9-9bf6-4cba-b846-a3ba36ea95ec	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.action.read"	f	t
7494ae2d-33ab-41b3-94b8-ea90f665faf7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.action.write"	f	t
61fc7c50-b327-4f64-9ffc-13345e3394c1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.action.delete"	f	t
99409bbd-efef-41a3-abbc-02ff64c3ff4d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.flow.read"	f	t
37625fa5-bfd8-4f6a-a0a3-aafaa60f6f57	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.flow.write"	f	t
53066b50-f587-42ec-93a8-7e905c04ccb6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.flow.delete"	f	t
4454f41e-bea4-4fcc-b905-3274f92f6714	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.feature.read"	f	t
733c9dce-c989-41cc-b88d-27a8cc86ea92	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.feature.write"	f	t
e909bc2e-bb1e-48ed-8189-bec795951d40	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"org.feature.delete"	f	t
dfe24b74-c9b2-41b4-9386-8d31a9786e19	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.read"	f	t
7b2c98ea-f1d9-46b3-8366-599bbdc28f75	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.global.read"	f	t
5d71f941-6e52-49fe-af02-ae005e133b67	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.write"	f	t
752aa8aa-5850-4c0a-9d4b-464a7910c836	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.delete"	f	t
65d14c5d-aafc-4339-9c7c-c308429ce6a7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.grant.read"	f	t
3f3caae0-0188-4a9a-a0f4-85b9099011cf	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.grant.write"	f	t
683d73ff-64a4-4b38-8fe4-ed610ddd0769	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.grant.delete"	f	t
d83c1167-2e53-4357-9946-d9cf3adb11e8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.membership.read"	f	t
a29cdb78-036d-4658-abda-13aa7a7a1963	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.credential.write"	f	t
a0532864-a3d7-4270-ae0d-c8d9a9d4bf54	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.passkey.write"	f	t
238489a3-b039-4359-a46f-22474da4265f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.feature.read"	f	t
d5e0281a-aa1f-400f-9508-fc8c607368cc	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.feature.write"	f	t
2be2a96d-9f1f-444f-9e7e-576e6049a3c8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"user.feature.delete"	f	t
a161eaff-ffcc-42b6-85f7-88277fa29525	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"policy.read"	f	t
d106f6ad-85b5-4ff4-a8be-2f588eed6c89	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"policy.write"	f	t
edfaae22-ae25-4411-8d69-264ac7ee9747	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"policy.delete"	f	t
8f66efad-e756-49df-911a-54353122ead1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.read"	f	t
e28f4a4a-155b-42a2-aafe-efceb858c44f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.create"	f	t
c3465b70-e49c-4f7a-a12f-94838b656054	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.write"	f	t
c1134899-f38a-41cf-8529-e3df6aa71950	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.delete"	f	t
c8d4cd1a-1987-4591-9dfe-cb9add2637f7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.member.read"	f	t
c34f629a-881c-481a-9d92-e31e07dcefb9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.member.write"	f	t
d3648601-6dcd-41fb-a444-967d6517ae3f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.member.delete"	f	t
53212dcc-1cbb-428a-ac18-931858e5b852	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.role.read"	f	t
8ea299f2-8c12-4f26-a665-41e43a7bd68a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.role.write"	f	t
ed6f3e0d-0a6a-472a-be00-71d24faa71b8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.role.delete"	f	t
73535e49-609b-4c8f-88a0-2d505960cef0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.app.read"	f	t
784a35cf-c681-4d4c-8a69-3722f251b7c3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.app.write"	f	t
7353b131-5659-40aa-a1f2-b2998d8bf518	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.app.delete"	f	t
0762c57f-0b97-4b9a-9647-408efc0029eb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.grant.read"	f	t
a6932c04-fc37-4dc1-ac67-e21091bcee51	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.grant.write"	f	t
e2418c98-2abc-4e11-937c-8e0da56771be	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.grant.delete"	f	t
f568c2d3-7dd4-47bd-9b58-2b760a2866ab	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.grant.member.read"	f	t
074bee2d-96e3-4ab3-b232-bde7b4e6468d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.grant.member.write"	f	t
3a519231-ef41-4b31-85a3-133086683d5f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"project.grant.member.delete"	f	t
9cd74d0f-e930-4130-bd6c-5c50a71a6b80	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"session.read"	f	t
4a2c4f0e-b6e0-4e63-863b-4c0a8ea7d151	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ORG_MANAGER	1	permission	"session.delete"	f	t
422926c5-8a42-4fc6-bca7-9cb209573753	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"iam.read"	f	t
55c2ad10-df02-4e9c-aa33-7be030a263d8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"iam.policy.read"	f	t
cf6259b3-bb61-47e9-bd49-803a6b095941	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"iam.member.read"	f	t
681b802b-605e-4504-ad64-b84736bb6f8a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"iam.member.write"	f	t
ef7dbb2f-8020-43dd-9872-19ced82b386f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"iam.idp.read"	f	t
8345c602-da38-437a-9451-dbeafd6fc519	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"iam.feature.read"	f	t
8fffa722-2031-4439-9929-b40171b4e5e5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"iam.restrictions.read"	f	t
eacd25f7-5ec0-421c-9875-18e1dbd19f73	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"org.read"	f	t
9194cf7c-6e9e-47b6-994e-90b3d4f123b9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"org.member.read"	f	t
8226e146-6f73-4821-aeb1-c5cacdf815a9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"org.member.write"	f	t
c71cc640-6d7e-473d-824d-f83a065e7d50	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"org.idp.read"	f	t
fcc37e09-1d3d-43b5-8022-28264a504365	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"org.feature.read"	f	t
9a40597d-4f66-447a-8abb-2075d012bb35	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.read"	f	t
e7bd8db7-27c9-4442-931d-aaff610541dc	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.write"	f	t
9bb35e37-2cde-40cd-952e-71fda0c0a26d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.grant.read"	f	t
682563a5-50e7-4a8b-a242-e07ce5943ffe	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.grant.write"	f	t
ceb836a5-c568-4df8-8286-334da1fc0a02	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.membership.read"	f	t
1fd1b797-58f8-4fa2-a785-f818feac9fc5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.credential.write"	f	t
b1e7e250-92d2-47b0-a1c3-bf1d241cbb64	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.passkey.write"	f	t
52c4177b-ec39-460b-8bbb-2bfbac069da3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"user.feature.read"	f	t
8f4b8823-1c8f-4060-b25b-5a7837cf1f88	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"policy.read"	f	t
7df8eb39-4a7f-4880-9aba-0c4b0ee2cbff	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.read"	f	t
47c50973-194d-48ba-a014-1b41408234d1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.role.read"	f	t
3c84d7e4-3924-4317-9d4f-700faf001449	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.app.read"	f	t
8271b2de-e869-4c10-9c05-85c9722f267a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.member.read"	f	t
b2e1d588-7786-4bcc-a5c8-7c298bc1cf43	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.member.write"	f	t
afccef86-ec20-40dd-bb54-452a9500e4b0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.grant.read"	f	t
425607f9-c8a5-42bc-9a63-548765fe39cb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.grant.member.read"	f	t
700acb5c-dabb-441f-b4c6-90c3c0bdd59a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"project.grant.member.write"	f	t
3309ff7e-cca0-40c9-9e51-d5f90fbd9b6c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"session.read"	f	t
7571eda4-363b-4087-86ad-156873dba117	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"session.write"	f	t
70f672e9-55db-44e7-9ace-01145dfe550b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"session.link"	f	t
2fbf71d2-d781-48a0-8d1b-196bc4cf28ff	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"session.delete"	f	t
96e0c0f8-cc0d-44d0-b4b2-c1a8c62b2ba4	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_LOGIN_CLIENT	1	permission	"userschema.read"	f	t
e5fffbaf-8255-415a-b5ab-3b9fa893a71f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.read"	f	t
a20d17d9-815e-477a-b7b1-4b96b339b36b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.policy.read"	f	t
b494bafc-8c95-4c7f-bdb2-8e75c1cec9f7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.member.read"	f	t
d7977762-8298-4a7b-a31b-2ac8c68e058d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.idp.read"	f	t
72815f2e-32e6-4b70-b077-8c41e50c85a4	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.action.read"	f	t
cdd8cc1f-4c3a-450f-893a-1a3cefade40c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.flow.read"	f	t
270942e6-0317-4a02-8c35-65b8d3b2ef80	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.restrictions.read"	f	t
26f02549-a9a5-4381-9c91-070e3beee350	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.feature.read"	f	t
3121c64d-eb77-4b7d-a93a-fefa005b59b2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.web_key.read"	f	t
70c722fb-bc00-4d79-b071-1250ba198d8b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"iam.debug.read"	f	t
de4146ae-9232-4739-9333-8fdcf8dca97c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"org.read"	f	t
80169563-6e8e-4a9d-b5c7-b97c86f61769	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"org.member.read"	f	t
7782529e-98a7-404f-93b4-a5c35e82bff8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"org.idp.read"	f	t
00aaa5ac-8cd1-4f51-9da4-7e3e78327ac5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"org.action.read"	f	t
964680dd-1623-4bc6-9b87-fef13eb8940f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"org.flow.read"	f	t
e61f3af3-427c-4e65-a38b-51ca830c8f37	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"org.feature.read"	f	t
105ddfc0-ce71-4b24-8613-22fda6a5b220	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"user.read"	f	t
0c6d55ab-052d-455c-ba9a-a72376c146bd	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"user.global.read"	f	t
9c31bcd4-69c1-4008-a14c-b6b2bff7cbf7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"user.grant.read"	f	t
c930a654-0498-4d5c-96c7-5ae9e452e775	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"user.membership.read"	f	t
518ed317-048e-49a5-9708-f5e11989768f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"user.feature.read"	f	t
72e05303-5113-4885-aaf3-b9cb6ad771da	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"policy.read"	f	t
fc70c2b6-4631-4699-96ce-f6638f9bb969	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"project.read"	f	t
2e2ba27d-aaf5-498d-818d-6f3494d072fb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"project.member.read"	f	t
eade004b-2628-4588-8233-82185b0004b8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"project.role.read"	f	t
f2c29803-c948-4832-84a5-54b954d6455c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"project.app.read"	f	t
470c0852-5dd8-4e20-ba8c-cead53720f44	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"project.grant.read"	f	t
15ccb523-afab-4f8d-a083-96d761332ceb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"project.grant.member.read"	f	t
e915c446-37b7-47e4-95f3-9fb936bb6601	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"events.read"	f	t
399e202b-006f-4721-be9a-cbf84a1f5fc9	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"milestones.read"	f	t
53832fca-1adc-474a-8f5a-47101bc9c120	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"action.target.read"	f	t
188e8e86-e6a2-4c25-bbf8-e86c5a6194c5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"action.execution.read"	f	t
19f5fc04-b316-47a5-942a-f683ae8e97b3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"userschema.read"	f	t
bc867799-4d68-4b2d-8e73-0efd20d27ff4	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_OWNER_VIEWER	1	permission	"session.read"	f	t
4eec9dd9-5f55-4451-afb9-339204a7ff5a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"org.read"	f	t
5ecf78c8-bf07-4042-873a-7b94a43145ad	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"org.global.read"	f	t
7df57f4e-037b-4e5e-a0e2-47c0940240c4	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"org.member.read"	f	t
771b9567-279f-49f3-b0ec-9be302c25786	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"org.member.delete"	f	t
ed60daa4-d1d7-4625-a766-59d80ae3aa59	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.read"	f	t
9187bf73-a684-439b-ada4-e510a93daf3e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.global.read"	f	t
a38a5ca7-f27c-4577-a373-185299daf042	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.write"	f	t
5ad04478-ca26-47d2-961d-e238fa3f8373	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.delete"	f	t
4d6941be-5d71-45d6-b05a-c81376c79603	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.grant.read"	f	t
135368dc-a758-4053-81b1-e18c6f4db1b2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.grant.write"	f	t
312459f3-f1f1-4730-80d5-27405439a205	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.grant.delete"	f	t
56cff8ac-0a86-4624-a818-26298124eff1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.membership.read"	f	t
b5886d62-c6be-4df8-a24d-1a78e9c2c807	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.passkey.write"	f	t
e2ddaae4-7aaf-4ac3-8126-456939c12f11	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.feature.read"	f	t
dfe28f0d-798d-4a4c-9449-426e3a50f6ad	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.feature.write"	f	t
27ebfafd-7fdc-4320-8710-19e83009c600	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"user.feature.delete"	f	t
28ecff31-ba58-4cf9-bbd4-418d7ad48c49	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.read"	f	t
57ccb125-868b-44f2-baf4-5afb9fe63f3d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.member.read"	f	t
7efb8a44-3c3f-4486-8106-b976ef7502a6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.role.read"	f	t
12c8027e-7393-49bb-9d87-590389c3f98b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.app.read"	f	t
da92449b-fb35-4902-b130-38abc4cede35	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.grant.read"	f	t
c9e25d90-e56e-4eac-b6f0-6978ce9d968b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.grant.write"	f	t
4ed431fa-cd68-4c2c-be56-e2d8b70e3e50	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.grant.delete"	f	t
d24c01d7-438b-4699-831e-0d8bf794d386	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"project.grant.member.read"	f	t
60afe148-f576-4930-9e23-cc29458b6e2c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"session.read"	f	t
b350eedf-f135-414c-9e5a-264f3ec29d11	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_USER_MANAGER	1	permission	"session.delete"	f	t
d57a06ee-4983-45cb-9dcc-ed33d2b5ed6c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"org.read"	f	t
d6ab43a0-5e94-42b4-84f4-9295911a4ba7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"org.member.read"	f	t
a8807fe2-fb4a-47e9-a106-57b436ac7335	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"org.idp.read"	f	t
32f93bf1-82f3-4cd7-ae1c-d121bf246b23	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"org.action.read"	f	t
727c1906-6a74-4baf-91b6-dfaa2ea56fcf	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"org.flow.read"	f	t
196bb9fb-152d-40a4-8ebe-f9d79eb2a5b8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"org.feature.read"	f	t
6844b980-7e6e-4ec7-82bc-f33783ee7f45	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"user.read"	f	t
2eccedfe-1c9d-4f5e-88b8-4c945a6633cc	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"user.global.read"	f	t
b211a28a-87ae-423e-894f-0de268a713ee	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"user.grant.read"	f	t
7736a81c-55d8-4b0a-92e0-d4e409aa4f56	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"user.membership.read"	f	t
1b9d9523-d900-4e96-a53f-a5cb55cbed8d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"user.feature.read"	f	t
f9f316b6-89a7-4a60-931a-950fa795f1b2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"policy.read"	f	t
597a32bc-ebf7-4693-99a1-8a430a712aac	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"project.read"	f	t
17f4d827-74f5-4f92-8a8b-ede4b1b28f61	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"project.member.read"	f	t
f82a2591-5f51-4ebe-b83d-dea8bdb54f01	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"project.role.read"	f	t
12bf1b38-4d4b-4363-b85b-d535f456bc22	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"project.app.read"	f	t
659e9769-b1d8-479a-8768-59d268f2ea5c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"project.grant.read"	f	t
c861d08d-60ed-4306-aa69-4f6f9c6ab533	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"project.grant.member.read"	f	t
082c74f3-c076-4814-b25b-1d40a964f685	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_OWNER_VIEWER	1	permission	"project.grant.user.grant.read"	f	t
1366cb14-8f08-4e43-b776-f1fcb6ff1a9e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"org.read"	f	t
3071b0a8-4879-468f-8289-6c15e835e5db	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.read"	f	t
9dd96d99-fd87-4d8e-b9f6-2b6f31d3fcdc	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.global.read"	f	t
55641b1d-c9d2-4c57-ad22-7fd78f7f9fdd	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.write"	f	t
4f2548ec-5f22-4415-ba8f-956070628ff3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.delete"	f	t
5047e4a4-69c1-4494-94a5-4c7366af73a0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.grant.read"	f	t
8a38ce73-0f23-4ce4-83ab-315ef288ca35	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.grant.write"	f	t
3d1fde8b-25e7-4f77-b8a0-428433da9487	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.grant.delete"	f	t
1b132738-98ee-4958-8a7b-8f11b39a5a07	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.membership.read"	f	t
67459f87-dfd6-4853-a8b8-bf5818348e33	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.feature.read"	f	t
e06dde5f-aef1-4dab-b1fb-f8fb1667e6d2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.feature.write"	f	t
b6575ae5-3f32-4e0b-bdad-7a5d7bc6039b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"user.feature.delete"	f	t
2013cbca-903d-457c-aff8-d084202ee073	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"policy.read"	f	t
4c917ba6-d440-43c5-b9b1-03e9b104704f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"project.read"	f	t
b08eb2ce-17f7-44ef-841f-318dc137a889	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"project.role.read"	f	t
749997f3-5603-46d2-84f8-df28d4a2cdef	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"session.read"	f	t
c9eff89d-0796-470f-ae2d-db577776b13a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_MANAGER	1	permission	"session.delete"	f	t
60015616-3560-47bc-b3e9-b251831261ff	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_CREATOR	1	permission	"user.global.read"	f	t
4853c3cc-680f-4bea-a80f-0eb3541e01d2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_CREATOR	1	permission	"policy.read"	f	t
fac2d222-7f20-47ff-a559-f4a9d5ac2197	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_CREATOR	1	permission	"project.read:self"	f	t
443e6d34-79ef-4c4e-9089-173b43bc852e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_CREATOR	1	permission	"project.create"	f	t
2cf78ffc-393a-4a52-a167-6f678764cf14	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"policy.read"	f	t
520aa2a4-1542-4a6e-ae31-f006175c54e6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"org.global.read"	f	t
d322ad86-6fc8-45a3-a097-84b4eadc9df2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"project.read"	f	t
48e5774c-5162-42d2-875b-c11bd497dc3b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"project.grant.read"	f	t
09140a67-b425-426f-a0e1-b4bea3fa1c26	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"project.grant.member.read"	f	t
0fa99913-2a4e-41cc-85e5-5d687275a820	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"project.grant.member.write"	f	t
cd74ced0-c26b-4941-a1ca-a640d3d55c49	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"project.grant.member.delete"	f	t
a330af4d-baa3-4792-be08-6931e64abb56	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"user.read"	f	t
693a8d46-f26c-4646-bba6-725837f97872	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"user.global.read"	f	t
2938bb95-6711-431b-b095-2e545b88aed5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"user.grant.read"	f	t
a4ff6e21-efe6-44e8-bdf5-96769bd53c3c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"user.grant.write"	f	t
81ace283-8839-4553-8c44-d1c819e754f3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"user.grant.delete"	f	t
833d454e-10ec-4b41-a635-3c455cc332fb	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER	1	permission	"user.membership.read"	f	t
0747d57b-fd5d-4e31-bd16-b93884aad331	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.read"	f	t
1f05c15b-9f22-47c4-aeeb-47ce87c6c238	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.write"	f	t
ddc617ab-db0e-4f01-8b25-7c0573eeb2b6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.member.read"	f	t
befc6dea-6908-4ba8-985a-b2977a030f2b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.idp.read"	f	t
e52ea1d2-774a-40bb-ad5e-7498aad1ce31	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.idp.write"	f	t
6cde40a7-6e49-4b44-aa2e-23218ccb3e39	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.idp.delete"	f	t
3d31e095-5b47-4f14-a457-3883a9a42838	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.feature.read"	f	t
6e132d80-ef8d-437b-9c27-02eb57e56d23	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.feature.write"	f	t
39e7c755-497b-4e9f-9f2b-bb7cce09758e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"org.feature.delete"	f	t
c4b8550f-8117-402e-901d-af69ec613faa	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"policy.read"	f	t
a147cbc6-3383-40ac-8c6d-b881f61e7171	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"policy.write"	f	t
6cd42ceb-f1b5-4d8a-8ad7-e3066f355437	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_SETTINGS_MANAGER	1	permission	"policy.delete"	f	t
5cb470bb-b1c3-434a-a769-005dc5ee4159	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"org.global.read"	f	t
064aba96-10f4-4bb4-93d5-10a3deb0c421	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"policy.read"	f	t
b0d099ea-8d15-41ca-9826-820ac9130649	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.read"	f	t
d4bc4971-dba4-4b1e-a4c7-98de59fc3178	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.write"	f	t
ce057cf4-320e-4d73-8a42-601d48f1bce1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.delete"	f	t
4623a6f0-7aed-4c1d-8e83-aac85d7cc404	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.member.read"	f	t
9007f143-aa82-42e8-a6d8-89611d664d7a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.member.write"	f	t
671b225a-3f75-43fe-8245-d647c4bd891d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.member.delete"	f	t
bc19eea9-52b0-41fa-b405-1fd576e9545b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.role.read"	f	t
fe30197e-a4f3-4c20-939d-a7ef4a595a7e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.role.write"	f	t
94765ce7-cee2-4cf5-b6db-2fc5c18a5990	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.role.delete"	f	t
171c70ea-c327-4045-9321-823e116e3433	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.app.read"	f	t
c749f427-d39a-4119-bc75-1a66fa0636d8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.app.write"	f	t
47cfa814-d49c-4446-a8cd-1234be337133	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"project.app.delete"	f	t
05984d77-c1bd-460d-bc9c-c10d8ea9faa6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"user.global.read"	f	t
8df555a4-66c4-4032-86ea-cebd7c3c696c	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"user.grant.read"	f	t
6d618caf-37b9-4aae-8b1e-8c732fc0131a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"user.grant.write"	f	t
9cde466f-02f3-4079-aa30-8f54b23e6543	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"user.grant.delete"	f	t
3663acdc-2946-4936-ab5e-dc6e767acfe4	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_GLOBAL	1	permission	"user.membership.read"	f	t
05939f7c-ceca-4ab8-91d4-9e30e5fef8d4	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"policy.read"	f	t
6f607d01-d113-4f6f-9eec-4516d488c7b5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"project.read"	f	t
44a48a84-6a2b-4a0a-a755-eba9d337c6db	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"project.member.read"	f	t
7d7fc8fd-2e37-49b3-8872-69a01b264add	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"project.role.read"	f	t
2aba777b-2785-4a2f-bfe0-247725ec3367	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"project.app.read"	f	t
42d731c2-3752-499d-93b6-64c238c62634	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"project.grant.read"	f	t
4ba3a03d-8828-470c-990a-7dd78f0c31c5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"project.grant.member.read"	f	t
21b09c76-c58a-4529-8c01-072b273ae6f5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"user.read"	f	t
20416802-9393-41c8-aecb-06fb18b052dc	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"user.global.read"	f	t
5b21a27d-211c-4dfe-b638-4b44be0d0b20	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"user.grant.read"	f	t
3858c5a7-052b-4008-8e60-13b992420183	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER	1	permission	"user.membership.read"	f	t
491ec172-abbb-4f3e-94f2-90e4b6a14dcf	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_SELF_MANAGER	1	permission	"policy.read"	f	t
aa6155c3-bff1-4e18-80ff-9d34ebbd9e48	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_SELF_MANAGER	1	permission	"user.self.delete"	f	t
6b0bc365-a21d-4803-acb7-70a199e6bb3d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ADMIN_IMPERSONATOR	1	permission	"admin.impersonation"	f	t
f425e9e3-69d3-40fa-9994-51c5b6ddb78f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_ADMIN_IMPERSONATOR	1	permission	"impersonation"	f	t
afa87aaf-11b3-4a1d-9594-26a613e6f7c6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_ADMIN_IMPERSONATOR	1	permission	"admin.impersonation"	f	t
b0616b39-93f3-48ac-864c-d87ad74192b5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_ADMIN_IMPERSONATOR	1	permission	"impersonation"	f	t
202279a8-ac6f-4fe5-aaec-bc740ea0b3e5	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	SELF_MANAGEMENT_GLOBAL	1	permission	"org.create"	f	t
b6bc5efe-a6c3-47ad-b48b-606370700b2f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	SELF_MANAGEMENT_GLOBAL	1	permission	"policy.read"	f	t
c177c0a5-e136-4c77-8965-93a9bbe10fc7	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	SELF_MANAGEMENT_GLOBAL	1	permission	"user.self.delete"	f	t
c029b3f7-f7a6-4efb-bd6f-89ced152384a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	IAM_END_USER_IMPERSONATOR	1	permission	"impersonation"	f	t
1844033b-0e71-49af-be31-515f8280a991	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_END_USER_IMPERSONATOR	1	permission	"impersonation"	f	t
9fe1ab9b-8603-4664-8b8c-7990bd2e6347	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"org.read"	f	t
c3204030-c15d-4b50-aaec-aa1b1943ab5a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"org.member.read"	f	t
eaf720fb-985b-4c68-ab67-52118330c485	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"user.read"	f	t
4c717967-d5b8-419e-b71a-190741010763	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"user.global.read"	f	t
fc1ae777-faef-47e6-9fc6-5f225af9e770	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"user.grant.read"	f	t
59c3e56d-4dd1-4d60-9e7d-fbb9801b67f3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"user.grant.write"	f	t
21259f8d-13e3-4a0d-9a3b-2372f2f53b41	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"user.grant.delete"	f	t
34c17f67-efe8-4893-9598-66c29006e473	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"policy.read"	f	t
1dfebcd3-efaa-435a-a2ef-978a71d465ce	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"project.read"	f	t
ffe4e05b-2d46-4bef-9db5-9c8cf17bed51	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"project.member.read"	f	t
0c77ace7-019d-4b96-accb-0f0105f32261	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"project.role.read"	f	t
b48b0844-d9b0-406a-af96-dd093ad45e74	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"project.app.read"	f	t
1455ccf1-b8d0-4b8b-be6e-945964c359ec	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"project.grant.read"	f	t
8598aa94-3092-42d4-b11d-7f3b31740e5e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_USER_PERMISSION_EDITOR	1	permission	"project.grant.member.read"	f	t
0ae8c25f-2ad0-4103-980b-28e8a4ccaff1	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"policy.read"	f	t
76fce399-934c-4f82-9d7c-f1328f3b9d0e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"project.read"	f	t
f5f4725c-2109-453a-aa49-037ed4f2def3	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"project.grant.read"	f	t
111e67df-f212-43b8-a961-c3c317b165c0	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"project.grant.member.read"	f	t
d78abee9-e391-4bd9-ae51-c9cc1676197a	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"user.read"	f	t
38d2704c-6b16-4185-a4a2-8f5f31335c99	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"user.global.read"	f	t
becfcec6-192f-4197-bfbc-e7557f24a07d	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"user.grant.read"	f	t
f26bc33c-4cb0-4910-9009-6626bcba48df	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_GRANT_OWNER_VIEWER	1	permission	"user.membership.read"	f	t
a8026a61-1cb6-4745-bafa-3e9ba3e0cbae	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"policy.read"	f	t
790f2cb1-339f-4b22-b899-309d0d79314f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"project.read"	f	t
fbdb130f-7637-40c8-b6e7-34885cac6556	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"project.member.read"	f	t
7b2daedf-a9c3-4fb1-ab21-06738782801b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"project.role.read"	f	t
a18f2db2-f6ef-483e-b6e2-57413f6ac24b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"project.app.read"	f	t
db154c5a-2000-4431-8172-b889e2113fff	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"project.grant.read"	f	t
954cb790-d1ae-4d30-81f1-3ccecdddff7e	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"project.grant.member.read"	f	t
abdea0e8-4576-45c7-b774-8d06fe8ae745	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"user.global.read"	f	t
96ba76f7-caaa-4b09-842b-c6670226fa34	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"user.grant.read"	f	t
24aa372e-ea34-4b46-b594-dbdce25d6ab2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	PROJECT_OWNER_VIEWER_GLOBAL	1	permission	"user.membership.read"	f	t
b2256343-a20e-4969-8211-16348649d5ae	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"org.read"	f	t
6b5fb18d-f583-4bcb-94fe-5d1627be1923	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"org.member.read"	f	t
c28f0d43-8538-4f6f-931d-c84fa5a3cf39	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"user.read"	f	t
216088cb-f762-4d11-9835-a00af75618c6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"user.global.read"	f	t
deb42b6a-b733-4885-b48b-83c396f942a2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"user.grant.read"	f	t
5ab46361-079d-44f5-b6c3-679a9bc1741b	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"user.grant.write"	f	t
8b7d9ffb-6f9a-4bdc-92d9-b3ecb86f0f67	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"user.grant.delete"	f	t
bbaac795-d635-4f55-ad36-b8d0a3856ba8	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"policy.read"	f	t
9895f041-a0e0-4c42-8506-6b31e41bb37f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.read"	f	t
3c248c50-6a5d-41c5-a0ae-409b18c94e40	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.member.read"	f	t
45f2655a-5e9d-4dfe-9fbe-63953a968edf	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.role.read"	f	t
2aeb1555-9c74-4844-b568-fddb65edd4b6	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.app.read"	f	t
5558d2af-23aa-44ca-a368-1b7c1a2048b2	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.grant.read"	f	t
4e82cbde-66bc-4d5d-8851-ef8d1bbcb43f	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.grant.write"	f	t
523b1178-1909-443a-b16a-d2503bb7af68	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.grant.delete"	f	t
109de7cc-f49d-4e82-ad7a-709941940013	338293185505656835	338293185505656835	permission	338293185505656835	role_permission	ORG_PROJECT_PERMISSION_EDITOR	1	permission	"project.grant.member.read"	f	t
5d4b5296-49dd-4466-bc9a-21564766879a	338293185505656835	338293185505722371	org	338293185505722371	org	338293185505722371	1	name	"ZITADEL"	f	t
0e222c7a-18c7-4361-ad24-c0f2db792121	338293185505656835	338293185505722371	org	338293185505722371	org	338293185505722371	1	state	1	f	t
01b37419-d5da-474f-bb4e-dc452f18f47d	338293185505656835	338293185505722371	project	338293185505787907	project	338293185505787907	1	name	"ZITADEL"	f	t
8f7b94be-47b7-4d82-8dfe-ac9da1596f71	338293185505656835	338293185505722371	project	338293185505787907	project	338293185505787907	1	state	1	f	t
e0b35239-4b31-41cd-832e-9c003a34c875	338293185505656835	338293185505722371	org	338293185505722371	org_domain	zitadel.localhost	1	verified	true	f	f
08de934f-9328-4081-aa4f-4b667132609b	338293185505656835	338293185505722371	org	338293185505722371	org_member_role	338293185506246659	1	org_role	"ORG_OWNER"	f	t
fd7346c4-ae0b-4ba4-bef2-5b5e918b6926		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.instance.read"	f	t
a29e6c22-f06e-4e46-a2fa-b4633a01314c		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.instance.write"	f	t
0ec6785b-851a-4642-9a99-305e2646125b		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.instance.delete"	f	t
2afa84f0-b82e-40f3-8c79-adb999e661ce		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.domain.read"	f	t
d60d125c-454f-49c5-a64e-26c2350f31a5		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.domain.write"	f	t
8b3d16ec-158e-4fd4-9dc2-194405f177ec		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.domain.delete"	f	t
a0341699-1275-4445-8fc8-c0dce2a8a586		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.debug.read"	f	t
948b8c23-fae4-464b-866f-2955caeff676		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.debug.write"	f	t
52d1172c-a7ee-4b73-afdd-b0509e30530c		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.debug.delete"	f	t
fe756dd9-9d3a-4c86-acaf-54bd3579e929		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.feature.read"	f	t
81882def-5f17-4d9f-a42b-e1648911612b		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.feature.write"	f	t
3363638e-f2c0-45bc-b1b2-3b0733c26e66		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.feature.delete"	f	t
1f72d594-520f-4faf-ae0e-65915a7bc156		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.limits.write"	f	t
16bb35ef-3eab-4a80-a2b7-30feb021c031		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.limits.delete"	f	t
6d7d4744-e1bf-4ea0-a1d1-35034371e5c6		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.quota.write"	f	t
3cbf6c86-a693-44b8-a513-03b212be7337		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.quota.delete"	f	t
416fbb08-1425-4a3b-a33a-13f51b8fbb22		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER	1	permission	"system.iam.member.read"	f	t
56ecb5b1-fcc4-430b-abe3-75ad4120a234		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER_VIEWER	1	permission	"system.instance.read"	f	t
182c7162-5861-414f-8ca7-c14e5efe2c67		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER_VIEWER	1	permission	"system.domain.read"	f	t
6e675d52-7179-4340-beb5-279a6614b7cb		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER_VIEWER	1	permission	"system.debug.read"	f	t
51d760f0-f191-42d6-8209-2993b2312059		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER_VIEWER	1	permission	"system.feature.read"	f	t
bd7b6ffd-e107-4340-8ba4-2976ce0eb6ca		SYSTEM	permission	SYSTEM	role_permission	SYSTEM_OWNER_VIEWER	1	permission	"system.iam.member.read"	f	t
7f161af6-3665-4ef2-8b1e-4469e6ce4ee0	338293185505656835	338293185505722371	project	338293275599306755	project	338293275599306755	1	name	"modul_223"	f	t
f71597cf-6b40-40a1-b7cd-b45b5eaa6cdd	338293185505656835	338293185505722371	project	338293275599306755	project	338293275599306755	1	state	1	f	t
\.


--
-- Data for Name: unique_constraints; Type: TABLE DATA; Schema: eventstore; Owner: -
--

COPY eventstore.unique_constraints (instance_id, unique_type, unique_field) FROM stdin;
	migration_started	14_events_push
	migration_done	14_events_push
	migration_started	40_init_push_func_v4
	migration_done	40_init_push_func_v4
	migration_started	01_tables
	migration_done	01_tables
	migration_started	02_assets
	migration_done	02_assets
	migration_started	28_add_search_table
	migration_done	28_add_search_table
	migration_started	31_add_aggregate_index_to_fields
	migration_done	31_add_aggregate_index_to_fields
	migration_started	46_init_permission_functions
	migration_done	46_init_permission_functions
	migration_started	03_default_instance
338293185505656835	secret_generator	
338293185505656835	secret_generator	
338293185505656835	secret_generator	
338293185505656835	secret_generator	
338293185505656835	secret_generator	
338293185505656835	secret_generator	
338293185505656835	secret_generator	
338293185505656835	secret_generator	\b
338293185505656835	secret_generator	\t
338293185505656835	org_name	zitadel
338293185505656835	org_domain	zitadel.localhost
338293185505656835	usernames	zitadel-admin@zitadel.localhost
338293185505656835	member	338293185505722371:338293185506246659
338293185505656835	member	338293185505656835:338293185506246659
338293185505656835	usernames	login-client
338293185505656835	member	338293185505656835:338293185506312195
338293185505656835	project_names	zitadel338293185505722371
338293185505656835	appname	management-api:338293185505787907
338293185505656835	appname	admin-api:338293185505787907
338293185505656835	appname	auth-api:338293185505787907
338293185505656835	appname	console:338293185505787907
338293185505656835	web_key	338293186697101315
338293185505656835	web_key	338293186797502467
	migration_done	03_default_instance
	migration_started	05_last_failed
	migration_done	05_last_failed
	migration_started	06_resource_owner_columns
	migration_done	06_resource_owner_columns
	migration_started	07_logstore
	migration_done	07_logstore
	migration_started	08_auth_token_indexes
	migration_done	08_auth_token_indexes
	migration_started	12_auth_users_otp_columns
	migration_done	12_auth_users_otp_columns
	migration_started	13_fix_quota_constraints
	migration_done	13_fix_quota_constraints
	migration_started	15_current_projection_state
	migration_done	15_current_projection_state
	migration_started	16_unique_constraint_lower
	migration_done	16_unique_constraint_lower
	migration_started	17_add_offset_col_to_current_states
	migration_done	17_add_offset_col_to_current_states
	migration_started	19_add_current_sequences_index
	migration_done	19_add_current_sequences_index
	migration_started	20_add_by_user_index_on_session
	migration_done	20_add_by_user_index_on_session
	migration_started	22_active_instance_events_index
	migration_done	22_active_instance_events_index
	migration_started	23_correct_global_unique_constraints
	instance_domain	zitadel-3ar3jm.localhost
	instance_domain	localhost
	migration_done	23_correct_global_unique_constraints
	migration_started	24_add_actor_col_to_auth_tokens
	migration_done	24_add_actor_col_to_auth_tokens
	migration_started	26_auth_users3
	migration_done	26_auth_users3
	migration_started	29_init_fields_for_project_grant
	migration_done	29_init_fields_for_project_grant
	migration_started	30_fill_fields_for_org_domain_verified
	migration_done	30_fill_fields_for_org_domain_verified
	migration_started	34_add_cache_schema
	migration_done	34_add_cache_schema
	migration_started	35_add_position_to_index_es_wm
	migration_done	35_add_position_to_index_es_wm
	migration_started	36_fill_v3_milestones
	migration_done	36_fill_v3_milestones
	migration_started	38_back_channel_logout_notification_start_
	migration_done	38_back_channel_logout_notification_start_
	migration_started	44_replace_current_sequences_index
	migration_done	44_replace_current_sequences_index
	migration_started	43_correct_project_owners
	migration_done	43_correct_project_owners
	migration_started	47_fill_membership_fields
	migration_done	47_fill_membership_fields
	migration_started	49_init_permitted_orgs_function
	migration_done	49_init_permitted_orgs_function
	migration_started	50_idp_templates6_add_use_pkce
	migration_done	50_idp_templates6_add_use_pkce
	migration_started	51_idp_templates6_add_root_ca
	migration_done	51_idp_templates6_add_root_ca
	migration_started	52_idp_templates6_ldap2
	migration_done	52_idp_templates6_ldap2
	migration_started	53_init_permitted_orgs_function_v2
	migration_done	53_init_permitted_orgs_function_v2
	migration_started	54_instance_position_index_again
	migration_done	54_instance_position_index_again
	migration_started	55_execution_handler_start
	migration_done	55_execution_handler_start
	migration_started	56_idp_templates6_add_saml_federated_logout
	migration_done	56_idp_templates6_add_saml_federated_logout
	migration_started	57_create_resource_counts
	migration_done	57_create_resource_counts
	migration_started	58_replace_login_names3_view
	migration_done	58_replace_login_names3_view
	migration_started	60_generate_system_id
	migration_done	60_generate_system_id
	migration_started	18_add_lower_fields_to_login_names
	migration_done	18_add_lower_fields_to_login_names
	migration_started	21_add_block_field_to_limits
	migration_done	21_add_block_field_to_limits
	migration_started	25_user14_add_lower_fields_to_verified_email
	migration_done	25_user14_add_lower_fields_to_verified_email
	migration_started	27_idp_templates6_add_saml_name_id_format
	migration_done	27_idp_templates6_add_saml_name_id_format
	migration_started	32_add_auth_sessionid
	migration_done	32_add_auth_sessionid
	migration_started	33_sms_configs3_twilio_add_verification_sid
	migration_done	33_sms_configs3_twilio_add_verification_sid
	migration_started	37_apps7_oidc_configs_add_back_channel_logout_uri
	migration_done	37_apps7_oidc_configs_add_back_channel_logout_uri
	migration_started	40_apps7_oidc_configs_login_version
	migration_done	40_apps7_oidc_configs_login_version
	migration_started	43_create_fields_domain_index
	migration_done	43_create_fields_domain_index
	migration_started	48_apps7_saml_configs_login_version
	migration_done	48_apps7_saml_configs_login_version
	migration_started	59_setup_webkeys
	migration_done	59_setup_webkeys
	migration_started	projections.orgs1
	migration_done	projections.orgs1
	migration_started	projections.org_metadata2
	migration_done	projections.org_metadata2
	migration_started	projections.actions3
	migration_done	projections.actions3
	migration_started	projections.flow_triggers3
	migration_done	projections.flow_triggers3
	migration_started	projections.projects4
	migration_done	projections.projects4
	migration_started	projections.password_complexity_policies2
	migration_done	projections.password_complexity_policies2
	migration_started	projections.password_age_policies2
	migration_done	projections.password_age_policies2
	migration_started	projections.lockout_policies3
	migration_done	projections.lockout_policies3
	migration_started	projections.privacy_policies4
	migration_done	projections.privacy_policies4
	migration_started	projections.domain_policies2
	migration_done	projections.domain_policies2
	migration_started	projections.label_policies3
	migration_done	projections.label_policies3
	migration_started	projections.project_grants4
	migration_done	projections.project_grants4
	migration_started	projections.project_roles4
	migration_done	projections.project_roles4
	migration_started	projections.org_domains2
	migration_done	projections.org_domains2
	migration_started	projections.login_policies5
	migration_done	projections.login_policies5
	migration_started	projections.idps3
	migration_done	projections.idps3
	migration_started	projections.idp_templates6
	migration_done	projections.idp_templates6
	migration_started	projections.apps7
	migration_done	projections.apps7
	migration_started	projections.idp_user_links3
	migration_done	projections.idp_user_links3
	migration_started	projections.idp_login_policy_links5
	migration_done	projections.idp_login_policy_links5
	migration_started	projections.mail_templates2
	migration_done	projections.mail_templates2
	migration_started	projections.message_texts2
	migration_done	projections.message_texts2
	migration_started	projections.custom_texts2
	migration_done	projections.custom_texts2
	migration_started	projections.users14
	migration_done	projections.users14
	migration_started	projections.login_names3
	migration_done	projections.login_names3
	migration_started	projections.org_members4
	migration_done	projections.org_members4
	migration_started	projections.instance_domains
	migration_done	projections.instance_domains
	migration_started	projections.instance_trusted_domains
	migration_done	projections.instance_trusted_domains
	migration_started	projections.instance_members4
	migration_done	projections.instance_members4
	migration_started	projections.project_members4
	migration_done	projections.project_members4
	migration_started	projections.project_grant_members4
	migration_done	projections.project_grant_members4
	migration_started	projections.authn_keys2
	migration_done	projections.authn_keys2
	migration_started	projections.personal_access_tokens3
	migration_done	projections.personal_access_tokens3
	migration_started	projections.user_grants5
	migration_done	projections.user_grants5
	migration_started	projections.user_metadata5
	migration_done	projections.user_metadata5
	migration_started	projections.user_auth_methods5
	migration_done	projections.user_auth_methods5
	migration_started	projections.instances
	migration_done	projections.instances
	migration_started	projections.secret_generators2
	migration_done	projections.secret_generators2
	migration_started	projections.smtp_configs5
	migration_done	projections.smtp_configs5
	migration_started	projections.sms_configs3
	migration_done	projections.sms_configs3
	migration_started	projections.oidc_settings2
	migration_done	projections.oidc_settings2
	migration_started	projections.notification_providers
	migration_done	projections.notification_providers
	migration_started	projections.keys4
	migration_done	projections.keys4
	migration_started	projections.security_policies2
	migration_done	projections.security_policies2
	migration_started	projections.notification_policies
	migration_done	projections.notification_policies
	migration_started	projections.device_auth_requests2
	migration_done	projections.device_auth_requests2
	migration_started	projections.sessions8
	migration_done	projections.sessions8
	migration_started	projections.auth_requests
	migration_done	projections.auth_requests
	migration_started	projections.saml_requests
	migration_done	projections.saml_requests
	migration_started	projections.milestones3
	migration_done	projections.milestones3
	migration_started	projections.quotas
	migration_done	projections.quotas
	migration_started	projections.limits
	migration_done	projections.limits
	migration_started	projections.restrictions2
	migration_done	projections.restrictions2
	migration_started	projections.system_features
	migration_done	projections.system_features
	migration_started	projections.instance_features2
	migration_done	projections.instance_features2
	migration_started	projections.targets2
	migration_done	projections.targets2
	migration_started	projections.executions1
	migration_done	projections.executions1
	migration_started	projections.user_schemas1
	migration_done	projections.user_schemas1
	migration_started	projections.web_keys1
	migration_done	projections.web_keys1
	migration_started	projections.debug_events
	migration_done	projections.debug_events
	migration_started	projections.hosted_login_translations
	migration_done	projections.hosted_login_translations
	migration_started	adminapi.styling2
	migration_done	adminapi.styling2
	migration_started	auth.users3
	migration_done	auth.users3
	migration_started	auth.user_sessions
	migration_done	auth.user_sessions
	migration_started	auth.tokens
	migration_done	auth.tokens
	migration_started	auth.refresh_tokens
	migration_done	auth.refresh_tokens
	migration_started	projections.notifications
	migration_done	projections.notifications
	migration_started	projections.notifications_quota
	migration_done	projections.notifications_quota
	migration_started	projections.notifications_back_channel_logout
	migration_done	projections.notifications_back_channel_logout
338293185505656835	project_names	modul_223338293185505722371
338293185505656835	appname	ruby-on-rails:338293275599306755
338293185505656835	usernames	test
338293185505656835	user_grant	338293185505722371:338303017977643011:338293275599306755:
\.


--
-- Data for Name: access; Type: TABLE DATA; Schema: logstore; Owner: -
--

COPY logstore.access (log_date, protocol, request_url, response_status, request_headers, response_headers, instance_id, project_id, requested_domain, requested_host) FROM stdin;
\.


--
-- Data for Name: execution; Type: TABLE DATA; Schema: logstore; Owner: -
--

COPY logstore.execution (log_date, took, message, loglevel, instance_id, action_id, metadata) FROM stdin;
\.


--
-- Data for Name: actions3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.actions3 (id, creation_date, change_date, resource_owner, instance_id, action_state, sequence, name, script, timeout, allowed_to_fail, owner_removed) FROM stdin;
\.


--
-- Data for Name: apps7; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.apps7 (id, name, project_id, creation_date, change_date, resource_owner, instance_id, state, sequence) FROM stdin;
338293185505853443	Management-API	338293185505787907	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505722371	338293185505656835	1	3
338293185505918979	Admin-API	338293185505787907	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505722371	338293185505656835	1	5
338293185505984515	Auth-API	338293185505787907	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505722371	338293185505656835	1	7
338293185506050051	Console	338293185505787907	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505722371	338293185505656835	1	11
338293453102252035	ruby-on-rails	338293275599306755	2025-09-17 18:43:31.033346+00	2025-09-17 20:38:32.518665+00	338293185505722371	338293185505656835	1	8
\.


--
-- Data for Name: apps7_api_configs; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.apps7_api_configs (app_id, instance_id, client_id, client_secret, auth_method) FROM stdin;
338293185505853443	338293185505656835	338293186696839171		1
338293185505918979	338293185505656835	338293186696904707		1
338293185505984515	338293185505656835	338293186696970243		1
\.


--
-- Data for Name: apps7_oidc_configs; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.apps7_oidc_configs (app_id, instance_id, version, client_id, client_secret, redirect_uris, response_types, grant_types, application_type, auth_method_type, post_logout_redirect_uris, is_dev_mode, access_token_type, access_token_role_assertion, id_token_role_assertion, id_token_userinfo_assertion, clock_skew, additional_origins, skip_native_app_success_page, back_channel_logout_uri, login_version, login_base_uri) FROM stdin;
338293185506050051	338293185505656835	0	338293186697035779		{http://zitadel-3ar3jm.localhost:8080/ui/console/auth/callback,http://localhost:8080/ui/console/auth/callback}	{0}	{0}	1	2	{http://zitadel-3ar3jm.localhost:8080/ui/console/signedout,http://localhost:8080/ui/console/signedout}	t	0	f	f	f	0	\N	f		0	
338293453102252035	338293185505656835	0	338293453119029251		{http://127.0.0.1:5000/auth/callback}	{0}	{0,2}	0	2	{http://127.0.0.1:5000/}	t	0	f	f	f	0	\N	f		1	
\.


--
-- Data for Name: apps7_saml_configs; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.apps7_saml_configs (app_id, instance_id, entity_id, metadata, metadata_url, login_version, login_base_uri) FROM stdin;
\.


--
-- Data for Name: auth_requests; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.auth_requests (id, creation_date, change_date, sequence, resource_owner, instance_id, login_client, client_id, redirect_uri, scope, prompt, ui_locales, max_age, login_hint, hint_user_id) FROM stdin;
V2_338305066140172291	2025-09-17 20:38:52.933453+00	2025-09-17 20:38:52.933453+00	1	338293185505656835	338293185505656835		338293453119029251	http://127.0.0.1:5000/auth/callback	{openid,profile,email,offline_access}	\N	\N	\N	\N	\N
\.


--
-- Data for Name: authn_keys2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.authn_keys2 (id, creation_date, change_date, resource_owner, instance_id, aggregate_id, sequence, object_id, expiration, identifier, public_key, enabled, type) FROM stdin;
\.


--
-- Data for Name: current_sequences; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.current_sequences (projection_name, aggregate_type, current_sequence, instance_id, "timestamp") FROM stdin;
\.


--
-- Data for Name: current_states; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.current_states (projection_name, instance_id, last_updated, aggregate_id, aggregate_type, sequence, event_date, "position", filter_offset) FROM stdin;
project_grant_fields	338293185505656835	2025-09-17 18:40:52.683719+00	338293185505787907	project	11	2025-09-17 18:40:52.502632+00	1758134452.502632	0
org_domain_verified_fields	338293185505656835	2025-09-17 18:40:52.689215+00	338293185505722371	org	3	2025-09-17 18:40:52.502632+00	1758134452.502632	0
membership_fields	338293185505656835	2025-09-17 18:40:52.726092+00	338293185505656835	instance	27	2025-09-17 18:40:52.502632+00	1758134452.502632	0
projections.login_policies5	338293185505656835	2025-09-17 21:20:34.097466+00	338293185505656835	instance	18	2025-09-17 18:40:52.502632+00	1758134452.502632	4
projections.user_metadata5	338293185505656835	2025-09-17 21:06:30.996284+00			0	0001-01-01 00:00:00+00	0	0
projections.smtp_configs5	338293185505656835	2025-09-17 21:06:54.802276+00			0	0001-01-01 00:00:00+00	0	0
projections.project_members4	338293185505656835	2025-09-17 21:06:32.011418+00			0	0001-01-01 00:00:00+00	0	0
projections.notifications_back_channel_logout	338293185505656835	2025-09-17 20:38:00.266929+00			57	2025-09-17 18:40:52.707855+00	1758134452.707855	0
projections.apps7	338293185505656835	2025-09-17 21:06:49.485383+00	338293275599306755	project	8	2025-09-17 20:38:32.518665+00	1758141512.518665	1
projections.org_members4	338293185505656835	2025-09-17 21:07:00.093232+00	338293185505722371	org	5	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.saml_requests	338293185505656835	2025-09-17 21:06:53.609175+00			0	0001-01-01 00:00:00+00	0	0
projections.mail_templates2	338293185505656835	2025-09-17 21:20:44.189195+00	338293185505656835	instance	24	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.idp_templates6	338293185505656835	2025-09-17 21:06:33.091716+00			0	0001-01-01 00:00:00+00	0	0
projections.projects4	338293185505656835	2025-09-17 21:06:39.704747+00	338293275599306755	project	1	2025-09-17 18:41:45.226613+00	1758134505.226613	1
projections.keys4	338293185505656835	2025-09-17 21:20:34.806861+00			0	0001-01-01 00:00:00+00	0	0
projections.password_age_policies2	338293185505656835	2025-09-17 21:20:45.41484+00	338293185505656835	instance	13	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.secret_generators2	338293185505656835	2025-09-17 21:06:26.343544+00	338293185505656835	instance	11	2025-09-17 18:40:52.502632+00	1758134452.502632	9
projections.instances	338293185505656835	2025-09-17 21:20:42.508752+00	338293185505656835	instance	29	2025-09-17 18:40:52.502632+00	1758134452.502632	5
projections.milestones3	338293185505656835	2025-09-17 21:20:47.596913+00	338293185505656835	milestone	5	2025-09-17 20:45:19.539767+00	1758141919.539767	1
projections.instance_domains	338293185505656835	2025-09-17 21:20:37.291842+00	338293185505656835	instance	33	2025-09-17 18:40:52.502632+00	1758134452.502632	4
instance_domain_fields	338293185505656835	2025-09-17 21:20:22.73171+00	338293185505656835	instance	32	2025-09-17 18:40:52.502632+00	1758134452.502632	2
projections.notification_providers	338293185505656835	2025-09-17 21:20:50.136682+00			0	0001-01-01 00:00:00+00	0	0
projections.device_auth_requests2	338293185505656835	2025-09-17 21:06:38.026396+00			0	0001-01-01 00:00:00+00	0	0
projections.lockout_policies3	338293185505656835	2025-09-17 21:07:03.410617+00	338293185505656835	instance	21	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.project_grant_members4	338293185505656835	2025-09-17 21:06:33.755948+00			0	0001-01-01 00:00:00+00	0	0
projections.instance_trusted_domains	338293185505656835	2025-09-17 21:06:18.085805+00			0	0001-01-01 00:00:00+00	0	0
projections.idp_user_links3	338293185505656835	2025-09-17 21:20:42.997663+00			0	0001-01-01 00:00:00+00	0	0
projections.label_policies3	338293185505656835	2025-09-17 21:20:48.437089+00	338293185505656835	instance	23	2025-09-17 18:40:52.502632+00	1758134452.502632	2
projections.flow_triggers3	338293185505656835	2025-09-17 21:20:48.969442+00			0	0001-01-01 00:00:00+00	0	0
projections.oidc_settings2	338293185505656835	2025-09-17 21:20:44.780071+00	338293185505656835	instance	106	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.login_names3	338293185505656835	2025-09-17 21:20:36.509129+00	338303017977643011	user	1	2025-09-17 20:18:32.828518+00	1758140312.828518	1
projections.domain_policies2	338293185505656835	2025-09-17 21:06:56.706631+00	338293185505656835	instance	14	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.personal_access_tokens3	338293185505656835	2025-09-17 21:06:22.782181+00	338293185506312195	user	2	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.project_grants4	338293185505656835	2025-09-17 21:06:45.616045+00			0	0001-01-01 00:00:00+00	0	0
projections.sms_configs3	338293185505656835	2025-09-17 21:06:48.8203+00			0	0001-01-01 00:00:00+00	0	0
projections.password_complexity_policies2	338293185505656835	2025-09-17 21:06:37.884839+00	338293185505656835	instance	12	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.idp_login_policy_links5	338293185505656835	2025-09-17 21:06:58.624136+00			0	0001-01-01 00:00:00+00	0	0
projections.authn_keys2	338293185505656835	2025-09-17 21:06:27.788712+00	338293275599306755	project	8	2025-09-17 20:38:32.518665+00	1758141512.518665	1
projections.security_policies2	338293185505656835	2025-09-17 21:06:57.31545+00			0	0001-01-01 00:00:00+00	0	0
projections.org_domains2	338293185505656835	2025-09-17 21:07:08.574602+00	338293185505722371	org	4	2025-09-17 18:40:52.502632+00	1758134452.502632	3
projections.notification_policies	338293185505656835	2025-09-17 21:20:50.150017+00	338293185505656835	instance	20	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.user_grants5	338293185505656835	2025-09-17 21:06:16.51001+00	338303078325288963	usergrant	1	2025-09-17 20:19:08.104219+00	1758140348.104219	1
projections.org_metadata2	338293185505656835	2025-09-17 21:07:07.041682+00			0	0001-01-01 00:00:00+00	0	0
projections.auth_requests	338293185505656835	2025-09-17 21:20:34.598054+00	V2_338309262256111619	auth_request	5	2025-09-17 21:20:34.585778+00	1758144034.585778	1
projections.custom_texts2	338293185505656835	2025-09-17 21:07:07.57112+00	338293185505656835	instance	105	2025-09-17 18:40:52.502632+00	1758134452.502632	72
projections.privacy_policies4	338293185505656835	2025-09-17 21:20:34.708439+00	338293185505656835	instance	19	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.user_auth_methods5	338293185505656835	2025-09-17 21:20:50.275887+00			0	0001-01-01 00:00:00+00	0	0
projections.instance_members4	338293185505656835	2025-09-17 21:06:30.999523+00	338293185505656835	instance	27	2025-09-17 18:40:52.502632+00	1758134452.502632	2
projections.message_texts2	338293185505656835	2025-09-17 21:20:40.861038+00	338293185505656835	instance	105	2025-09-17 18:40:52.502632+00	1758134452.502632	72
projections.orgs1	338293185505656835	2025-09-17 21:06:09.551906+00	338293185505722371	org	4	2025-09-17 18:40:52.502632+00	1758134452.502632	2
projections.actions3	338293185505656835	2025-09-17 21:06:27.78901+00			0	0001-01-01 00:00:00+00	0	0
projections.user_schemas1	338293185505656835	2025-09-17 21:06:46.04405+00			0	0001-01-01 00:00:00+00	0	0
adminapi.styling2	338293185505656835	2025-09-17 21:06:47.780472+00	338293185505656835	instance	23	2025-09-17 18:40:52.502632+00	1758134452.502632	2
auth.refresh_tokens	338293185505656835	2025-09-17 21:05:02.008645+00			0	0001-01-01 00:00:00+00	0	0
projections.system_features	338293185505656835	2025-09-17 21:06:55.035026+00			0	0001-01-01 00:00:00+00	0	0
auth.users3	338293185505656835	2025-09-17 21:05:07.073933+00	338303017977643011	user	6	2025-09-17 20:46:27.721909+00	1758141987.721909	1
projections.sessions8	338293185505656835	2025-09-17 21:06:59.126682+00	338305782527295491	session	10	2025-09-17 20:46:26.122538+00	1758141986.122538	3
projections.limits	338293185505656835	2025-09-17 21:07:03.04754+00			0	0001-01-01 00:00:00+00	0	0
projections.notifications	338293185505656835	2025-09-17 21:07:06.554246+00	338303017977643011	user	4	2025-09-17 20:46:25.16009+00	1758141985.160090	1
projections.execution_handler	338293185505656835	2025-09-17 21:20:34.599659+00	V2_338309262256111619	auth_request	5	2025-09-17 21:20:34.585778+00	1758144034.585778	4
projections.users14	338293185505656835	2025-09-17 21:20:36.554275+00	338303017977643011	user	6	2025-09-17 20:46:27.721909+00	1758141987.721909	1
projections.web_keys1	338293185505656835	2025-09-17 21:20:37.824816+00	338293186797502467	web_key	1	2025-09-17 18:40:52.502632+00	1758134452.502632	3
projections.restrictions2	338293185505656835	2025-09-17 21:20:37.879978+00			0	0001-01-01 00:00:00+00	0	0
auth.user_sessions	338293185505656835	2025-09-17 21:04:16.162457+00	338303017977643011	user	5	2025-09-17 20:46:26.122538+00	1758141986.122538	1
projections.notifications_quota	338293185505656835	2025-09-17 21:04:31.537901+00			0	0001-01-01 00:00:00+00	0	0
auth.tokens	338293185505656835	2025-09-17 21:06:12.963185+00	338293185506312195	user	2	2025-09-17 18:40:52.502632+00	1758134452.502632	1
projections.quotas	338293185505656835	2025-09-17 21:06:13.56423+00			0	0001-01-01 00:00:00+00	0	0
projections.targets2	338293185505656835	2025-09-17 21:06:23.833597+00			0	0001-01-01 00:00:00+00	0	0
projections.hosted_login_translations	338293185505656835	2025-09-17 21:06:26.661596+00			0	0001-01-01 00:00:00+00	0	0
projections.idps3	338293185505656835	2025-09-17 21:06:27.788848+00			0	0001-01-01 00:00:00+00	0	0
projections.project_roles4	338293185505656835	2025-09-17 21:06:27.78961+00			0	0001-01-01 00:00:00+00	0	0
projections.instance_features2	338293185505656835	2025-09-17 21:06:35.821896+00	338293185505656835	feature	2	2025-09-17 18:40:52.502632+00	1758134452.502632	2
projections.executions1	338293185505656835	2025-09-17 21:06:44.155077+00			0	0001-01-01 00:00:00+00	0	0
projections.debug_events	338293185505656835	2025-09-17 21:06:44.778848+00			0	0001-01-01 00:00:00+00	0	0
\.


--
-- Data for Name: custom_texts2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.custom_texts2 (aggregate_id, instance_id, creation_date, change_date, sequence, is_default, template, language, key, text, owner_removed) FROM stdin;
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	34	t	InitCode	de	Greeting	Hallo {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	35	t	InitCode	de	Subject	User initialisieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	36	t	InitCode	de	Title	Zitadel - User initialisieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	37	t	InitCode	de	PreHeader	User initialisieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	38	t	InitCode	de	Text	Dieser Benutzer wurde soeben im Zitadel erstellt. Mit dem Benutzernamen <br><strong>{{.PreferredLoginName}}</strong><br> kannst du dich anmelden. Nutze den untenstehenden Button, um die Initialisierung abzuschliessen <br>(Code <strong>{{.Code}}</strong>).<br> Falls du dieses Mail nicht angefordert hast, kannst du es einfach ignorieren.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	39	t	InitCode	de	ButtonText	Initialisierung abschliessen	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	40	t	PasswordReset	de	Greeting	Hallo {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	41	t	PasswordReset	de	Subject	Passwort zurücksetzen	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	42	t	PasswordReset	de	Title	Zitadel - Passwort zurücksetzen	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	43	t	PasswordReset	de	PreHeader	Passwort zurücksetzen	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	44	t	PasswordReset	de	Text	Wir haben eine Anfrage für das Zurücksetzen deines Passwortes bekommen. Du kannst den untenstehenden Button verwenden, um dein Passwort zurückzusetzen <br>(Code <strong>{{.Code}}</strong>).<br> Falls du dieses Mail nicht angefordert hast, kannst du es ignorieren.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	45	t	PasswordReset	de	ButtonText	Passwort zurücksetzen	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	46	t	VerifyEmail	de	Greeting	Hallo {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	47	t	VerifyEmail	de	Subject	Email verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	48	t	VerifyEmail	de	Title	Zitadel - Email verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	49	t	VerifyEmail	de	PreHeader	Email verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	50	t	VerifyEmail	de	Text	Eine neue E-Mail Adresse wurde hinzugefügt. Bitte verwende den untenstehenden Button um diese zu verifizieren <br>(Code <strong>{{.Code}}</strong>).<br> Falls du deine E-Mail Adresse nicht selber hinzugefügt hast, kannst du dieses E-Mail ignorieren.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	51	t	VerifyEmail	de	ButtonText	Email verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	52	t	VerifyPhone	de	Greeting	Hallo {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	53	t	VerifyPhone	de	Subject	Telefonnummer verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	54	t	VerifyPhone	de	Title	Zitadel - Telefonnummer verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	55	t	VerifyPhone	de	PreHeader	Telefonnummer verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	56	t	VerifyPhone	de	Text	Eine Telefonnummer wurde hinzugefügt. Bitte verifiziere diese in dem du folgenden Code eingibst (Code {{.Code}})	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	57	t	VerifyPhone	de	ButtonText	Telefon verifizieren	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	58	t	DomainClaimed	de	Greeting	Hallo {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	59	t	DomainClaimed	de	Subject	Domain wurde beansprucht	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	60	t	DomainClaimed	de	Title	Zitadel - Domain wurde beansprucht	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	61	t	DomainClaimed	de	PreHeader	Email / Username ändern	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	62	t	DomainClaimed	de	Text	Die Domain {{.Domain}} wurde von einer Organisation beansprucht. Dein derzeitiger User {{.Username}} ist nicht Teil dieser Organisation. Daher musst du beim nächsten Login eine neue Email hinterlegen. Für diesen Login haben wir dir einen temporären Usernamen ({{.TempUsername}}) erstellt.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	63	t	DomainClaimed	de	ButtonText	Login	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	64	t	PasswordChange	de	Greeting	Hallo {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	65	t	PasswordChange	de	Subject	Passwort von Benutzer wurde geändert	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	66	t	PasswordChange	de	Title	ZITADEL - Passwort von Benutzer wurde geändert	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	67	t	PasswordChange	de	PreHeader	Passwort Änderung	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	68	t	PasswordChange	de	Text	Das Password vom Benutzer wurde geändert. Wenn diese Änderung von jemand anderem gemacht wurde, empfehlen wir die sofortige Zurücksetzung ihres Passworts.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	69	t	PasswordChange	de	ButtonText	Login	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	70	t	InitCode	en	Greeting	Hello {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	71	t	InitCode	en	Subject	Initialize User	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	72	t	InitCode	en	Title	Zitadel - Initialize User	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	73	t	InitCode	en	PreHeader	Initialize User	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	74	t	InitCode	en	Text	This user was created in Zitadel. Use the username {{.PreferredLoginName}} to login. Please click the button below to finish the initialization process. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	75	t	InitCode	en	ButtonText	Finish initialization	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	76	t	PasswordReset	en	Greeting	Hello {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	77	t	PasswordReset	en	Subject	Reset password	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	78	t	PasswordReset	en	Title	Zitadel - Reset password	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	79	t	PasswordReset	en	PreHeader	Reset password	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	80	t	PasswordReset	en	Text	We received a password reset request. Please use the button below to reset your password. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	81	t	PasswordReset	en	ButtonText	Reset password	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	82	t	VerifyEmail	en	Greeting	Hello {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	83	t	VerifyEmail	en	Subject	Verify email	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	84	t	VerifyEmail	en	Title	Zitadel - Verify email	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	85	t	VerifyEmail	en	PreHeader	Verify email	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	86	t	VerifyEmail	en	Text	A new email has been added. Please use the button below to verify your email. (Code {{.Code}}) If you didn't add a new email, please ignore this email.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	87	t	VerifyEmail	en	ButtonText	Verify email	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	88	t	VerifyPhone	en	Greeting	Hello {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	89	t	VerifyPhone	en	Subject	Verify phone	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	90	t	VerifyPhone	en	Title	Zitadel - Verify phone	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	91	t	VerifyPhone	en	PreHeader	Verify phone	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	92	t	VerifyPhone	en	Text	A new phone number has been added. Please use the following code to verify it {{.Code}}.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	93	t	VerifyPhone	en	ButtonText	Verify phone	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	94	t	DomainClaimed	en	Greeting	Hello {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	95	t	DomainClaimed	en	Subject	Domain has been claimed	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	96	t	DomainClaimed	en	Title	Zitadel - Domain has been claimed	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	97	t	DomainClaimed	en	PreHeader	Change email/username	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	98	t	DomainClaimed	en	Text	The domain {{.Domain}} has been claimed by an organization. Your current user {{.UserName}} is not part of this organization. Therefore you'll have to change your email when you login. We have created a temporary username ({{.TempUsername}}) for this login.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	99	t	DomainClaimed	en	ButtonText	Login	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	100	t	PasswordChange	en	Greeting	Hello {{.DisplayName}},	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	101	t	PasswordChange	en	Subject	Password of user has changed	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	102	t	PasswordChange	en	Title	ZITADEL - Password of user has changed	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	103	t	PasswordChange	en	PreHeader	Change password	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	104	t	PasswordChange	en	Text	The password of your user has changed. If this change was not done by you, please be advised to immediately reset your password.	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	105	t	PasswordChange	en	ButtonText	Login	f
\.


--
-- Data for Name: debug_events; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.debug_events (id, creation_date, change_date, resource_owner, instance_id, sequence, blob) FROM stdin;
\.


--
-- Data for Name: device_auth_requests2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.device_auth_requests2 (client_id, device_code, user_code, scopes, audience, creation_date, change_date, sequence, instance_id) FROM stdin;
\.


--
-- Data for Name: domain_policies2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.domain_policies2 (id, creation_date, change_date, sequence, state, user_login_must_be_domain, validate_org_domains, smtp_sender_address_matches_instance_domain, is_default, resource_owner, instance_id, owner_removed) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	14	1	f	f	f	t	338293185505656835	338293185505656835	f
\.


--
-- Data for Name: executions1; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.executions1 (id, creation_date, change_date, sequence, instance_id) FROM stdin;
\.


--
-- Data for Name: executions1_targets; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.executions1_targets (instance_id, execution_id, "position", include, target_id) FROM stdin;
\.


--
-- Data for Name: failed_events; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.failed_events (projection_name, failed_sequence, failure_count, error, instance_id, last_failed) FROM stdin;
\.


--
-- Data for Name: failed_events2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.failed_events2 (projection_name, instance_id, aggregate_type, aggregate_id, event_creation_date, failed_sequence, failure_count, error, last_failed) FROM stdin;
\.


--
-- Data for Name: flow_triggers3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.flow_triggers3 (flow_type, change_date, sequence, trigger_type, resource_owner, instance_id, trigger_sequence, action_id) FROM stdin;
\.


--
-- Data for Name: hosted_login_translations; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.hosted_login_translations (instance_id, creation_date, change_date, aggregate_id, aggregate_type, sequence, locale, file, etag) FROM stdin;
\.


--
-- Data for Name: idp_login_policy_links5; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_login_policy_links5 (idp_id, aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, provider_type, owner_removed) FROM stdin;
\.


--
-- Data for Name: idp_templates6; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6 (id, creation_date, change_date, sequence, resource_owner, instance_id, state, name, owner_type, type, owner_removed, is_creation_allowed, is_linking_allowed, is_auto_creation, is_auto_update, auto_linking) FROM stdin;
\.


--
-- Data for Name: idp_templates6_apple; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_apple (idp_id, instance_id, client_id, team_id, key_id, private_key, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_azure; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_azure (idp_id, instance_id, client_id, client_secret, scopes, tenant, is_email_verified) FROM stdin;
\.


--
-- Data for Name: idp_templates6_github; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_github (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_github_enterprise; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_github_enterprise (idp_id, instance_id, client_id, client_secret, authorization_endpoint, token_endpoint, user_endpoint, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_gitlab; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_gitlab (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_gitlab_self_hosted; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_gitlab_self_hosted (idp_id, instance_id, issuer, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_google; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_google (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_jwt; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_jwt (idp_id, instance_id, issuer, jwt_endpoint, keys_endpoint, header_name) FROM stdin;
\.


--
-- Data for Name: idp_templates6_ldap2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_ldap2 (idp_id, instance_id, servers, start_tls, base_dn, bind_dn, bind_password, user_base, user_object_classes, user_filters, timeout, root_ca, id_attribute, first_name_attribute, last_name_attribute, display_name_attribute, nick_name_attribute, preferred_username_attribute, email_attribute, email_verified, phone_attribute, phone_verified_attribute, preferred_language_attribute, avatar_url_attribute, profile_attribute) FROM stdin;
\.


--
-- Data for Name: idp_templates6_oauth2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_oauth2 (idp_id, instance_id, client_id, client_secret, authorization_endpoint, token_endpoint, user_endpoint, scopes, id_attribute, use_pkce) FROM stdin;
\.


--
-- Data for Name: idp_templates6_oidc; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_oidc (idp_id, instance_id, issuer, client_id, client_secret, scopes, id_token_mapping, use_pkce) FROM stdin;
\.


--
-- Data for Name: idp_templates6_saml; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_templates6_saml (idp_id, instance_id, metadata, key, certificate, binding, with_signed_request, name_id_format, transient_mapping_attribute_name, federated_logout_enabled) FROM stdin;
\.


--
-- Data for Name: idp_user_links3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idp_user_links3 (idp_id, user_id, external_user_id, creation_date, change_date, sequence, resource_owner, instance_id, display_name, owner_removed) FROM stdin;
\.


--
-- Data for Name: idps3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idps3 (id, creation_date, change_date, sequence, resource_owner, instance_id, state, name, styling_type, owner_type, auto_register, type, owner_removed) FROM stdin;
\.


--
-- Data for Name: idps3_jwt_config; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idps3_jwt_config (idp_id, instance_id, issuer, keys_endpoint, header_name, endpoint) FROM stdin;
\.


--
-- Data for Name: idps3_oidc_config; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.idps3_oidc_config (idp_id, instance_id, client_id, client_secret, issuer, scopes, display_name_mapping, username_mapping, authorization_endpoint, token_endpoint) FROM stdin;
\.


--
-- Data for Name: instance_domains; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.instance_domains (instance_id, creation_date, change_date, sequence, domain, is_generated, is_primary) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	33	zitadel-3ar3jm.localhost	t	f
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	33	localhost	f	t
\.


--
-- Data for Name: instance_features2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.instance_features2 (instance_id, key, creation_date, change_date, sequence, value) FROM stdin;
338293185505656835	login_default_org	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	1	true
338293185505656835	login_v2	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	2	{"required": true}
\.


--
-- Data for Name: instance_members4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.instance_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, id) FROM stdin;
2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185506246659	338293185505722371	{IAM_OWNER}	26	338293185505656835	338293185505656835	338293185505656835
2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185506312195	338293185505722371	{IAM_LOGIN_CLIENT}	27	338293185505656835	338293185505656835	338293185505656835
\.


--
-- Data for Name: instance_trusted_domains; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.instance_trusted_domains (instance_id, creation_date, change_date, sequence, domain) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.instances (id, name, change_date, creation_date, default_org_id, iam_project_id, console_client_id, console_app_id, sequence, default_language) FROM stdin;
338293185505656835	ZITADEL	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505722371	338293185505787907	338293186697035779	338293185506050051	29	en
\.


--
-- Data for Name: keys4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.keys4 (id, creation_date, change_date, resource_owner, instance_id, sequence, algorithm, use) FROM stdin;
\.


--
-- Data for Name: keys4_certificate; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.keys4_certificate (id, instance_id, expiry, certificate) FROM stdin;
\.


--
-- Data for Name: keys4_private; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.keys4_private (id, instance_id, expiry, key) FROM stdin;
\.


--
-- Data for Name: keys4_public; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.keys4_public (id, instance_id, expiry, key) FROM stdin;
\.


--
-- Data for Name: label_policies3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.label_policies3 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, hide_login_name_suffix, watermark_disabled, should_error_popup, font_url, light_primary_color, light_warn_color, light_background_color, light_font_color, light_logo_url, light_icon_url, dark_primary_color, dark_warn_color, dark_background_color, dark_font_color, dark_logo_url, dark_icon_url, owner_removed, theme_mode) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	22	3	t	338293185505656835	338293185505656835	f	f	f	\N	#5469d4	#cd3d56	#fafafa	#000000	\N	\N	#2073c4	#ff3b5b	#111827	#ffffff	\N	\N	f	0
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	23	1	t	338293185505656835	338293185505656835	f	f	f	\N	#5469d4	#cd3d56	#fafafa	#000000	\N	\N	#2073c4	#ff3b5b	#111827	#ffffff	\N	\N	f	0
\.


--
-- Data for Name: limits; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.limits (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, audit_log_retention, block) FROM stdin;
\.


--
-- Data for Name: lockout_policies3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.lockout_policies3 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, max_password_attempts, max_otp_attempts, show_failure) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	21	1	t	338293185505656835	338293185505656835	0	0	t
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.locks (locker_id, locked_until, projection_name, instance_id) FROM stdin;
\.


--
-- Data for Name: login_names3_domains; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.login_names3_domains (name, is_primary, resource_owner, instance_id) FROM stdin;
zitadel.localhost	t	338293185505722371	338293185505656835
\.


--
-- Data for Name: login_names3_policies; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.login_names3_policies (must_be_domain, is_default, resource_owner, instance_id) FROM stdin;
f	t	338293185505656835	338293185505656835
\.


--
-- Data for Name: login_names3_users; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.login_names3_users (id, user_name, resource_owner, instance_id) FROM stdin;
338293185506246659	zitadel-admin@zitadel.localhost	338293185505722371	338293185505656835
338293185506312195	login-client	338293185505722371	338293185505656835
338303017977643011	Test	338293185505722371	338293185505656835
\.


--
-- Data for Name: login_policies5; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.login_policies5 (aggregate_id, instance_id, creation_date, change_date, sequence, is_default, allow_register, allow_username_password, allow_external_idps, force_mfa, force_mfa_local_only, second_factors, multi_factors, passwordless_type, hide_password_reset, ignore_unknown_usernames, allow_domain_discovery, disable_login_with_email, disable_login_with_phone, default_redirect_uri, password_check_lifetime, external_login_check_lifetime, mfa_init_skip_lifetime, second_factor_check_lifetime, multi_factor_check_lifetime, owner_removed) FROM stdin;
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	18	t	t	t	t	f	f	{1,2}	{1}	1	f	f	t	f	f		864000000000000	864000000000000	2592000000000000	64800000000000	43200000000000	f
\.


--
-- Data for Name: mail_templates2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.mail_templates2 (aggregate_id, instance_id, creation_date, change_date, sequence, state, is_default, template, owner_removed) FROM stdin;
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	24	1	t	\\x0a3c21646f63747970652068746d6c3e0a3c68746d6c20786d6c6e733d22687474703a2f2f7777772e77332e6f72672f313939392f7868746d6c2220786d6c6e733a763d2275726e3a736368656d61732d6d6963726f736f66742d636f6d3a766d6c2220786d6c6e733a6f3d2275726e3a736368656d61732d6d6963726f736f66742d636f6d3a6f66666963653a6f6666696365223e0a3c686561643e0a20203c7469746c653e0a0a20203c2f7469746c653e0a20203c212d2d5b696620216d736f5d3e3c212d2d3e0a20203c6d65746120687474702d65717569763d22582d55412d436f6d70617469626c652220636f6e74656e743d2249453d65646765223e0a20203c212d2d3c215b656e6469665d2d2d3e0a20203c6d65746120687474702d65717569763d22436f6e74656e742d547970652220636f6e74656e743d22746578742f68746d6c3b20636861727365743d5554462d38223e0a20203c6d657461206e616d653d2276696577706f72742220636f6e74656e743d2277696474683d6465766963652d77696474682c20696e697469616c2d7363616c653d31223e0a20203c7374796c6520747970653d22746578742f637373223e0a20202020236f75746c6f6f6b2061207b2070616464696e673a303b207d0a20202020626f6479207b206d617267696e3a303b70616464696e673a303b2d7765626b69742d746578742d73697a652d61646a7573743a313030253b2d6d732d746578742d73697a652d61646a7573743a313030253b207d0a202020207461626c652c207464207b20626f726465722d636f6c6c617073653a636f6c6c617073653b6d736f2d7461626c652d6c73706163653a3070743b6d736f2d7461626c652d7273706163653a3070743b207d0a20202020696d67207b20626f726465723a303b6865696768743a6175746f3b6c696e652d6865696768743a313030253b206f75746c696e653a6e6f6e653b746578742d6465636f726174696f6e3a6e6f6e653b2d6d732d696e746572706f6c6174696f6e2d6d6f64653a626963756269633b207d0a2020202070207b20646973706c61793a626c6f636b3b6d617267696e3a3133707820303b207d0a20203c2f7374796c653e0a20203c212d2d5b6966206d736f5d3e0a20203c786d6c3e0a202020203c6f3a4f6666696365446f63756d656e7453657474696e67733e0a2020202020203c6f3a416c6c6f77504e472f3e0a2020202020203c6f3a506978656c73506572496e63683e39363c2f6f3a506978656c73506572496e63683e0a202020203c2f6f3a4f6666696365446f63756d656e7453657474696e67733e0a20203c2f786d6c3e0a20203c215b656e6469665d2d2d3e0a20203c212d2d5b6966206c7465206d736f2031315d3e0a20203c7374796c6520747970653d22746578742f637373223e0a202020202e6d6a2d6f75746c6f6f6b2d67726f75702d666978207b2077696474683a313030252021696d706f7274616e743b207d0a20203c2f7374796c653e0a20203c215b656e6469665d2d2d3e0a0a0a20203c7374796c6520747970653d22746578742f637373223e0a20202020406d65646961206f6e6c792073637265656e20616e6420286d696e2d77696474683a343830707829207b0a2020202020202e6d6a2d636f6c756d6e2d7065722d313030207b2077696474683a313030252021696d706f7274616e743b206d61782d77696474683a20313030253b207d0a2020202020202e6d6a2d636f6c756d6e2d7065722d3630207b2077696474683a3630252021696d706f7274616e743b206d61782d77696474683a203630253b207d0a202020207d0a20203c2f7374796c653e0a0a0a20203c7374796c6520747970653d22746578742f637373223e0a0a0a0a20202020406d65646961206f6e6c792073637265656e20616e6420286d61782d77696474683a343830707829207b0a2020202020207461626c652e6d6a2d66756c6c2d77696474682d6d6f62696c65207b2077696474683a20313030252021696d706f7274616e743b207d0a20202020202074642e6d6a2d66756c6c2d77696474682d6d6f62696c65207b2077696474683a206175746f2021696d706f7274616e743b207d0a202020207d0a0a20203c2f7374796c653e0a20203c7374796c6520747970653d22746578742f637373223e2e736861646f772061207b0a20202020626f782d736861646f773a203070782033707820317078202d327078207267626128302c20302c20302c20302e32292c20307078203270782032707820307078207267626128302c20302c20302c20302e3134292c20307078203170782035707820307078207267626128302c20302c20302c20302e3132293b0a20207d3c2f7374796c653e0a0a20207b7b6966202e466f6e7455524c7d7d0a20203c7374796c653e0a2020202040666f6e742d66616365207b0a202020202020666f6e742d66616d696c793a20277b7b2e466f6e744661636546616d696c797d7d273b0a202020202020666f6e742d7374796c653a206e6f726d616c3b0a202020202020666f6e742d646973706c61793a20737761703b0a2020202020207372633a2075726c287b7b2e466f6e7455524c7d7d293b0a202020207d0a20203c2f7374796c653e0a20207b7b656e647d7d0a0a3c2f686561643e0a3c626f6479207374796c653d22776f72642d73706163696e673a6e6f726d616c3b223e0a0a0a3c6469760a20202020202020207374796c653d22220a3e0a0a20203c7461626c650a20202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d226261636b67726f756e643a7b7b2e4261636b67726f756e64436f6c6f727d7d3b6261636b67726f756e642d636f6c6f723a7b7b2e4261636b67726f756e64436f6c6f727d7d3b77696474683a313030253b626f726465722d7261646975733a313670783b220a20203e0a202020203c74626f64793e0a202020203c74723e0a2020202020203c74643e0a0a0a20202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220636c6173733d2222207374796c653d2277696474683a38303070783b222077696474683d2238303022203e3c74723e3c7464207374796c653d226c696e652d6865696768743a3070783b666f6e742d73697a653a3070783b6d736f2d6c696e652d6865696768742d72756c653a65786163746c793b223e3c215b656e6469665d2d2d3e0a0a0a20202020202020203c64697620207374796c653d226d617267696e3a307078206175746f3b626f726465722d7261646975733a313670783b6d61782d77696474683a38303070783b223e0a0a202020202020202020203c7461626c650a202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b626f726465722d7261646975733a313670783b220a202020202020202020203e0a2020202020202020202020203c74626f64793e0a2020202020202020202020203c74723e0a20202020202020202020202020203c74640a202020202020202020202020202020202020202020207374796c653d22646972656374696f6e3a6c74723b666f6e742d73697a653a3070783b70616464696e673a3230707820303b70616464696e672d6c6566743a303b746578742d616c69676e3a63656e7465723b220a20202020202020202020202020203e0a202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520726f6c653d2270726573656e746174696f6e2220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e3c74723e3c746420636c6173733d22222077696474683d22383030707822203e3c215b656e6469665d2d2d3e0a0a202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a202020202020202020202020202020203e0a2020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020203c74643e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220636c6173733d2222207374796c653d2277696474683a38303070783b222077696474683d2238303022203e3c74723e3c7464207374796c653d226c696e652d6865696768743a3070783b666f6e742d73697a653a3070783b6d736f2d6c696e652d6865696768742d72756c653a65786163746c793b223e3c215b656e6469665d2d2d3e0a0a0a202020202020202020202020202020202020202020203c64697620207374796c653d226d617267696e3a307078206175746f3b6d61782d77696474683a38303070783b223e0a0a2020202020202020202020202020202020202020202020203c7461626c650a2020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a2020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020203c74626f64793e0a20202020202020202020202020202020202020202020202020203c74723e0a202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22646972656374696f6e3a6c74723b666f6e742d73697a653a3070783b70616464696e673a303b746578742d616c69676e3a63656e7465723b220a202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520726f6c653d2270726573656e746174696f6e2220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e3c74723e3c746420636c6173733d2222207374796c653d2277696474683a38303070783b22203e3c215b656e6469665d2d2d3e0a0a2020202020202020202020202020202020202020202020202020202020203c6469760a2020202020202020202020202020202020202020202020202020202020202020202020202020636c6173733d226d6a2d636f6c756d6e2d7065722d313030206d6a2d6f75746c6f6f6b2d67726f75702d66697822207374796c653d22666f6e742d73697a653a303b6c696e652d6865696768743a303b746578742d616c69676e3a6c6566743b646973706c61793a696e6c696e652d626c6f636b3b77696474683a313030253b646972656374696f6e3a6c74723b220a2020202020202020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22203e3c74723e3c7464207374796c653d22766572746963616c2d616c69676e3a746f703b77696474683a38303070783b22203e3c215b656e6469665d2d2d3e0a0a20202020202020202020202020202020202020202020202020202020202020203c6469760a20202020202020202020202020202020202020202020202020202020202020202020202020202020636c6173733d226d6a2d636f6c756d6e2d7065722d313030206d6a2d6f75746c6f6f6b2d67726f75702d66697822207374796c653d22666f6e742d73697a653a3070783b746578742d616c69676e3a6c6566743b646972656374696f6e3a6c74723b646973706c61793a696e6c696e652d626c6f636b3b766572746963616c2d616c69676e3a746f703b77696474683a313030253b220a20202020202020202020202020202020202020202020202020202020202020203e0a0a202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e222077696474683d2231303025220a202020202020202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020203c746420207374796c653d22766572746963616c2d616c69676e3a746f703b70616464696e673a303b223e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b6966202e4c6f676f55524c7d7d0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22222077696474683d2231303025220a202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a353070782030203330707820303b776f72642d627265616b3a627265616b2d776f72643b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22626f726465722d636f6c6c617073653a636f6c6c617073653b626f726465722d73706163696e673a3070783b220a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c746420207374796c653d2277696474683a31383070783b223e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c696d670a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743d226175746f22207372633d227b7b2e4c6f676f55524c7d7d22207374796c653d22626f726465723a303b626f726465722d7261646975733a3870783b646973706c61793a626c6f636b3b6f75746c696e653a6e6f6e653b746578742d6465636f726174696f6e3a6e6f6e653b6865696768743a6175746f3b77696474683a313030253b666f6e742d73697a653a313370783b222077696474683d22313830220a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202f3e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b656e647d7d0a20202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a20202020202020202020202020202020202020202020202020202020202020203c2f6469763e0a0a20202020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a2020202020202020202020202020202020202020202020202020202020203c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a202020202020202020202020202020202020202020202020202020203c2f74643e0a20202020202020202020202020202020202020202020202020203c2f74723e0a20202020202020202020202020202020202020202020202020203c2f74626f64793e0a2020202020202020202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020202020202020203c2f6469763e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a20202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c74723e3c746420636c6173733d22222077696474683d22383030707822203e3c215b656e6469665d2d2d3e0a0a202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a202020202020202020202020202020203e0a2020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020203c74643e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220636c6173733d2222207374796c653d2277696474683a38303070783b222077696474683d2238303022203e3c74723e3c7464207374796c653d226c696e652d6865696768743a3070783b666f6e742d73697a653a3070783b6d736f2d6c696e652d6865696768742d72756c653a65786163746c793b223e3c215b656e6469665d2d2d3e0a0a0a202020202020202020202020202020202020202020203c64697620207374796c653d226d617267696e3a307078206175746f3b6d61782d77696474683a38303070783b223e0a0a2020202020202020202020202020202020202020202020203c7461626c650a2020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a2020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020203c74626f64793e0a20202020202020202020202020202020202020202020202020203c74723e0a202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22646972656374696f6e3a6c74723b666f6e742d73697a653a3070783b70616464696e673a303b746578742d616c69676e3a63656e7465723b220a202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520726f6c653d2270726573656e746174696f6e2220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e3c74723e3c746420636c6173733d2222207374796c653d22766572746963616c2d616c69676e3a746f703b77696474683a34383070783b22203e3c215b656e6469665d2d2d3e0a0a2020202020202020202020202020202020202020202020202020202020203c6469760a2020202020202020202020202020202020202020202020202020202020202020202020202020636c6173733d226d6a2d636f6c756d6e2d7065722d3630206d6a2d6f75746c6f6f6b2d67726f75702d66697822207374796c653d22666f6e742d73697a653a3070783b746578742d616c69676e3a6c6566743b646972656374696f6e3a6c74723b646973706c61793a696e6c696e652d626c6f636b3b766572746963616c2d616c69676e3a746f703b77696474683a313030253b220a2020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020203c7461626c650a20202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e222077696474683d2231303025220a20202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020203c746420207374796c653d22766572746963616c2d616c69676e3a746f703b70616464696e673a303b223e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22222077696474683d2231303025220a20202020202020202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c6469760a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a323470783b666f6e742d7765696768743a3530303b6c696e652d6865696768743a313b746578742d616c69676e3a63656e7465723b636f6c6f723a7b7b2e466f6e74436f6c6f727d7d3b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e7b7b2e4772656574696e677d7d3c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c6469760a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a313670783b666f6e742d7765696768743a6c696768743b6c696e652d6865696768743a312e353b746578742d616c69676e3a63656e7465723b636f6c6f723a7b7b2e466f6e74436f6c6f727d7d3b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e7b7b2e546578747d7d3c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220766572746963616c2d616c69676e3d226d6964646c652220636c6173733d22736861646f7722207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22626f726465722d636f6c6c617073653a73657061726174653b6c696e652d6865696768743a313030253b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222206267636f6c6f723d227b7b2e5072696d617279436f6c6f727d7d2220726f6c653d2270726573656e746174696f6e22207374796c653d22626f726465723a6e6f6e653b626f726465722d7261646975733a3670783b637572736f723a6175746f3b6d736f2d70616464696e672d616c743a3130707820323570783b6261636b67726f756e643a7b7b2e5072696d617279436f6c6f727d7d3b222076616c69676e3d226d6964646c65220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c610a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020687265663d227b7b2e55524c7d7d222072656c3d226e6f6f70656e6572206e6f7265666572726572206e6f747261636b22207374796c653d22646973706c61793a696e6c696e652d626c6f636b3b6261636b67726f756e643a7b7b2e5072696d617279436f6c6f727d7d3b636f6c6f723a236666666666663b666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a313470783b666f6e742d7765696768743a3530303b6c696e652d6865696768743a313230253b6d617267696e3a303b746578742d6465636f726174696f6e3a6e6f6e653b746578742d7472616e73666f726d3a6e6f6e653b70616464696e673a3130707820323570783b6d736f2d70616464696e672d616c743a3070783b626f726465722d7261646975733a3670783b22207461726765743d225f626c616e6b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b2e427574746f6e546578747d7d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f613e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b6966202e496e636c756465466f6f7465727d7d0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b70616464696e672d746f703a323070783b70616464696e672d72696768743a323070783b70616464696e672d626f74746f6d3a323070783b70616464696e672d6c6566743a323070783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c700a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22626f726465722d746f703a736f6c69642032707820236462646264623b666f6e742d73697a653a3170783b6d617267696e3a307078206175746f3b77696474683a313030253b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f703e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d223022207374796c653d22626f726465722d746f703a736f6c69642032707820236462646264623b666f6e742d73697a653a3170783b6d617267696e3a307078206175746f3b77696474683a34343070783b2220726f6c653d2270726573656e746174696f6e222077696474683d22343430707822203e3c74723e3c7464207374796c653d226865696768743a303b6c696e652d6865696768743a303b223e20266e6273703b0a20202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a313670783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c6469760a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a313370783b6c696e652d6865696768743a313b746578742d616c69676e3a63656e7465723b636f6c6f723a7b7b2e466f6e74436f6c6f727d7d3b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e7b7b2e466f6f746572546578747d7d3c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b656e647d7d0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a20202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a2020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a20202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a2020202020202020202020202020202020202020202020202020202020203c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a202020202020202020202020202020202020202020202020202020203c2f74643e0a20202020202020202020202020202020202020202020202020203c2f74723e0a20202020202020202020202020202020202020202020202020203c2f74626f64793e0a2020202020202020202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020202020202020203c2f6469763e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a20202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a20202020202020202020202020203c2f74643e0a2020202020202020202020203c2f74723e0a2020202020202020202020203c2f74626f64793e0a202020202020202020203c2f7461626c653e0a0a20202020202020203c2f6469763e0a0a0a20202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a2020202020203c2f74643e0a202020203c2f74723e0a202020203c2f74626f64793e0a20203c2f7461626c653e0a0a3c2f6469763e0a0a3c2f626f64793e0a3c2f68746d6c3e0a	f
\.


--
-- Data for Name: message_texts2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.message_texts2 (aggregate_id, instance_id, creation_date, change_date, sequence, state, type, language, title, pre_header, subject, greeting, text, button_text, footer_text, owner_removed) FROM stdin;
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	39	1	InitCode	de	Zitadel - User initialisieren	User initialisieren	User initialisieren	Hallo {{.DisplayName}},	Dieser Benutzer wurde soeben im Zitadel erstellt. Mit dem Benutzernamen <br><strong>{{.PreferredLoginName}}</strong><br> kannst du dich anmelden. Nutze den untenstehenden Button, um die Initialisierung abzuschliessen <br>(Code <strong>{{.Code}}</strong>).<br> Falls du dieses Mail nicht angefordert hast, kannst du es einfach ignorieren.	Initialisierung abschliessen	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	45	1	PasswordReset	de	Zitadel - Passwort zurücksetzen	Passwort zurücksetzen	Passwort zurücksetzen	Hallo {{.DisplayName}},	Wir haben eine Anfrage für das Zurücksetzen deines Passwortes bekommen. Du kannst den untenstehenden Button verwenden, um dein Passwort zurückzusetzen <br>(Code <strong>{{.Code}}</strong>).<br> Falls du dieses Mail nicht angefordert hast, kannst du es ignorieren.	Passwort zurücksetzen	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	51	1	VerifyEmail	de	Zitadel - Email verifizieren	Email verifizieren	Email verifizieren	Hallo {{.DisplayName}},	Eine neue E-Mail Adresse wurde hinzugefügt. Bitte verwende den untenstehenden Button um diese zu verifizieren <br>(Code <strong>{{.Code}}</strong>).<br> Falls du deine E-Mail Adresse nicht selber hinzugefügt hast, kannst du dieses E-Mail ignorieren.	Email verifizieren	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	57	1	VerifyPhone	de	Zitadel - Telefonnummer verifizieren	Telefonnummer verifizieren	Telefonnummer verifizieren	Hallo {{.DisplayName}},	Eine Telefonnummer wurde hinzugefügt. Bitte verifiziere diese in dem du folgenden Code eingibst (Code {{.Code}})	Telefon verifizieren	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	63	1	DomainClaimed	de	Zitadel - Domain wurde beansprucht	Email / Username ändern	Domain wurde beansprucht	Hallo {{.DisplayName}},	Die Domain {{.Domain}} wurde von einer Organisation beansprucht. Dein derzeitiger User {{.Username}} ist nicht Teil dieser Organisation. Daher musst du beim nächsten Login eine neue Email hinterlegen. Für diesen Login haben wir dir einen temporären Usernamen ({{.TempUsername}}) erstellt.	Login	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	69	1	PasswordChange	de	ZITADEL - Passwort von Benutzer wurde geändert	Passwort Änderung	Passwort von Benutzer wurde geändert	Hallo {{.DisplayName}},	Das Password vom Benutzer wurde geändert. Wenn diese Änderung von jemand anderem gemacht wurde, empfehlen wir die sofortige Zurücksetzung ihres Passworts.	Login	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	75	1	InitCode	en	Zitadel - Initialize User	Initialize User	Initialize User	Hello {{.DisplayName}},	This user was created in Zitadel. Use the username {{.PreferredLoginName}} to login. Please click the button below to finish the initialization process. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	Finish initialization	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	81	1	PasswordReset	en	Zitadel - Reset password	Reset password	Reset password	Hello {{.DisplayName}},	We received a password reset request. Please use the button below to reset your password. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	Reset password	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	87	1	VerifyEmail	en	Zitadel - Verify email	Verify email	Verify email	Hello {{.DisplayName}},	A new email has been added. Please use the button below to verify your email. (Code {{.Code}}) If you didn't add a new email, please ignore this email.	Verify email	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	93	1	VerifyPhone	en	Zitadel - Verify phone	Verify phone	Verify phone	Hello {{.DisplayName}},	A new phone number has been added. Please use the following code to verify it {{.Code}}.	Verify phone	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	99	1	DomainClaimed	en	Zitadel - Domain has been claimed	Change email/username	Domain has been claimed	Hello {{.DisplayName}},	The domain {{.Domain}} has been claimed by an organization. Your current user {{.UserName}} is not part of this organization. Therefore you'll have to change your email when you login. We have created a temporary username ({{.TempUsername}}) for this login.	Login	\N	f
338293185505656835	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	105	1	PasswordChange	en	ZITADEL - Password of user has changed	Change password	Password of user has changed	Hello {{.DisplayName}},	The password of your user has changed. If this change was not done by you, please be advised to immediately reset your password.	Login	\N	f
\.


--
-- Data for Name: milestones3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.milestones3 (instance_id, type, reached_date, last_pushed_date) FROM stdin;
338293185505656835	1	2025-09-17 18:40:52.502632+00	\N
338293185505656835	2	2025-09-17 18:41:24.761443+00	\N
338293185505656835	3	2025-09-17 18:41:45.226613+00	\N
338293185505656835	4	2025-09-17 18:43:31.033346+00	\N
338293185505656835	5	2025-09-17 20:45:19.539767+00	\N
\.


--
-- Data for Name: notification_policies; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.notification_policies (id, creation_date, change_date, resource_owner, instance_id, sequence, state, is_default, password_change, owner_removed) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505656835	338293185505656835	20	1	t	t	f
\.


--
-- Data for Name: notification_providers; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.notification_providers (aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, state, provider_type, compact) FROM stdin;
\.


--
-- Data for Name: oidc_settings2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.oidc_settings2 (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, access_token_lifetime, id_token_lifetime, refresh_token_idle_expiration, refresh_token_expiration) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505656835	338293185505656835	106	43200000000000	43200000000000	2592000000000000	7776000000000000
\.


--
-- Data for Name: org_domains2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.org_domains2 (org_id, instance_id, creation_date, change_date, sequence, domain, is_verified, is_primary, validation_type, owner_removed) FROM stdin;
338293185505722371	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	4	zitadel.localhost	t	t	0	f
\.


--
-- Data for Name: org_members4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.org_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, org_id) FROM stdin;
2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185506246659	338293185505722371	{ORG_OWNER}	5	338293185505722371	338293185505656835	338293185505722371
\.


--
-- Data for Name: org_metadata2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.org_metadata2 (org_id, creation_date, change_date, sequence, resource_owner, instance_id, key, value, owner_removed) FROM stdin;
\.


--
-- Data for Name: orgs1; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.orgs1 (id, creation_date, change_date, resource_owner, instance_id, org_state, sequence, name, primary_domain) FROM stdin;
338293185505722371	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	338293185505722371	338293185505656835	1	4	ZITADEL	zitadel.localhost
\.


--
-- Data for Name: password_age_policies2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.password_age_policies2 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, expire_warn_days, max_age_days, owner_removed) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	13	1	t	338293185505656835	338293185505656835	0	0	f
\.


--
-- Data for Name: password_complexity_policies2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.password_complexity_policies2 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, min_length, has_lowercase, has_uppercase, has_symbol, has_number, owner_removed) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	12	1	t	338293185505656835	338293185505656835	8	t	t	t	t	f
\.


--
-- Data for Name: personal_access_tokens3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.personal_access_tokens3 (id, creation_date, change_date, sequence, resource_owner, instance_id, user_id, expiration, scopes, owner_removed) FROM stdin;
338293185506377731	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	2	338293185505722371	338293185505656835	338293185506312195	2029-01-01 00:00:00+00	\N	f
\.


--
-- Data for Name: privacy_policies4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.privacy_policies4 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, privacy_link, tos_link, help_link, support_email, docs_link, custom_link, custom_link_text, owner_removed) FROM stdin;
338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	19	1	t	338293185505656835	338293185505656835					https://zitadel.com/docs			f
\.


--
-- Data for Name: project_grant_members4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.project_grant_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, project_id, grant_id, granted_org) FROM stdin;
\.


--
-- Data for Name: project_grants4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.project_grants4 (grant_id, creation_date, change_date, sequence, state, resource_owner, instance_id, project_id, granted_org_id, granted_role_keys) FROM stdin;
\.


--
-- Data for Name: project_members4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.project_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, project_id) FROM stdin;
\.


--
-- Data for Name: project_roles4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.project_roles4 (project_id, role_key, creation_date, change_date, sequence, resource_owner, instance_id, display_name, group_name) FROM stdin;
\.


--
-- Data for Name: projects4; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.projects4 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, name, project_role_assertion, project_role_check, has_project_check, private_labeling_setting) FROM stdin;
338293185505787907	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	1	1	338293185505722371	338293185505656835	ZITADEL	f	f	f	0
338293275599306755	2025-09-17 18:41:45.226613+00	2025-09-17 18:41:45.226613+00	1	1	338293185505722371	338293185505656835	modul_223	f	f	f	0
\.


--
-- Data for Name: quotas; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.quotas (id, instance_id, unit, amount, from_anchor, "interval", limit_usage) FROM stdin;
\.


--
-- Data for Name: quotas_notifications; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.quotas_notifications (instance_id, unit, id, call_url, percent, repeat, latest_due_period_start, next_due_threshold) FROM stdin;
\.


--
-- Data for Name: quotas_periods; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.quotas_periods (instance_id, unit, start, usage) FROM stdin;
\.


--
-- Data for Name: resource_counts; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.resource_counts (id, instance_id, table_name, parent_type, parent_id, resource_name, updated_at, amount) FROM stdin;
1	338293185505656835	projections.orgs1	instance	338293185505656835	organization	2025-09-17 18:40:53.098086+00	1
3	338293185505656835	projections.password_complexity_policies2	instance	338293185505656835	password_complexity_policy	2025-09-17 18:40:53.122197+00	1
4	338293185505656835	projections.password_age_policies2	instance	338293185505656835	password_expiry_policy	2025-09-17 18:40:53.12621+00	1
5	338293185505656835	projections.lockout_policies3	instance	338293185505656835	lockout_policy	2025-09-17 18:40:53.130763+00	1
6	338293185505656835	projections.login_policies5	instance	338293185505656835	login_policy	2025-09-17 18:40:53.166749+00	1
9	338293185505656835	projections.instance_members4	instance	338293185505656835	iam_admin	2025-09-17 18:40:53.25343+00	2
2	338293185505656835	projections.projects4	organization	338293185505722371	project	2025-09-17 18:41:45.232926+00	2
7	338293185505656835	projections.users14	organization	338293185505722371	user	2025-09-17 20:18:32.843508+00	3
\.


--
-- Data for Name: restrictions2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.restrictions2 (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, disallow_public_org_registration, allowed_languages) FROM stdin;
\.


--
-- Data for Name: saml_requests; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.saml_requests (id, creation_date, change_date, sequence, resource_owner, instance_id, login_client, issuer, acs, relay_state, binding) FROM stdin;
\.


--
-- Data for Name: secret_generators2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.secret_generators2 (generator_type, aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, length, expiry, include_lower_letters, include_upper_letters, include_digits, include_symbols) FROM stdin;
7	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	3	338293185505656835	338293185505656835	64	0	t	t	t	f
1	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	4	338293185505656835	338293185505656835	6	259200000000000	f	t	t	f
2	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	5	338293185505656835	338293185505656835	6	3600000000000	f	t	t	f
3	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	6	338293185505656835	338293185505656835	6	3600000000000	f	t	t	f
5	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	7	338293185505656835	338293185505656835	6	3600000000000	f	t	t	f
6	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	8	338293185505656835	338293185505656835	12	3600000000000	t	t	t	f
4	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	9	338293185505656835	338293185505656835	32	0	t	t	t	f
8	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	10	338293185505656835	338293185505656835	8	300000000000	f	f	t	f
9	338293185505656835	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	11	338293185505656835	338293185505656835	8	300000000000	f	f	t	f
\.


--
-- Data for Name: security_policies2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.security_policies2 (creation_date, change_date, instance_id, sequence, enable_iframe_embedding, origins, enable_impersonation) FROM stdin;
\.


--
-- Data for Name: sessions8; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.sessions8 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, creator, user_id, user_resource_owner, user_checked_at, password_checked_at, intent_checked_at, webauthn_checked_at, webauthn_user_verified, totp_checked_at, otp_sms_checked_at, otp_email_checked_at, metadata, token_id, user_agent_fingerprint_id, user_agent_ip, user_agent_description, user_agent_header, expiration) FROM stdin;
338293226257514499	2025-09-17 18:41:15.819256+00	2025-09-17 18:41:21.917903+00	7	1	338293185505656835	338293185505656835	338293185506312195	338293185506246659	338293185505722371	2025-09-17 18:41:15.819191+00	2025-09-17 18:41:21.917835+00	\N	\N	\N	\N	\N	\N	\N	338293236491616259	5eeb504c-e0c9-461f-bcbb-8f7d307721e9	192.168.65.1	Firefox, 142.0, ,    , Gecko, 142.0, , Linux, x86_64, 	{"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0"]}	2025-09-27 18:41:21.917903+00
338305782527295491	2025-09-17 20:45:59.940174+00	2025-09-17 20:46:26.122538+00	10	1	338293185505656835	338293185505656835	338293185506312195	338303017977643011	338293185505722371	2025-09-17 20:45:59.940076+00	2025-09-17 20:46:26.122473+00	\N	\N	\N	\N	\N	\N	\N	338305826466824195	583c0a22-5a2c-42a3-9968-393e3a841f55	192.168.65.1	Firefox, 143.0, ,    , Gecko, 143.0, , Linux, x86_64, 	{"user-agent": ["Mozilla/5.0 (X11; Linux x86_64; rv:143.0) Gecko/20100101 Firefox/143.0"]}	2025-09-27 20:46:26.122538+00
\.


--
-- Data for Name: sms_configs3; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.sms_configs3 (id, aggregate_id, creation_date, change_date, sequence, state, resource_owner, instance_id, description) FROM stdin;
\.


--
-- Data for Name: sms_configs3_http; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.sms_configs3_http (sms_id, instance_id, endpoint) FROM stdin;
\.


--
-- Data for Name: sms_configs3_twilio; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.sms_configs3_twilio (sms_id, instance_id, sid, sender_number, token, verify_service_sid) FROM stdin;
\.


--
-- Data for Name: smtp_configs5; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.smtp_configs5 (id, aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, description, state) FROM stdin;
\.


--
-- Data for Name: smtp_configs5_http; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.smtp_configs5_http (id, instance_id, endpoint) FROM stdin;
\.


--
-- Data for Name: smtp_configs5_smtp; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.smtp_configs5_smtp (id, instance_id, tls, sender_address, sender_name, reply_to_address, host, username, password) FROM stdin;
\.


--
-- Data for Name: system_features; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.system_features (key, creation_date, change_date, sequence, value) FROM stdin;
\.


--
-- Data for Name: targets2; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.targets2 (id, creation_date, change_date, resource_owner, instance_id, target_type, sequence, name, endpoint, timeout, interrupt_on_error, signing_key) FROM stdin;
\.


--
-- Data for Name: user_auth_methods5; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.user_auth_methods5 (user_id, method_type, token_id, creation_date, change_date, sequence, state, resource_owner, instance_id, name, domain) FROM stdin;
\.


--
-- Data for Name: user_grants5; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.user_grants5 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, user_id, resource_owner_user, project_id, resource_owner_project, grant_id, granted_org, roles) FROM stdin;
338303078325288963	2025-09-17 20:19:08.104219+00	2025-09-17 20:19:08.104219+00	1	1	338293185505722371	338293185505656835	338303017977643011	338293185505722371	338293275599306755	338293185505722371			\N
\.


--
-- Data for Name: user_metadata5; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.user_metadata5 (user_id, creation_date, change_date, sequence, resource_owner, instance_id, key, value) FROM stdin;
\.


--
-- Data for Name: user_schemas1; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.user_schemas1 (id, creation_date, change_date, sequence, state, instance_id, type, revision, schema, possible_authenticators) FROM stdin;
\.


--
-- Data for Name: users14; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.users14 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, username, type) FROM stdin;
338293185506246659	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	2	1	338293185505722371	338293185505656835	zitadel-admin@zitadel.localhost	1
338293185506312195	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	1	1	338293185505722371	338293185505656835	login-client	2
338303017977643011	2025-09-17 20:18:32.828518+00	2025-09-17 20:18:32.828518+00	2	1	338293185505722371	338293185505656835	Test	1
\.


--
-- Data for Name: users14_humans; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.users14_humans (user_id, instance_id, first_name, last_name, nick_name, display_name, preferred_language, gender, avatar_key, email, is_email_verified, phone, is_phone_verified, password_change_required, password_changed, mfa_init_skipped) FROM stdin;
338293185506246659	338293185505656835	ZITADEL	Admin	\N	ZITADEL Admin	en	\N	\N	zitadel-admin@zitadel.localhost	t	\N	\N	f	2025-09-17 18:40:52.502632+00	2025-09-17 18:41:24.208211+00
338303017977643011	338293185505656835	given_test_name	family_name_test	tester	given_test_name family_name_test	\N	\N	\N	test@example.com	t	\N	\N	f	2025-09-17 20:46:25.16009+00	2025-09-17 20:46:27.721909+00
\.


--
-- Data for Name: users14_machines; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.users14_machines (user_id, instance_id, name, description, secret, access_token_type) FROM stdin;
338293185506312195	338293185505656835	Automatically Initialized IAM_LOGIN_CLIENT	\N	\N	0
\.


--
-- Data for Name: users14_notifications; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.users14_notifications (user_id, instance_id, last_email, verified_email, last_phone, verified_phone, password_set) FROM stdin;
338293185506246659	338293185505656835	zitadel-admin@zitadel.localhost	zitadel-admin@zitadel.localhost	\N	\N	t
338303017977643011	338293185505656835	test@example.com	test@example.com	\N	\N	t
\.


--
-- Data for Name: web_keys1; Type: TABLE DATA; Schema: projections; Owner: -
--

COPY projections.web_keys1 (instance_id, key_id, creation_date, change_date, sequence, state, private_key, public_key, config, config_type) FROM stdin;
338293185505656835	338293186697101315	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	2	2	{"KeyID": "oidcKey", "Crypted": "1GQyw0O6Iz1/7uSx4B7lfiGI00Y+0vOc8znF7Ip+rjrRsGspGi0bp/IeHmuRoWnZnLHNhTXAPXBC+B6HcJa8rcQuDfJdWc5ic9QjgPyDpruWMO5s/oyzPTT4BNUkwzt66mjKizQgXOIUSvJ3M4u6cqkClPyDMcLruk0AsitU6h1ugOCHC2y+9vx9sDHiPwPJPSUm6FBs92q9XPyS0ynPid8kLKmkdEhnPS4KOYrtiowvDo5lukJWWscCu+ahr0CXXOUzl3sJh9j8VmIfH30XW7LSsLGdgIlrq0QvGJ3CeUVmZabr4z/onkE8aHlHuqqWVzwDuHyMKKobETy4maCfqU/HpuMM2FZolOHZDJPYleOL5dhpUAyhmruVIWx//oE2H0v14oTOfNsCVn0EzhBPp0MSBliPyUwlE8sojtO3HPODmiOE3dkn8xP15X9qjwkjOUIk7EXW5t9yCzJWUSXnjJ9+6dzTaXQcbbUNPEmVVkyj1FxOboBJFDdnyOUtzX5rhdvgB54HowV+eprfmq62LXmzIRx3hFuUAVwZve5ibBInPKzp9CVTIm/UXh1YARA3TLAuEqlqciFkkQucHFnZjgdlU8hpI8MZtz3j/Z562bpoqPNkop20HV63uibw0VdzNsslgyLjgfhuaq7vfAZcY4Bi5YraX+dP5VVrsu0VUa6mGh7ghXncmLr2g8BvEU2yaXYLpdr9/2Bb6OqcBnhMn35NWNy7DfGyTKLUmz3xxspZfopShqWJICuIZzgb+Ag6hzRuhMwMaDl4CrbErWvZbclCiRmUnnJQ7pcSaz4mbd4qNDm1kdUYBPwH+KJ+XWeUP3aXnxQww7UhqeAk81i1G0XrgEaFED1Yc2/BWl/LO+6b4b9ERfYKv3pBU7YyovQGAAO55ESohGDZ6W/G8xU2hzSE8tOydDvICGftWpv0RzKC4XMvSK5kCJXPPqB28O/6YLnsaJ/HdHBnAUydbG4eoNMaxGGsEqohDXa6Z2HMo4cZCJ+DeDFeQQqy/PD8/3wvppbE8xk0nPYB+oeh9X2LvroYLe0rODN4fiac6dItmogknQfhNUxmnEw+d6abt44ei6sgZPSk/jjUJ+TI6n1ScqLe55XJwLYh2MCgPWPd4qdh6w7deWYyZ7YI9I/5IjF7IPWlbNtspDb0qJHhtrwKkxWPGrUeGUQSITQ/YUiIEv0MZnDPddNFyVvZOUHrDXvxDqIUHiWNuyL9oee3G+PpEamcR5YRIXBhJHpBfDQhfNCmG1C2ZjvnPXugaKYOzDr8dOSgmvKGrbQdl6tIzbf/CWlEKzq/KDv26kApGoiErctZjKOjcHVFICe9nBxKs+kPI7zdyXjbZUf6sw5rIZXoZKujuyEivLvBBVqS8KXjy9bHrnwrLwTq6K0cdErG2F6yZ2k5vA0eTwrjzKlgjgpk3VTXmeYbzc0sbriPt0Gof3kUKiu1EZunMiyQkACn3JxTgNiAghWwMis4ShFp2XVJnYS9qJ5DYrEZf84e9px7Bzne5yIz2COTGwA+gRcyuEhSjTTyFNq0JXe5DWvav1Rn6WZ1SEjlF57YhC0sOASFHtCkjbzhrgZ4XCQu/ql07Lj1Eoxvhv201G4rZ35NsLCgFj4tRRUJBvg2+kIrpf6j4LoS4HuP7+63/WRhqmj4SKhv1AHhr+o6zqTX2Z52u2NCjVEcPNhnWgtqAbPhCQJm1iwOZnmVpbIkZ2haEcb4B3eRz9tqPW2pKSzW8EjhOLAZ8FRKLcbdpIKXKDZ/wdWsyRSacT5fRtuyG/LXvsExkKV6CVsi0swlAfy5UvHfWJfMT6pSAoexemsjHFsJ+CutJHCv0b+GbwN1Jc/2uIYlI4jaKJmdrsDSyV7d4R24X431c3p3S/WzXNTe0VjDSxyMfeniHS3E7+ePfYT+DK60yg1S6ggFkVxrDL/kr5gR1P/qgn7cz4WwflsVSHq19zHx3whvJckfbT6Hag6EAlBTTUcra7wZH0uQeEXrpAfwFnEsFSipT50hVWAxgs6jnoUNkcpFW5INa1M2jgriABFNbzm0mCeHKSKTaCahPqfHZvKrNkEMsLc2CvY0uuKMTniGQeNMY9CHjpvbTZxZ+hehHk7NzJjWBnFrsmkZxTs7b7TQCSsf4kUbJLH5VuVw27NffCLNshlkA2o9JdkbW8sg23HKLjQBDr4VCvOoB4yu14JUDmlb7H8gpKyftorbM+T0W69V/pDn1aeDjLL3A7zF0pT38+iHZA==", "Algorithm": "aes", "CryptoType": 0}	{"e": "AQAB", "n": "ucX6OC29cEIF-jKtPPJ2VVq4jxqtVhRoigLoOWX7P7KA6L1fCiY4e2SYRHJ4bXawQozVP_ikGm9_-mJdj4cuRtCDqLwCTZknO5eW1shBdo6jPmbBNTbrSdJYgA0_l5OFDd6ixYMPxLh8yjs3w6tFVy1OsGa6iN2wjX5mEfruyVqzYDWK6aEDLUYcLYHzAvc3E8jrJbXy19tNF2JkrBY8G16TDRTZ9TOk24Id7MWkL9RNvFACTq1d7ti1uhe8WH6iP9sR3hlzREUJIe-TnnyOMdsKgegZFP3cUy7C6XLRdUFvvZqbcMX2iX5Hfj51mfdiqiPkHGxmQiy3OBHxMaWE_Q", "alg": "RS256", "kid": "338293186697101315", "kty": "RSA", "use": "sig"}	{"Bits": "2048", "Hasher": "SHA256"}	1
338293185505656835	338293186797502467	2025-09-17 18:40:52.502632+00	2025-09-17 18:40:52.502632+00	1	1	{"KeyID": "oidcKey", "Crypted": "9iwnQsZFYbLlFqnhmzzUC/EYYwkGdEjS6L2KJtrewTV32oxd3CgBTqsN1+epf7ORDkWsnbK4TquySyWgnLJ89HpATkYnwy+rFFjNdBN576uZcbbiaXQFvUubkm2y2MJAAlB+FxR87LmE04wBK3ItF+ht/ma3yme1dwZFzCo8CT1V2Yt+mAyyP3QWujByvWfZtg5RqA1Wjh86vT4ABWLv50d/tfffZDX8dOguzB48mHUZELdd2gaUIfGFLgL26R7hRelLtUEMj1+zPehtMN8wl5eUZVQB0XObYIMKjHPeM1az173OFF81BlTLuGBEIQeJsl/AkyMgMGZNNF9t4fQ8B/RhIqlIlfdyOHKpiDNO0lUEPBlMAGRUULHHQk6nOdwu30CA/KasQIJUFN9qEb0bMxn40Zwh8folJfCwoJwq77AMFGp4KRUhSUO8vV3yYCgVbNX9cXDjTgMUS0juLl8DDPS0ku80rQV4HGMNDW6jbJPxMiYJxsaAH8PatlMZa08AboP8FumLFOaJd5JLNP9O8+ZP3k+XTrATyXdFRn5o5VnrKZjAm3LxkghSWfjHmav8SBiM+1UNTT1kx1Pl4ISnbno8+d/E8UXvbFDmNEamoiOljPUMcJIx2/CnrobqdqlrrVxnBPtS8/QAtzgLB1Yr4PmjdS721zD4PHrv0sXcnWUibd7wojzD4Lefq17yjPO0rt1ZMPNnZCxlDlSGipt58jgJflxaI1bXrLVpQOQcwUWa6UoqHSSy3baWn7+boihwR0TIX5NpNIFOrvcjq8QuQpdtYeewld2E5jzESrbZKaOQJ1OYd2ts8b3qNfXCue/S3vFPLfx5GfPoeTipf1e69PQmAIXp/hdRhxdwGf47w/9cedJ1JTnB3kdwGRZ78Cr7Qz5MfJ5ohww3ml1BzWduZ5pzvRb3jwh2ykhbN9f0VBL8Aq8jdKo/Cyn+nSFiKW6Nd5sAFb6+0LuVZOl5vyWjOYCf6C+iZoXhCqbiVEye06QcO9WGSsxaQGzyycpuz6gW8Gd80QyTcmq13jRJzyTLsoLbidwA8WUKwLLn9qEgA7Xq16qLaVpxwLM6WARGHnPfAVSTynwwLZ/VsbaexxFLF5URZXilhiyCN09ItJP5GXOdqQ+yDWlQMgIHVD4bxWAA/B0WDNdsO0axYNhZx8rs0s+tClAvAWqY3jQUwZP7HQMrNdkw2c/MNpkF167tj+R5SL7yK80bnCDc/SLoQWITYFT2norREbli3z0v5YxDSe7nv9/6ca+uoOvXUlzyoVAFU6W6nZHlxxUuTT6YKW90xUJ5dGAdOh8YJNOiHfTO9e5PjA6RxTOxXVQ8tlGrKBYkfGmavYg1CZ7z+8DxRBAgIBXWvlS4xu2/GW9HYV2/o7Di3knIZpW0T5hK4/OQUDM67dYo1MHfeL5bf6E/xUxoC+IY0TZqnO1TKn/I24BVa8RhIFlkRVWYVXUoVJM3fdZNYbav05Cl3WtBl/DX7kpv6PLOAaViwDW11qBEsURmo4Oh6vaNDzLBKjuXHDBmyq+5RKIbbPHeEUgpCumVuPBq11lih6H/FWytBVjUAvJL+yFRK41IoTfacg1PSkqX8qnGp0a/xNBtIJxDeoryklzfLRskvxwIyBy7CV2+GN7o7uukeapb+RadgUaYK8lJvthzGmaH8piKmc3D2Xlqa/2TDqYG9e15zpxixfVTgMmVqhisGVHE73dhREreSiPEw+BiTWRfMSsFq04/z48vKFnp1t9zlPSr+bitIYqPHxzisA7VQdI1f3l7bszH7kYQYdbHARe2Fu79J0J4avZTSQnXr4lOGgMl3aBsy4MRrrNwhd1VoDNPCA4k1yZHlGLYTHZtwHQfXOmcEQEZba+Q/CM0r5miNXmd6UfYh32Mcsy4vys2TdEkzXKj1gpSu5U6KcLgP/F820/n1EEBHIufqXjRDpOl5fZMWtLpfmU8xTAjidxX9Z3dgO7s7HRBtpTYoVlU40QiaG/aVxCNODtyhV/1u28Lb37H0bu3/KHT+olwSvWnfn5UgBCl8JIeSTticsbQp+MHHUVIcZPfxFMQGuqnhLECr/xIPq1cD71yBHXBDO2x3fSFIu6CRF+EFPoAe4EPbPJofc4WyC/SIEM/tSHSjd8KSyemsAMkKsDNwscj66cdviL8a8FcDEZjUIrnlDjNdzIbTSE3DgwSsMM/mOQQ5Qx0MLz4m+GE/fYI3Hl2OmhPSdlNleKmW2A0pbOxV6eOcyrgJQ==", "Algorithm": "aes", "CryptoType": 0}	{"e": "AQAB", "n": "0MoI5_hiV2wJgHpjonl4FBm_4O1CoZvMmmO8t1Hc-h3ZXkh1TpMUiJ4UrxH_yC818CKDyNPVef1MqkQe-Jyvoi4WG24RS20xPW4Gire3YNCKMRV_Bw6AP8QASnh1y06fgZal-I6rsO-YpE1kZ8zieel552qhpsjbUaQroEZqGWKZMg4cdEAzOpvUdcEbBKeRPuVQES5dKktebS9vvQ7XAucXf-wZKyOUeSgrutNCa85oJIi2nJ_B-1KXZdn5EVSEWaMRtW7YYo1XR-kfKqPl_RXygfjnY9OrZ0vZexS6ceaH8mG-PUGMc_VwZ2PBEw1eUJLXLDBVlylQ3NLHznSjIQ", "alg": "RS256", "kid": "338293186797502467", "kty": "RSA", "use": "sig"}	{"Bits": "2048", "Hasher": "SHA256"}	1
\.


--
-- Data for Name: river_client; Type: TABLE DATA; Schema: queue; Owner: -
--

COPY queue.river_client (id, created_at, metadata, paused_at, updated_at) FROM stdin;
\.


--
-- Data for Name: river_client_queue; Type: TABLE DATA; Schema: queue; Owner: -
--

COPY queue.river_client_queue (river_client_id, name, created_at, max_workers, metadata, num_jobs_completed, num_jobs_running, updated_at) FROM stdin;
\.


--
-- Data for Name: river_job; Type: TABLE DATA; Schema: queue; Owner: -
--

COPY queue.river_job (id, state, attempt, max_attempts, attempted_at, created_at, finalized_at, scheduled_at, priority, args, attempted_by, errors, kind, metadata, queue, tags, unique_key, unique_states) FROM stdin;
\.


--
-- Data for Name: river_leader; Type: TABLE DATA; Schema: queue; Owner: -
--

COPY queue.river_leader (elected_at, expires_at, leader_id, name) FROM stdin;
2025-09-17 21:20:22.919602+00	2025-09-17 21:21:02.937471+00	5383d22e00e1_2025_09_17T21_20_22_919027	default
\.


--
-- Data for Name: river_migration; Type: TABLE DATA; Schema: queue; Owner: -
--

COPY queue.river_migration (line, version, created_at) FROM stdin;
main	1	2025-09-17 18:40:52.994857+00
main	2	2025-09-17 18:40:52.994857+00
main	3	2025-09-17 18:40:52.994857+00
main	4	2025-09-17 18:40:52.994857+00
main	5	2025-09-17 18:40:52.994857+00
main	6	2025-09-17 18:40:52.994857+00
\.


--
-- Data for Name: river_queue; Type: TABLE DATA; Schema: queue; Owner: -
--

COPY queue.river_queue (name, created_at, metadata, paused_at, updated_at) FROM stdin;
service_ping_report	2025-09-17 18:40:53.512755+00	{}	\N	2025-09-17 21:20:22.919964+00
execution	2025-09-17 18:40:53.51186+00	{}	\N	2025-09-17 21:20:22.928894+00
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: system; Owner: -
--

COPY system.assets (instance_id, asset_type, resource_owner, name, content_type, data, updated_at) FROM stdin;
338293185505656835	1	338293185505656835	policy/label/css/variables.css	text/css	\\x3a726f6f74207b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3430303a207267622839332c203131322c20323230293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3530303a207267622838342c203130352c20323132293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3630303a207267622837352c2039382c20323034293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3730303a207267622836362c2039312c20313936293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3830303a207267622835362c2038342c20313838293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3930303a207267622834352c2037382c20313830293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3130303a20726762283133372c203135302c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3230303a20726762283132322c203133362c20323438293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d35303a20726762283135382c203136392c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3330303a20726762283130322c203131392c20323238293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d35303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3130303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3230303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3430303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3530303a20726762283235302c203235302c20323530293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3730303a20726762283231362c203231362c20323136293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3830303a20726762283230302c203230302c20323030293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3930303a20726762283138342c203138342c20313834293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3330303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3630303a20726762283233332c203233332c20323333293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d636f6e74726173743a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3530303a20726762283230352c2036312c203836293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3630303a20726762283139362c2035322c203739293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3830303a20726762283137382c2033332c203636293b2d2d7a69746164656c2d636f6c6f722d7761726e2d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3430303a20726762283231342c2037302c203933293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3730303a20726762283138372c2034332c203732293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3930303a20726762283137302c2032312c203539293b2d2d7a69746164656c2d636f6c6f722d7761726e2d35303a20726762283235352c203133322c20313439293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3130303a20726762283235352c203131322c20313330293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3230303a20726762283234342c2039372c20313137293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3330303a20726762283232332c2037382c20313030293b2d2d7a69746164656c2d636f6c6f722d6c6162656c3a20233030303030303b2d2d7a69746164656c2d636f6c6f722d746578742d3430303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3530303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3830303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3930303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d35303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3130303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3630303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3730303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3230303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3330303a2072676228302c20302c2030293b7d2e6c676e2d6461726b2d7468656d65207b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3330303a207267622835372c203132392c20323132293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3530303a207267622833322c203131352c20313936293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3630303a207267622831312c203130382c20313838293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3830303a2072676228302c2039342c20313732293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3430303a207267622834362c203132322c20323034293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3730303a2072676228302c203130312c20313830293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3930303a2072676228302c2038372c20313635293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d35303a20726762283132302c203137392c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3130303a207267622839382c203136302c20323436293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3230303a207267622838312c203134362c20323331293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d35303a207267622832362c2033332c203438293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3130303a207267622832332c2033302c203436293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3430303a207267622831382c2032352c203430293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3530303a207267622831372c2032342c203339293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3630303a207267622831362c2032332c203338293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3830303a207267622831342c2032312c203336293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3930303a207267622831332c2032302c203335293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3230303a207267622832312c2032382c203434293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3330303a207267622831392c2032362c203431293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3730303a207267622831352c2032322c203337293b2d2d7a69746164656c2d636f6c6f722d7761726e2d35303a20726762283235352c203135322c20313637293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3130303a20726762283235352c203132362c20313434293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3330303a20726762283235352c2038322c20313038293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3630303a20726762283234342c2034362c203833293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3830303a20726762283232322c20342c203637293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3930303a20726762283231312c20302c203539293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3230303a20726762283235352c203130372c20313238293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3430303a20726762283235352c2037312c203939293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3530303a20726762283235352c2035392c203931293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3730303a20726762283233332c2033302c203735293b2d2d7a69746164656c2d636f6c6f722d7761726e2d636f6e74726173743a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d6c6162656c3a20236666666666663b2d2d7a69746164656c2d636f6c6f722d746578742d3230303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3430303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3530303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3930303a20726762283138372c203138372c20313837293b2d2d7a69746164656c2d636f6c6f722d746578742d636f6e74726173743a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d35303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3330303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3630303a20726762283233382c203233382c20323338293b2d2d7a69746164656c2d636f6c6f722d746578742d3730303a20726762283232312c203232312c20323231293b2d2d7a69746164656c2d636f6c6f722d746578742d3830303a20726762283230342c203230342c20323034293b2d2d7a69746164656c2d636f6c6f722d746578742d3130303a20726762283235352c203235352c20323535293b7d	2025-09-17 18:40:53.394734+00
\.


--
-- Data for Name: encryption_keys; Type: TABLE DATA; Schema: system; Owner: -
--

COPY system.encryption_keys (id, key) FROM stdin;
userKey	bQmXlVw0LJa6UXtSnzbIn9Jt3f0cmfA-MXiu3cVKQgvzjof6z9Uwa7YUiHkndobq
smtpKey	ZHHp-0cAgIM3Ho-tAs-9uBklU04NUdzMEZv0qjSMmCfZOTTgJ_PzUbF5gYRgwIDJ
oidcKey	CShe57360TiiLWUAbZYOkOFK9khovfylTCxUQAtNN4Rg-oYfsTpDQ3JC33TTwKAR
domainVerificationKey	dnEHCkyF7BY78_6Q4WDM_6_soIKq1LCR0hd_mufUwb3Ts-oa1n8aHOGDv4VajePD
idpConfigKey	JWZuOMFOcLpLVjd4REnoKZnBLTZEBtNaHHyyOqUJY0YZ_LUnGCeE3GZ2pO2qNxDl
samlKey	kCb-zs_RqpyvHoIyuCuyrFGSlwcKeGri78toGZHp7zuVrzS3tZFWz1--KzP4lGJq
otpKey	PEf49eiBJew6iCLyl74_5iqPEQbXfkNjWFdxYoZ-GvaISDEA5yxV3om1Qa4UgFqI
smsKey	uqVyxHZYKR96UqffGZX3ro7H0s3y572LFuy68ivjZEyCnzvYIBRetTme_P5M0dbX
targetKey	H6tAIO1rcWOt7nAbZDpbRoHvN6I_SixvxrQeMGvpI3qB-556HMfzXq4MpppSlon_
csrfCookieKey	2VS4soGAiBvvi1KFM7fhGnR8gZackCAkZumRhqBtr0NIXMH6zAN8cXKNtf7tIfse
userAgentCookieKey	7_vKxanfhoD4GvvZaq9LhrDiXpfj9nmiETH5h_YBQhoWypAmR1WRmBqVQis-CZag
\.


--
-- Name: resource_counts_id_seq; Type: SEQUENCE SET; Schema: projections; Owner: -
--

SELECT pg_catalog.setval('projections.resource_counts_id_seq', 12, true);


--
-- Name: river_job_id_seq; Type: SEQUENCE SET; Schema: queue; Owner: -
--

SELECT pg_catalog.setval('queue.river_job_id_seq', 1, false);


--
-- Name: current_sequences current_sequences_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: -
--

ALTER TABLE ONLY adminapi.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: failed_events failed_events_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: -
--

ALTER TABLE ONLY adminapi.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (view_name, failed_sequence, instance_id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: -
--

ALTER TABLE ONLY adminapi.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: styling2 styling2_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: -
--

ALTER TABLE ONLY adminapi.styling2
    ADD CONSTRAINT styling2_pkey PRIMARY KEY (instance_id, aggregate_id, label_policy_state);


--
-- Name: styling styling_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: -
--

ALTER TABLE ONLY adminapi.styling
    ADD CONSTRAINT styling_pkey PRIMARY KEY (aggregate_id, label_policy_state, instance_id);


--
-- Name: auth_requests auth_requests_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.auth_requests
    ADD CONSTRAINT auth_requests_pkey PRIMARY KEY (id, instance_id);


--
-- Name: current_sequences current_sequences_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: failed_events failed_events_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (view_name, failed_sequence, instance_id);


--
-- Name: idp_configs2 idp_configs2_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.idp_configs2
    ADD CONSTRAINT idp_configs2_pkey PRIMARY KEY (instance_id, idp_config_id);


--
-- Name: idp_configs idp_configs_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.idp_configs
    ADD CONSTRAINT idp_configs_pkey PRIMARY KEY (idp_config_id, instance_id);


--
-- Name: idp_providers2 idp_providers2_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.idp_providers2
    ADD CONSTRAINT idp_providers2_pkey PRIMARY KEY (instance_id, aggregate_id, idp_config_id);


--
-- Name: idp_providers idp_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.idp_providers
    ADD CONSTRAINT idp_providers_pkey PRIMARY KEY (aggregate_id, idp_config_id, instance_id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: org_project_mapping2 org_project_mapping2_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.org_project_mapping2
    ADD CONSTRAINT org_project_mapping2_pkey PRIMARY KEY (instance_id, org_id, project_id);


--
-- Name: org_project_mapping org_project_mapping_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.org_project_mapping
    ADD CONSTRAINT org_project_mapping_pkey PRIMARY KEY (org_id, project_id, instance_id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id, instance_id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id, instance_id);


--
-- Name: user_external_idps2 user_external_idps2_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_external_idps2
    ADD CONSTRAINT user_external_idps2_pkey PRIMARY KEY (instance_id, external_user_id, idp_config_id);


--
-- Name: user_external_idps user_external_idps_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_external_idps
    ADD CONSTRAINT user_external_idps_pkey PRIMARY KEY (external_user_id, idp_config_id, instance_id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (user_agent_id, user_id, instance_id);


--
-- Name: users2 users2_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users2
    ADD CONSTRAINT users2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: users3 users3_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users3
    ADD CONSTRAINT users3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id, instance_id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (cache_name, id);


--
-- Name: objects_federated_logout objects_federated_logout_pkey; Type: CONSTRAINT; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.objects_federated_logout
    ADD CONSTRAINT objects_federated_logout_pkey PRIMARY KEY (cache_name, id);


--
-- Name: objects_id_p_form_callback objects_id_p_form_callback_pkey; Type: CONSTRAINT; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.objects_id_p_form_callback
    ADD CONSTRAINT objects_id_p_form_callback_pkey PRIMARY KEY (cache_name, id);


--
-- Name: string_keys string_keys_pkey; Type: CONSTRAINT; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.string_keys
    ADD CONSTRAINT string_keys_pkey PRIMARY KEY (cache_name, index_id, index_key);


--
-- Name: string_keys_federated_logout string_keys_federated_logout_pkey; Type: CONSTRAINT; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.string_keys_federated_logout
    ADD CONSTRAINT string_keys_federated_logout_pkey PRIMARY KEY (cache_name, index_id, index_key);


--
-- Name: string_keys_id_p_form_callback string_keys_id_p_form_callback_pkey; Type: CONSTRAINT; Schema: cache; Owner: -
--

ALTER TABLE ONLY cache.string_keys_id_p_form_callback
    ADD CONSTRAINT string_keys_id_p_form_callback_pkey PRIMARY KEY (cache_name, index_id, index_key);


--
-- Name: events2 events2_pkey; Type: CONSTRAINT; Schema: eventstore; Owner: -
--

ALTER TABLE ONLY eventstore.events2
    ADD CONSTRAINT events2_pkey PRIMARY KEY (instance_id, aggregate_type, aggregate_id, sequence);


--
-- Name: fields fields_pkey; Type: CONSTRAINT; Schema: eventstore; Owner: -
--

ALTER TABLE ONLY eventstore.fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (instance_id, id);


--
-- Name: unique_constraints unique_constraints_pkey; Type: CONSTRAINT; Schema: eventstore; Owner: -
--

ALTER TABLE ONLY eventstore.unique_constraints
    ADD CONSTRAINT unique_constraints_pkey PRIMARY KEY (instance_id, unique_type, unique_field);


--
-- Name: actions3 actions3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.actions3
    ADD CONSTRAINT actions3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: apps7_api_configs apps7_api_configs_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.apps7_api_configs
    ADD CONSTRAINT apps7_api_configs_pkey PRIMARY KEY (instance_id, app_id);


--
-- Name: apps7_oidc_configs apps7_oidc_configs_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.apps7_oidc_configs
    ADD CONSTRAINT apps7_oidc_configs_pkey PRIMARY KEY (instance_id, app_id);


--
-- Name: apps7 apps7_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.apps7
    ADD CONSTRAINT apps7_pkey PRIMARY KEY (instance_id, id);


--
-- Name: apps7_saml_configs apps7_saml_configs_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.apps7_saml_configs
    ADD CONSTRAINT apps7_saml_configs_pkey PRIMARY KEY (instance_id, app_id);


--
-- Name: auth_requests auth_requests_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.auth_requests
    ADD CONSTRAINT auth_requests_pkey PRIMARY KEY (instance_id, id);


--
-- Name: authn_keys2 authn_keys2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.authn_keys2
    ADD CONSTRAINT authn_keys2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: current_sequences current_sequences_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (projection_name, aggregate_type, instance_id);


--
-- Name: current_states current_states_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.current_states
    ADD CONSTRAINT current_states_pkey PRIMARY KEY (projection_name, instance_id);


--
-- Name: custom_texts2 custom_texts2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.custom_texts2
    ADD CONSTRAINT custom_texts2_pkey PRIMARY KEY (instance_id, aggregate_id, template, key, language);


--
-- Name: debug_events debug_events_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.debug_events
    ADD CONSTRAINT debug_events_pkey PRIMARY KEY (instance_id, id);


--
-- Name: device_auth_requests2 device_auth_requests2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.device_auth_requests2
    ADD CONSTRAINT device_auth_requests2_pkey PRIMARY KEY (instance_id, device_code);


--
-- Name: domain_policies2 domain_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.domain_policies2
    ADD CONSTRAINT domain_policies2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: executions1 executions1_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.executions1
    ADD CONSTRAINT executions1_pkey PRIMARY KEY (instance_id, id);


--
-- Name: executions1_targets executions1_targets_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.executions1_targets
    ADD CONSTRAINT executions1_targets_pkey PRIMARY KEY (instance_id, execution_id, "position");


--
-- Name: failed_events2 failed_events2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.failed_events2
    ADD CONSTRAINT failed_events2_pkey PRIMARY KEY (projection_name, instance_id, aggregate_type, aggregate_id, failed_sequence);


--
-- Name: failed_events failed_events_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (projection_name, failed_sequence, instance_id);


--
-- Name: flow_triggers3 flow_triggers3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.flow_triggers3
    ADD CONSTRAINT flow_triggers3_pkey PRIMARY KEY (instance_id, flow_type, trigger_type, resource_owner, action_id);


--
-- Name: hosted_login_translations hosted_login_translations_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.hosted_login_translations
    ADD CONSTRAINT hosted_login_translations_pkey PRIMARY KEY (instance_id, aggregate_id, aggregate_type, locale);


--
-- Name: idp_login_policy_links5 idp_login_policy_links5_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_login_policy_links5
    ADD CONSTRAINT idp_login_policy_links5_pkey PRIMARY KEY (instance_id, aggregate_id, idp_id);


--
-- Name: idp_templates6_apple idp_templates6_apple_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_apple
    ADD CONSTRAINT idp_templates6_apple_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_azure idp_templates6_azure_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_azure
    ADD CONSTRAINT idp_templates6_azure_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_github_enterprise idp_templates6_github_enterprise_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_github_enterprise
    ADD CONSTRAINT idp_templates6_github_enterprise_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_github idp_templates6_github_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_github
    ADD CONSTRAINT idp_templates6_github_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_gitlab idp_templates6_gitlab_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_gitlab
    ADD CONSTRAINT idp_templates6_gitlab_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_gitlab_self_hosted idp_templates6_gitlab_self_hosted_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_gitlab_self_hosted
    ADD CONSTRAINT idp_templates6_gitlab_self_hosted_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_google idp_templates6_google_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_google
    ADD CONSTRAINT idp_templates6_google_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_jwt idp_templates6_jwt_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_jwt
    ADD CONSTRAINT idp_templates6_jwt_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_ldap2 idp_templates6_ldap2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_ldap2
    ADD CONSTRAINT idp_templates6_ldap2_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_oauth2 idp_templates6_oauth2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_oauth2
    ADD CONSTRAINT idp_templates6_oauth2_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_oidc idp_templates6_oidc_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_oidc
    ADD CONSTRAINT idp_templates6_oidc_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6 idp_templates6_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6
    ADD CONSTRAINT idp_templates6_pkey PRIMARY KEY (instance_id, id);


--
-- Name: idp_templates6_saml idp_templates6_saml_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_saml
    ADD CONSTRAINT idp_templates6_saml_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_user_links3 idp_user_links3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_user_links3
    ADD CONSTRAINT idp_user_links3_pkey PRIMARY KEY (instance_id, idp_id, external_user_id);


--
-- Name: idps3_jwt_config idps3_jwt_config_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idps3_jwt_config
    ADD CONSTRAINT idps3_jwt_config_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idps3_oidc_config idps3_oidc_config_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idps3_oidc_config
    ADD CONSTRAINT idps3_oidc_config_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idps3 idps3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idps3
    ADD CONSTRAINT idps3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: instance_domains instance_domains_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.instance_domains
    ADD CONSTRAINT instance_domains_pkey PRIMARY KEY (instance_id, domain);


--
-- Name: instance_features2 instance_features2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.instance_features2
    ADD CONSTRAINT instance_features2_pkey PRIMARY KEY (instance_id, key);


--
-- Name: instance_members4 instance_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.instance_members4
    ADD CONSTRAINT instance_members4_pkey PRIMARY KEY (instance_id, id, user_id);


--
-- Name: instance_trusted_domains instance_trusted_domains_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.instance_trusted_domains
    ADD CONSTRAINT instance_trusted_domains_pkey PRIMARY KEY (instance_id, domain);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: keys4_certificate keys4_certificate_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.keys4_certificate
    ADD CONSTRAINT keys4_certificate_pkey PRIMARY KEY (instance_id, id);


--
-- Name: keys4 keys4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.keys4
    ADD CONSTRAINT keys4_pkey PRIMARY KEY (instance_id, id);


--
-- Name: keys4_private keys4_private_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.keys4_private
    ADD CONSTRAINT keys4_private_pkey PRIMARY KEY (instance_id, id);


--
-- Name: keys4_public keys4_public_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.keys4_public
    ADD CONSTRAINT keys4_public_pkey PRIMARY KEY (instance_id, id);


--
-- Name: label_policies3 label_policies3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.label_policies3
    ADD CONSTRAINT label_policies3_pkey PRIMARY KEY (instance_id, id, state);


--
-- Name: limits limits_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.limits
    ADD CONSTRAINT limits_pkey PRIMARY KEY (instance_id, resource_owner);


--
-- Name: lockout_policies3 lockout_policies3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.lockout_policies3
    ADD CONSTRAINT lockout_policies3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (projection_name, instance_id);


--
-- Name: login_names3_domains login_names3_domains_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.login_names3_domains
    ADD CONSTRAINT login_names3_domains_pkey PRIMARY KEY (instance_id, resource_owner, name);


--
-- Name: login_names3_policies login_names3_policies_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.login_names3_policies
    ADD CONSTRAINT login_names3_policies_pkey PRIMARY KEY (instance_id, resource_owner);


--
-- Name: login_names3_users login_names3_users_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.login_names3_users
    ADD CONSTRAINT login_names3_users_pkey PRIMARY KEY (instance_id, id);


--
-- Name: login_policies5 login_policies5_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.login_policies5
    ADD CONSTRAINT login_policies5_pkey PRIMARY KEY (instance_id, aggregate_id);


--
-- Name: mail_templates2 mail_templates2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.mail_templates2
    ADD CONSTRAINT mail_templates2_pkey PRIMARY KEY (instance_id, aggregate_id);


--
-- Name: message_texts2 message_texts2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.message_texts2
    ADD CONSTRAINT message_texts2_pkey PRIMARY KEY (instance_id, aggregate_id, type, language);


--
-- Name: milestones3 milestones3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.milestones3
    ADD CONSTRAINT milestones3_pkey PRIMARY KEY (instance_id, type);


--
-- Name: notification_policies notification_policies_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.notification_policies
    ADD CONSTRAINT notification_policies_pkey PRIMARY KEY (instance_id, id);


--
-- Name: notification_providers notification_providers_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.notification_providers
    ADD CONSTRAINT notification_providers_pkey PRIMARY KEY (instance_id, aggregate_id, provider_type);


--
-- Name: oidc_settings2 oidc_settings2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.oidc_settings2
    ADD CONSTRAINT oidc_settings2_pkey PRIMARY KEY (instance_id, aggregate_id);


--
-- Name: org_domains2 org_domains2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.org_domains2
    ADD CONSTRAINT org_domains2_pkey PRIMARY KEY (org_id, domain, instance_id);


--
-- Name: org_members4 org_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.org_members4
    ADD CONSTRAINT org_members4_pkey PRIMARY KEY (instance_id, org_id, user_id);


--
-- Name: org_metadata2 org_metadata2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.org_metadata2
    ADD CONSTRAINT org_metadata2_pkey PRIMARY KEY (instance_id, org_id, key);


--
-- Name: orgs1 orgs1_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.orgs1
    ADD CONSTRAINT orgs1_pkey PRIMARY KEY (instance_id, id);


--
-- Name: password_age_policies2 password_age_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.password_age_policies2
    ADD CONSTRAINT password_age_policies2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: password_complexity_policies2 password_complexity_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.password_complexity_policies2
    ADD CONSTRAINT password_complexity_policies2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: personal_access_tokens3 personal_access_tokens3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.personal_access_tokens3
    ADD CONSTRAINT personal_access_tokens3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: privacy_policies4 privacy_policies4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.privacy_policies4
    ADD CONSTRAINT privacy_policies4_pkey PRIMARY KEY (instance_id, id);


--
-- Name: project_grant_members4 project_grant_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.project_grant_members4
    ADD CONSTRAINT project_grant_members4_pkey PRIMARY KEY (instance_id, project_id, grant_id, user_id);


--
-- Name: project_grants4 project_grants4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.project_grants4
    ADD CONSTRAINT project_grants4_pkey PRIMARY KEY (instance_id, grant_id);


--
-- Name: project_members4 project_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.project_members4
    ADD CONSTRAINT project_members4_pkey PRIMARY KEY (instance_id, project_id, user_id);


--
-- Name: project_roles4 project_roles4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.project_roles4
    ADD CONSTRAINT project_roles4_pkey PRIMARY KEY (instance_id, project_id, role_key);


--
-- Name: projects4 projects4_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.projects4
    ADD CONSTRAINT projects4_pkey PRIMARY KEY (instance_id, id);


--
-- Name: quotas_notifications quotas_notifications_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.quotas_notifications
    ADD CONSTRAINT quotas_notifications_pkey PRIMARY KEY (instance_id, unit, id);


--
-- Name: quotas_periods quotas_periods_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.quotas_periods
    ADD CONSTRAINT quotas_periods_pkey PRIMARY KEY (instance_id, unit, start);


--
-- Name: quotas quotas_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.quotas
    ADD CONSTRAINT quotas_pkey PRIMARY KEY (instance_id, unit);


--
-- Name: resource_counts resource_counts_instance_id_parent_type_parent_id_table_nam_key; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.resource_counts
    ADD CONSTRAINT resource_counts_instance_id_parent_type_parent_id_table_nam_key UNIQUE (instance_id, parent_type, parent_id, table_name);


--
-- Name: resource_counts resource_counts_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.resource_counts
    ADD CONSTRAINT resource_counts_pkey PRIMARY KEY (id);


--
-- Name: restrictions2 restrictions2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.restrictions2
    ADD CONSTRAINT restrictions2_pkey PRIMARY KEY (instance_id, resource_owner);


--
-- Name: saml_requests saml_requests_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.saml_requests
    ADD CONSTRAINT saml_requests_pkey PRIMARY KEY (instance_id, id);


--
-- Name: secret_generators2 secret_generators2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.secret_generators2
    ADD CONSTRAINT secret_generators2_pkey PRIMARY KEY (instance_id, generator_type, aggregate_id);


--
-- Name: security_policies2 security_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.security_policies2
    ADD CONSTRAINT security_policies2_pkey PRIMARY KEY (instance_id);


--
-- Name: sessions8 sessions8_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.sessions8
    ADD CONSTRAINT sessions8_pkey PRIMARY KEY (instance_id, id);


--
-- Name: sms_configs3_http sms_configs3_http_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.sms_configs3_http
    ADD CONSTRAINT sms_configs3_http_pkey PRIMARY KEY (instance_id, sms_id);


--
-- Name: sms_configs3 sms_configs3_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.sms_configs3
    ADD CONSTRAINT sms_configs3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: sms_configs3_twilio sms_configs3_twilio_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.sms_configs3_twilio
    ADD CONSTRAINT sms_configs3_twilio_pkey PRIMARY KEY (instance_id, sms_id);


--
-- Name: smtp_configs5_http smtp_configs5_http_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.smtp_configs5_http
    ADD CONSTRAINT smtp_configs5_http_pkey PRIMARY KEY (instance_id, id);


--
-- Name: smtp_configs5 smtp_configs5_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.smtp_configs5
    ADD CONSTRAINT smtp_configs5_pkey PRIMARY KEY (instance_id, id);


--
-- Name: smtp_configs5_smtp smtp_configs5_smtp_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.smtp_configs5_smtp
    ADD CONSTRAINT smtp_configs5_smtp_pkey PRIMARY KEY (instance_id, id);


--
-- Name: system_features system_features_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.system_features
    ADD CONSTRAINT system_features_pkey PRIMARY KEY (key);


--
-- Name: targets2 targets2_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.targets2
    ADD CONSTRAINT targets2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: user_auth_methods5 user_auth_methods5_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.user_auth_methods5
    ADD CONSTRAINT user_auth_methods5_pkey PRIMARY KEY (instance_id, user_id, method_type, token_id);


--
-- Name: user_grants5 user_grants5_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.user_grants5
    ADD CONSTRAINT user_grants5_pkey PRIMARY KEY (instance_id, id);


--
-- Name: user_metadata5 user_metadata5_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.user_metadata5
    ADD CONSTRAINT user_metadata5_pkey PRIMARY KEY (instance_id, user_id, key);


--
-- Name: user_schemas1 user_schemas1_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.user_schemas1
    ADD CONSTRAINT user_schemas1_pkey PRIMARY KEY (instance_id, id);


--
-- Name: users14_humans users14_humans_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.users14_humans
    ADD CONSTRAINT users14_humans_pkey PRIMARY KEY (instance_id, user_id);


--
-- Name: users14_machines users14_machines_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.users14_machines
    ADD CONSTRAINT users14_machines_pkey PRIMARY KEY (instance_id, user_id);


--
-- Name: users14_notifications users14_notifications_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.users14_notifications
    ADD CONSTRAINT users14_notifications_pkey PRIMARY KEY (instance_id, user_id);


--
-- Name: users14 users14_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.users14
    ADD CONSTRAINT users14_pkey PRIMARY KEY (instance_id, id);


--
-- Name: web_keys1 web_keys1_pkey; Type: CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.web_keys1
    ADD CONSTRAINT web_keys1_pkey PRIMARY KEY (instance_id, key_id);


--
-- Name: river_client river_client_pkey; Type: CONSTRAINT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_client
    ADD CONSTRAINT river_client_pkey PRIMARY KEY (id);


--
-- Name: river_client_queue river_client_queue_pkey; Type: CONSTRAINT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_client_queue
    ADD CONSTRAINT river_client_queue_pkey PRIMARY KEY (river_client_id, name);


--
-- Name: river_job river_job_pkey; Type: CONSTRAINT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_job
    ADD CONSTRAINT river_job_pkey PRIMARY KEY (id);


--
-- Name: river_leader river_leader_pkey; Type: CONSTRAINT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_leader
    ADD CONSTRAINT river_leader_pkey PRIMARY KEY (name);


--
-- Name: river_migration river_migration_pkey1; Type: CONSTRAINT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_migration
    ADD CONSTRAINT river_migration_pkey1 PRIMARY KEY (line, version);


--
-- Name: river_queue river_queue_pkey; Type: CONSTRAINT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_queue
    ADD CONSTRAINT river_queue_pkey PRIMARY KEY (name);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (instance_id, resource_owner, name);


--
-- Name: encryption_keys encryption_keys_pkey; Type: CONSTRAINT; Schema: system; Owner: -
--

ALTER TABLE ONLY system.encryption_keys
    ADD CONSTRAINT encryption_keys_pkey PRIMARY KEY (id);


--
-- Name: current_sequences_instance_id_idx; Type: INDEX; Schema: adminapi; Owner: -
--

CREATE INDEX current_sequences_instance_id_idx ON adminapi.current_sequences USING btree (instance_id);


--
-- Name: failed_events_instance_id_idx; Type: INDEX; Schema: adminapi; Owner: -
--

CREATE INDEX failed_events_instance_id_idx ON adminapi.failed_events USING btree (instance_id);


--
-- Name: st2_owner_removed_idx; Type: INDEX; Schema: adminapi; Owner: -
--

CREATE INDEX st2_owner_removed_idx ON adminapi.styling2 USING btree (owner_removed);


--
-- Name: auth_code_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX auth_code_idx ON auth.auth_requests USING btree (code);


--
-- Name: current_sequences_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX current_sequences_instance_id_idx ON auth.current_sequences USING btree (instance_id);


--
-- Name: ext_idps2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX ext_idps2_owner_removed_idx ON auth.user_external_idps2 USING btree (owner_removed);


--
-- Name: failed_events_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX failed_events_instance_id_idx ON auth.failed_events USING btree (instance_id);


--
-- Name: idp_conf2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idp_conf2_owner_removed_idx ON auth.idp_configs2 USING btree (owner_removed);


--
-- Name: idp_prov2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idp_prov2_owner_removed_idx ON auth.idp_providers2 USING btree (owner_removed);


--
-- Name: inst_app_tkn_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX inst_app_tkn_idx ON auth.tokens USING btree (instance_id, application_id);


--
-- Name: inst_refresh_tkn_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX inst_refresh_tkn_idx ON auth.tokens USING btree (instance_id, refresh_token_id);


--
-- Name: inst_ro_tkn_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX inst_ro_tkn_idx ON auth.tokens USING btree (instance_id, resource_owner);


--
-- Name: inst_usr_agnt_tkn_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX inst_usr_agnt_tkn_idx ON auth.tokens USING btree (instance_id, user_id, user_agent_id);


--
-- Name: org_proj_m2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX org_proj_m2_owner_removed_idx ON auth.org_project_mapping2 USING btree (owner_removed);


--
-- Name: u2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX u2_owner_removed_idx ON auth.users2 USING btree (owner_removed);


--
-- Name: unique_client_user_index; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_client_user_index ON auth.refresh_tokens USING btree (client_id, user_agent_id, user_id);


--
-- Name: user_session_id; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_session_id ON auth.user_sessions USING btree (id, instance_id);


--
-- Name: user_sessions_by_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_sessions_by_user ON auth.user_sessions USING btree (instance_id, user_id);


--
-- Name: string_keys_object_id_idx; Type: INDEX; Schema: cache; Owner: -
--

CREATE INDEX string_keys_object_id_idx ON ONLY cache.string_keys USING btree (cache_name, object_id);


--
-- Name: string_keys_federated_logout_cache_name_object_id_idx; Type: INDEX; Schema: cache; Owner: -
--

CREATE INDEX string_keys_federated_logout_cache_name_object_id_idx ON cache.string_keys_federated_logout USING btree (cache_name, object_id);


--
-- Name: string_keys_id_p_form_callback_cache_name_object_id_idx; Type: INDEX; Schema: cache; Owner: -
--

CREATE INDEX string_keys_id_p_form_callback_cache_name_object_id_idx ON cache.string_keys_id_p_form_callback USING btree (cache_name, object_id);


--
-- Name: active_instances_events; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX active_instances_events ON eventstore.events2 USING btree (aggregate_type, event_type) WHERE ((aggregate_type = 'instance'::text) AND (event_type = ANY (ARRAY['instance.added'::text, 'instance.removed'::text])));


--
-- Name: es_active_instances; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX es_active_instances ON eventstore.events2 USING btree (created_at DESC, instance_id);


--
-- Name: es_instance_position; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX es_instance_position ON eventstore.events2 USING btree (instance_id, "position");


--
-- Name: es_projection; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX es_projection ON eventstore.events2 USING btree (instance_id, aggregate_type, event_type, "position");


--
-- Name: es_wm; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX es_wm ON eventstore.events2 USING btree (instance_id, aggregate_id, aggregate_type, event_type, "position");


--
-- Name: events2_current_sequence2; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX events2_current_sequence2 ON eventstore.events2 USING btree (aggregate_id, aggregate_type, instance_id, sequence DESC);


--
-- Name: f_aggregate_object_type_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX f_aggregate_object_type_idx ON eventstore.fields USING btree (aggregate_type, aggregate_id, object_type);


--
-- Name: f_bool_unique_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE UNIQUE INDEX f_bool_unique_idx ON eventstore.fields USING btree (instance_id, field_name, bool_value) WHERE value_must_be_unique;


--
-- Name: f_bool_value_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX f_bool_value_idx ON eventstore.fields USING btree (instance_id, object_type, field_name, bool_value) INCLUDE (resource_owner, object_id, object_revision, value) WHERE (bool_value IS NOT NULL);


--
-- Name: f_number_unique_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE UNIQUE INDEX f_number_unique_idx ON eventstore.fields USING btree (instance_id, field_name, number_value) WHERE value_must_be_unique;


--
-- Name: f_number_value_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX f_number_value_idx ON eventstore.fields USING btree (instance_id, object_type, field_name, number_value) INCLUDE (resource_owner, object_id, object_revision, value) WHERE (number_value IS NOT NULL);


--
-- Name: f_object_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX f_object_idx ON eventstore.fields USING btree (instance_id, object_type, object_id, object_revision) INCLUDE (resource_owner, field_name, value);


--
-- Name: f_text_unique_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE UNIQUE INDEX f_text_unique_idx ON eventstore.fields USING btree (instance_id, field_name, text_value) WHERE value_must_be_unique;


--
-- Name: f_text_value_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX f_text_value_idx ON eventstore.fields USING btree (instance_id, object_type, field_name, text_value) INCLUDE (resource_owner, object_id, object_revision, value) WHERE (text_value IS NOT NULL);


--
-- Name: fields_instance_domains_idx; Type: INDEX; Schema: eventstore; Owner: -
--

CREATE INDEX fields_instance_domains_idx ON eventstore.fields USING btree (object_id) INCLUDE (instance_id) WHERE ((object_type = 'instance_domain'::text) AND (field_name = 'domain'::text));


--
-- Name: log_date_desc; Type: INDEX; Schema: logstore; Owner: -
--

CREATE INDEX log_date_desc ON logstore.execution USING btree (instance_id, log_date DESC) INCLUDE (took);


--
-- Name: protocol_date_desc; Type: INDEX; Schema: logstore; Owner: -
--

CREATE INDEX protocol_date_desc ON logstore.access USING btree (instance_id, protocol, log_date DESC) INCLUDE (request_url, response_status, request_headers);


--
-- Name: actions3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX actions3_owner_removed_idx ON projections.actions3 USING btree (owner_removed);


--
-- Name: actions3_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX actions3_resource_owner_idx ON projections.actions3 USING btree (resource_owner);


--
-- Name: apps7_api_configs_client_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX apps7_api_configs_client_id_idx ON projections.apps7_api_configs USING btree (client_id);


--
-- Name: apps7_oidc_configs_client_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX apps7_oidc_configs_client_id_idx ON projections.apps7_oidc_configs USING btree (client_id);


--
-- Name: apps7_project_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX apps7_project_id_idx ON projections.apps7 USING btree (project_id);


--
-- Name: apps7_saml_configs_entity_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX apps7_saml_configs_entity_id_idx ON projections.apps7_saml_configs USING btree (entity_id);


--
-- Name: authn_keys2_creation_date_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX authn_keys2_creation_date_idx ON projections.authn_keys2 USING btree (creation_date);


--
-- Name: authn_keys2_enabled_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX authn_keys2_enabled_idx ON projections.authn_keys2 USING btree (enabled);


--
-- Name: authn_keys2_expiration_date_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX authn_keys2_expiration_date_idx ON projections.authn_keys2 USING btree (expiration);


--
-- Name: authn_keys2_identifier_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX authn_keys2_identifier_idx ON projections.authn_keys2 USING btree (identifier);


--
-- Name: authn_keys2_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX authn_keys2_resource_owner_idx ON projections.authn_keys2 USING btree (resource_owner);


--
-- Name: cs_instance_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX cs_instance_id_idx ON projections.current_states USING btree (instance_id);


--
-- Name: current_sequences_instance_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX current_sequences_instance_id_idx ON projections.current_sequences USING btree (instance_id);


--
-- Name: custom_texts2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX custom_texts2_owner_removed_idx ON projections.custom_texts2 USING btree (owner_removed);


--
-- Name: device_auth_requests2_user_code_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX device_auth_requests2_user_code_idx ON projections.device_auth_requests2 USING btree (instance_id, user_code);


--
-- Name: domain_policies2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX domain_policies2_owner_removed_idx ON projections.domain_policies2 USING btree (owner_removed);


--
-- Name: executions1_targets_execution_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX executions1_targets_execution_idx ON projections.executions1_targets USING btree (instance_id, execution_id);


--
-- Name: failed_events_instance_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX failed_events_instance_id_idx ON projections.failed_events USING btree (instance_id);


--
-- Name: fe2_instance_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX fe2_instance_id_idx ON projections.failed_events2 USING btree (instance_id);


--
-- Name: idp_login_policy_links5_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idp_login_policy_links5_owner_removed_idx ON projections.idp_login_policy_links5 USING btree (owner_removed);


--
-- Name: idp_login_policy_links5_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idp_login_policy_links5_resource_owner_idx ON projections.idp_login_policy_links5 USING btree (resource_owner);


--
-- Name: idp_templates6_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idp_templates6_owner_removed_idx ON projections.idp_templates6 USING btree (owner_removed);


--
-- Name: idp_templates6_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idp_templates6_resource_owner_idx ON projections.idp_templates6 USING btree (resource_owner);


--
-- Name: idp_user_links3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idp_user_links3_owner_removed_idx ON projections.idp_user_links3 USING btree (owner_removed);


--
-- Name: idp_user_links3_user_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idp_user_links3_user_id_idx ON projections.idp_user_links3 USING btree (user_id);


--
-- Name: idps3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idps3_owner_removed_idx ON projections.idps3 USING btree (owner_removed);


--
-- Name: idps3_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX idps3_resource_owner_idx ON projections.idps3 USING btree (resource_owner);


--
-- Name: instance_domains_instance_domain_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX instance_domains_instance_domain_idx ON projections.instance_domains USING btree (domain) INCLUDE (creation_date, change_date, sequence, is_generated, is_primary);


--
-- Name: instance_members4_im_instance_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX instance_members4_im_instance_idx ON projections.instance_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: instance_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX instance_members4_user_id_idx ON projections.instance_members4 USING btree (user_id);


--
-- Name: instance_trusted_domains_instance_trusted_domain_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX instance_trusted_domains_instance_trusted_domain_idx ON projections.instance_trusted_domains USING btree (domain) INCLUDE (creation_date, change_date, sequence);


--
-- Name: label_policies3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX label_policies3_owner_removed_idx ON projections.label_policies3 USING btree (owner_removed);


--
-- Name: login_names3_domain_search; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX login_names3_domain_search ON projections.login_names3_domains USING btree (instance_id, resource_owner, name_lower);


--
-- Name: login_names3_domain_search_result; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX login_names3_domain_search_result ON projections.login_names3_domains USING btree (instance_id, resource_owner) INCLUDE (is_primary);


--
-- Name: login_names3_policies_is_default_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX login_names3_policies_is_default_owner_idx ON projections.login_names3_policies USING btree (instance_id, is_default, resource_owner) INCLUDE (must_be_domain);


--
-- Name: login_names3_users_instance_user_name_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX login_names3_users_instance_user_name_idx ON projections.login_names3_users USING btree (instance_id, user_name) INCLUDE (resource_owner);


--
-- Name: login_names3_users_lnu_instance_ro_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX login_names3_users_lnu_instance_ro_id_idx ON projections.login_names3_users USING btree (instance_id, resource_owner, id) INCLUDE (user_name);


--
-- Name: login_names3_users_search; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX login_names3_users_search ON projections.login_names3_users USING btree (instance_id, user_name_lower) INCLUDE (resource_owner);


--
-- Name: login_policies5_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX login_policies5_owner_removed_idx ON projections.login_policies5 USING btree (owner_removed);


--
-- Name: mail_templates2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX mail_templates2_owner_removed_idx ON projections.mail_templates2 USING btree (owner_removed);


--
-- Name: message_texts2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX message_texts2_owner_removed_idx ON projections.message_texts2 USING btree (owner_removed);


--
-- Name: org_domains2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX org_domains2_owner_removed_idx ON projections.org_domains2 USING btree (owner_removed);


--
-- Name: org_members4_om_instance_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX org_members4_om_instance_idx ON projections.org_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: org_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX org_members4_user_id_idx ON projections.org_members4 USING btree (user_id);


--
-- Name: org_metadata2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX org_metadata2_owner_removed_idx ON projections.org_metadata2 USING btree (owner_removed);


--
-- Name: orgs1_domain_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX orgs1_domain_idx ON projections.orgs1 USING btree (primary_domain);


--
-- Name: orgs1_name_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX orgs1_name_idx ON projections.orgs1 USING btree (name);


--
-- Name: password_age_policies2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX password_age_policies2_owner_removed_idx ON projections.password_age_policies2 USING btree (owner_removed);


--
-- Name: password_complexity_policies2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX password_complexity_policies2_owner_removed_idx ON projections.password_complexity_policies2 USING btree (owner_removed);


--
-- Name: personal_access_tokens3_creation_date_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX personal_access_tokens3_creation_date_idx ON projections.personal_access_tokens3 USING btree (creation_date);


--
-- Name: personal_access_tokens3_expiration_date_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX personal_access_tokens3_expiration_date_idx ON projections.personal_access_tokens3 USING btree (expiration);


--
-- Name: personal_access_tokens3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX personal_access_tokens3_owner_removed_idx ON projections.personal_access_tokens3 USING btree (owner_removed);


--
-- Name: personal_access_tokens3_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX personal_access_tokens3_resource_owner_idx ON projections.personal_access_tokens3 USING btree (resource_owner);


--
-- Name: personal_access_tokens3_user_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX personal_access_tokens3_user_id_idx ON projections.personal_access_tokens3 USING btree (user_id);


--
-- Name: privacy_policies4_owner_removed_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX privacy_policies4_owner_removed_idx ON projections.privacy_policies4 USING btree (owner_removed);


--
-- Name: project_grant_members4_pgm_instance_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX project_grant_members4_pgm_instance_idx ON projections.project_grant_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: project_grant_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX project_grant_members4_user_id_idx ON projections.project_grant_members4 USING btree (user_id);


--
-- Name: project_grants4_granted_org_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX project_grants4_granted_org_idx ON projections.project_grants4 USING btree (granted_org_id);


--
-- Name: project_grants4_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX project_grants4_resource_owner_idx ON projections.project_grants4 USING btree (resource_owner);


--
-- Name: project_members4_pm_instance_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX project_members4_pm_instance_idx ON projections.project_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: project_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX project_members4_user_id_idx ON projections.project_members4 USING btree (user_id);


--
-- Name: projects4_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX projects4_resource_owner_idx ON projections.projects4 USING btree (resource_owner);


--
-- Name: sessions8_user_agent_fingerprint_id_idx_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX sessions8_user_agent_fingerprint_id_idx_idx ON projections.sessions8 USING btree (user_agent_fingerprint_id);


--
-- Name: sessions8_user_id_idx_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX sessions8_user_id_idx_idx ON projections.sessions8 USING btree (user_id);


--
-- Name: user_auth_methods5_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX user_auth_methods5_resource_owner_idx ON projections.user_auth_methods5 USING btree (resource_owner);


--
-- Name: user_grants5_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX user_grants5_resource_owner_idx ON projections.user_grants5 USING btree (resource_owner);


--
-- Name: user_grants5_user_id_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX user_grants5_user_id_idx ON projections.user_grants5 USING btree (user_id);


--
-- Name: user_metadata5_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX user_metadata5_resource_owner_idx ON projections.user_metadata5 USING btree (resource_owner);


--
-- Name: users14_humans_email_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX users14_humans_email_idx ON projections.users14_humans USING btree (instance_id, lower(email));


--
-- Name: users14_notifications_email_search; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX users14_notifications_email_search ON projections.users14_notifications USING btree (instance_id, verified_email_lower);


--
-- Name: users14_resource_owner_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX users14_resource_owner_idx ON projections.users14 USING btree (resource_owner);


--
-- Name: users14_username_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX users14_username_idx ON projections.users14 USING btree (username);


--
-- Name: web_keys1_web_key_state_idx; Type: INDEX; Schema: projections; Owner: -
--

CREATE INDEX web_keys1_web_key_state_idx ON projections.web_keys1 USING btree (instance_id, state);


--
-- Name: river_job_args_index; Type: INDEX; Schema: queue; Owner: -
--

CREATE INDEX river_job_args_index ON queue.river_job USING gin (args);


--
-- Name: river_job_kind; Type: INDEX; Schema: queue; Owner: -
--

CREATE INDEX river_job_kind ON queue.river_job USING btree (kind);


--
-- Name: river_job_metadata_index; Type: INDEX; Schema: queue; Owner: -
--

CREATE INDEX river_job_metadata_index ON queue.river_job USING gin (metadata);


--
-- Name: river_job_prioritized_fetching_index; Type: INDEX; Schema: queue; Owner: -
--

CREATE INDEX river_job_prioritized_fetching_index ON queue.river_job USING btree (state, queue, priority, scheduled_at, id);


--
-- Name: river_job_state_and_finalized_at_index; Type: INDEX; Schema: queue; Owner: -
--

CREATE INDEX river_job_state_and_finalized_at_index ON queue.river_job USING btree (state, finalized_at) WHERE (finalized_at IS NOT NULL);


--
-- Name: river_job_unique_idx; Type: INDEX; Schema: queue; Owner: -
--

CREATE UNIQUE INDEX river_job_unique_idx ON queue.river_job USING btree (unique_key) WHERE ((unique_key IS NOT NULL) AND (unique_states IS NOT NULL) AND queue.river_job_state_in_bitmask(unique_states, state));


--
-- Name: objects_federated_logout_pkey; Type: INDEX ATTACH; Schema: cache; Owner: -
--

ALTER INDEX cache.objects_pkey ATTACH PARTITION cache.objects_federated_logout_pkey;


--
-- Name: objects_id_p_form_callback_pkey; Type: INDEX ATTACH; Schema: cache; Owner: -
--

ALTER INDEX cache.objects_pkey ATTACH PARTITION cache.objects_id_p_form_callback_pkey;


--
-- Name: string_keys_federated_logout_cache_name_object_id_idx; Type: INDEX ATTACH; Schema: cache; Owner: -
--

ALTER INDEX cache.string_keys_object_id_idx ATTACH PARTITION cache.string_keys_federated_logout_cache_name_object_id_idx;


--
-- Name: string_keys_federated_logout_pkey; Type: INDEX ATTACH; Schema: cache; Owner: -
--

ALTER INDEX cache.string_keys_pkey ATTACH PARTITION cache.string_keys_federated_logout_pkey;


--
-- Name: string_keys_id_p_form_callback_cache_name_object_id_idx; Type: INDEX ATTACH; Schema: cache; Owner: -
--

ALTER INDEX cache.string_keys_object_id_idx ATTACH PARTITION cache.string_keys_id_p_form_callback_cache_name_object_id_idx;


--
-- Name: string_keys_id_p_form_callback_pkey; Type: INDEX ATTACH; Schema: cache; Owner: -
--

ALTER INDEX cache.string_keys_pkey ATTACH PARTITION cache.string_keys_id_p_form_callback_pkey;


--
-- Name: actions3 count_action_v1; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_action_v1 AFTER INSERT OR DELETE ON projections.actions3 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'action_v1');


--
-- Name: executions1 count_execution; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_execution AFTER INSERT OR DELETE ON projections.executions1 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'execution');


--
-- Name: executions1_targets count_execution_target; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_execution_target AFTER INSERT OR DELETE ON projections.executions1_targets FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'execution_target');


--
-- Name: instance_members4 count_iam_admin; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_iam_admin AFTER INSERT OR DELETE ON projections.instance_members4 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'resource_owner', 'iam_admin');


--
-- Name: idps3 count_identity_provider; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_identity_provider AFTER INSERT OR DELETE ON projections.idps3 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'identity_provider');


--
-- Name: idp_templates6_ldap2 count_identity_provider_ldap; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_identity_provider_ldap AFTER INSERT OR DELETE ON projections.idp_templates6_ldap2 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'identity_provider_ldap');


--
-- Name: lockout_policies3 count_lockout_policy; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_lockout_policy AFTER INSERT OR DELETE ON projections.lockout_policies3 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'lockout_policy');


--
-- Name: login_policies5 count_login_policy; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_login_policy AFTER INSERT OR DELETE ON projections.login_policies5 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'login_policy');


--
-- Name: orgs1 count_organization; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_organization AFTER INSERT OR DELETE ON projections.orgs1 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'organization');


--
-- Name: password_complexity_policies2 count_password_complexity_policy; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_password_complexity_policy AFTER INSERT OR DELETE ON projections.password_complexity_policies2 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'password_complexity_policy');


--
-- Name: password_age_policies2 count_password_expiry_policy; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_password_expiry_policy AFTER INSERT OR DELETE ON projections.password_age_policies2 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('instance', 'instance_id', 'instance_id', 'password_expiry_policy');


--
-- Name: projects4 count_project; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_project AFTER INSERT OR DELETE ON projections.projects4 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('organization', 'instance_id', 'resource_owner', 'project');


--
-- Name: users14 count_user; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER count_user AFTER INSERT OR DELETE ON projections.users14 FOR EACH ROW EXECUTE FUNCTION projections.count_resource('organization', 'instance_id', 'resource_owner', 'user');


--
-- Name: instances delete_parent_counts_trigger; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER delete_parent_counts_trigger AFTER DELETE ON projections.instances FOR EACH ROW EXECUTE FUNCTION projections.delete_parent_counts('instance', 'id', 'id');


--
-- Name: orgs1 delete_parent_counts_trigger; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER delete_parent_counts_trigger AFTER DELETE ON projections.orgs1 FOR EACH ROW EXECUTE FUNCTION projections.delete_parent_counts('organization', 'instance_id', 'id');


--
-- Name: actions3 truncate_action_v1_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_action_v1_counts AFTER TRUNCATE ON projections.actions3 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: executions1 truncate_execution_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_execution_counts AFTER TRUNCATE ON projections.executions1 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: executions1_targets truncate_execution_target_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_execution_target_counts AFTER TRUNCATE ON projections.executions1_targets FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: instance_members4 truncate_iam_admin_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_iam_admin_counts AFTER TRUNCATE ON projections.instance_members4 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: idps3 truncate_identity_provider_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_identity_provider_counts AFTER TRUNCATE ON projections.idps3 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: idp_templates6_ldap2 truncate_identity_provider_ldap_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_identity_provider_ldap_counts AFTER TRUNCATE ON projections.idp_templates6_ldap2 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: lockout_policies3 truncate_lockout_policy_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_lockout_policy_counts AFTER TRUNCATE ON projections.lockout_policies3 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: login_policies5 truncate_login_policy_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_login_policy_counts AFTER TRUNCATE ON projections.login_policies5 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: orgs1 truncate_organization_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_organization_counts AFTER TRUNCATE ON projections.orgs1 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: password_complexity_policies2 truncate_password_complexity_policy_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_password_complexity_policy_counts AFTER TRUNCATE ON projections.password_complexity_policies2 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: password_age_policies2 truncate_password_expiry_policy_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_password_expiry_policy_counts AFTER TRUNCATE ON projections.password_age_policies2 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: projects4 truncate_project_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_project_counts AFTER TRUNCATE ON projections.projects4 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: users14 truncate_user_counts; Type: TRIGGER; Schema: projections; Owner: -
--

CREATE TRIGGER truncate_user_counts AFTER TRUNCATE ON projections.users14 FOR EACH STATEMENT EXECUTE FUNCTION projections.delete_table_counts();


--
-- Name: string_keys fk_object; Type: FK CONSTRAINT; Schema: cache; Owner: -
--

ALTER TABLE cache.string_keys
    ADD CONSTRAINT fk_object FOREIGN KEY (cache_name, object_id) REFERENCES cache.objects(cache_name, id) ON DELETE CASCADE;


--
-- Name: apps7_api_configs fk_api_configs_ref_apps7; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.apps7_api_configs
    ADD CONSTRAINT fk_api_configs_ref_apps7 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps7(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_apple fk_apple_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_apple
    ADD CONSTRAINT fk_apple_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_azure fk_azure_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_azure
    ADD CONSTRAINT fk_azure_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: keys4_certificate fk_certificate_ref_keys4; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.keys4_certificate
    ADD CONSTRAINT fk_certificate_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;


--
-- Name: executions1_targets fk_executions1_targets_execution; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.executions1_targets
    ADD CONSTRAINT fk_executions1_targets_execution FOREIGN KEY (instance_id, execution_id) REFERENCES projections.executions1(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_github_enterprise fk_github_enterprise_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_github_enterprise
    ADD CONSTRAINT fk_github_enterprise_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_github fk_github_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_github
    ADD CONSTRAINT fk_github_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_gitlab fk_gitlab_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_gitlab
    ADD CONSTRAINT fk_gitlab_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_gitlab_self_hosted fk_gitlab_self_hosted_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_gitlab_self_hosted
    ADD CONSTRAINT fk_gitlab_self_hosted_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_google fk_google_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_google
    ADD CONSTRAINT fk_google_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: sms_configs3_http fk_http_ref_sms_configs3; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.sms_configs3_http
    ADD CONSTRAINT fk_http_ref_sms_configs3 FOREIGN KEY (instance_id, sms_id) REFERENCES projections.sms_configs3(instance_id, id) ON DELETE CASCADE;


--
-- Name: smtp_configs5_http fk_http_ref_smtp_configs5; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.smtp_configs5_http
    ADD CONSTRAINT fk_http_ref_smtp_configs5 FOREIGN KEY (instance_id, id) REFERENCES projections.smtp_configs5(instance_id, id) ON DELETE CASCADE;


--
-- Name: users14_humans fk_humans_ref_users14; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.users14_humans
    ADD CONSTRAINT fk_humans_ref_users14 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users14(instance_id, id) ON DELETE CASCADE;


--
-- Name: idps3_jwt_config fk_jwt_config_ref_idps3; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idps3_jwt_config
    ADD CONSTRAINT fk_jwt_config_ref_idps3 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idps3(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_jwt fk_jwt_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_jwt
    ADD CONSTRAINT fk_jwt_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_ldap2 fk_ldap2_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_ldap2
    ADD CONSTRAINT fk_ldap2_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: users14_machines fk_machines_ref_users14; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.users14_machines
    ADD CONSTRAINT fk_machines_ref_users14 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users14(instance_id, id) ON DELETE CASCADE;


--
-- Name: users14_notifications fk_notifications_ref_users14; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.users14_notifications
    ADD CONSTRAINT fk_notifications_ref_users14 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users14(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_oauth2 fk_oauth2_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_oauth2
    ADD CONSTRAINT fk_oauth2_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idps3_oidc_config fk_oidc_config_ref_idps3; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idps3_oidc_config
    ADD CONSTRAINT fk_oidc_config_ref_idps3 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idps3(instance_id, id) ON DELETE CASCADE;


--
-- Name: apps7_oidc_configs fk_oidc_configs_ref_apps7; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.apps7_oidc_configs
    ADD CONSTRAINT fk_oidc_configs_ref_apps7 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps7(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_oidc fk_oidc_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_oidc
    ADD CONSTRAINT fk_oidc_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: keys4_private fk_private_ref_keys4; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.keys4_private
    ADD CONSTRAINT fk_private_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;


--
-- Name: keys4_public fk_public_ref_keys4; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.keys4_public
    ADD CONSTRAINT fk_public_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;


--
-- Name: apps7_saml_configs fk_saml_configs_ref_apps7; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.apps7_saml_configs
    ADD CONSTRAINT fk_saml_configs_ref_apps7 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps7(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_saml fk_saml_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.idp_templates6_saml
    ADD CONSTRAINT fk_saml_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: smtp_configs5_smtp fk_smtp_ref_smtp_configs5; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.smtp_configs5_smtp
    ADD CONSTRAINT fk_smtp_ref_smtp_configs5 FOREIGN KEY (instance_id, id) REFERENCES projections.smtp_configs5(instance_id, id) ON DELETE CASCADE;


--
-- Name: sms_configs3_twilio fk_twilio_ref_sms_configs3; Type: FK CONSTRAINT; Schema: projections; Owner: -
--

ALTER TABLE ONLY projections.sms_configs3_twilio
    ADD CONSTRAINT fk_twilio_ref_sms_configs3 FOREIGN KEY (instance_id, sms_id) REFERENCES projections.sms_configs3(instance_id, id) ON DELETE CASCADE;


--
-- Name: river_client_queue river_client_queue_river_client_id_fkey; Type: FK CONSTRAINT; Schema: queue; Owner: -
--

ALTER TABLE ONLY queue.river_client_queue
    ADD CONSTRAINT river_client_queue_river_client_id_fkey FOREIGN KEY (river_client_id) REFERENCES queue.river_client(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict PVcsfMWH5w6LZlJYoh3rd2bOVZAGIM4pSdzqAB0US8fJFyDYpGffxkS6zLpdRPv

