# University Course Registration and Department Management System

CIT 406 Database Design · Atlantis University · Final project repository · October 22, 2026
## Scope
Eight core relations: department, student, instructor, course, semester, classroom, section, enrollment. The optional audit table is created by 003_logic.sql. The ERD in ERD.mmd describes the project tables and relationships.

## Rebuild from scratch (PostgreSQL / Supabase)
1. Create a new, empty PostgreSQL database or Supabase project. Back up existing work first.
2. Open PostgreSQL SQL Editor, pgAdmin, or psql.
3. Run these files in the following order:
   - 001_schema.sql
   - 002_seed.sql
   - 003_logic.sql
   - 004_indexes.sql
   - 005_security.sql
4. Run smoke_test.sql to verify the database.
5. Run portfolio.sql to test the project queries.
6. Open ERD.mmd in a Mermaid-compatible viewer to view the ER diagram.

For command-line execution, use: `psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f 001_schema.sql` and repeat for each remaining SQL file in order. Never commit database passwords or connection strings containing credentials.


**Warning:** `002_seed.sql` uses explicit sample IDs and is intended for a clean database; rerunning it may fail with duplicate-key errors. For a full reset **only in a disposable project database**, run `DROP SCHEMA IF EXISTS university_registration CASCADE;` and repeat all migrations. This permanently removes project data.

## Security
Migration 005 denies PUBLIC privileges and enables RLS on student, instructor, enrollment, and audit tables. No end-user read policies are installed because a verified authentication-to-student mapping is not part of the source schema. The schema is suitable for administrative testing; production use requires explicit least-privilege grants, per-user RLS policies, and a review of view privileges.

## Limitations / validation
The scripts have been assembled from project source materials but **not executed against a live database here**. Capacity limits and scheduling conflicts require further enforcement; the capacity view reports counts but does not prevent over-enrollment. This package is not proof of a successful live deployment. Verify before submitting.
