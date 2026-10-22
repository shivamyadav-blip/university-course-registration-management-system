-- Defense-in-depth: deny anonymous access; enable RLS on sensitive tables.
-- Run as database owner. PostgreSQL owners and privileged service roles may bypass RLS.
REVOKE ALL ON SCHEMA university_registration FROM PUBLIC;
REVOKE ALL ON ALL TABLES IN SCHEMA university_registration FROM PUBLIC;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA university_registration FROM PUBLIC;
ALTER TABLE university_registration.student ENABLE ROW LEVEL SECURITY;
ALTER TABLE university_registration.instructor ENABLE ROW LEVEL SECURITY;
ALTER TABLE university_registration.enrollment ENABLE ROW LEVEL SECURITY;
ALTER TABLE university_registration.enrollment_audit ENABLE ROW LEVEL SECURITY;
-- No public policies: default deny for non-owner roles. Application-specific policies
-- must be added only after an authenticated user-to-student identity mapping exists.
-- Do not grant broad access to roster views: PostgreSQL views can execute as their owner.
