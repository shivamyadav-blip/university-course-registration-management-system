# University Course Registration and Department Management System

CIT 406 Database Design · Atlantis University · Final project repository · October 22, 2026

## Scope
Eight core relations: department, student, instructor, course, semester, classroom, section, enrollment. The optional audit table is created by migration 003. The ERD in `docs/ERD.mmd` matches the tables and foreign keys in these migrations.

## Rebuild from scratch (PostgreSQL / Supabase)
1. Create a **new, empty** PostgreSQL database or Supabase project. Back up existing work first.
2. Open a PostgreSQL client (`psql`, pgAdmin, or Supabase SQL Editor) with permission to create schemas.
3. Run files **in this order**, each once:
   - `migrations/001_schema.sql`
   - `migrations/002_seed.sql`
   - `migrations/003_logic.sql`
   - `migrations/004_indexes.sql`
   - `migrations/005_security.sql`
4. Run `tests/smoke_test.sql` and `queries/portfolio.sql` to inspect results.
5. Open `docs/ERD.mmd` in a Mermaid-compatible renderer to view the ER diagram.

With psql from the repository root: `psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f migrations/001_schema.sql` and repeat with each remaining migration in order. Do not paste a real database password into the repository.

**Warning:** `002_seed.sql` uses explicit sample IDs and is intended for a clean database; rerunning it may fail with duplicate-key errors. For a full reset **only in a disposable project database**, run `DROP SCHEMA IF EXISTS university_registration CASCADE;` and repeat all migrations. This permanently removes project data.

## Security
Migration 005 denies PUBLIC privileges and enables RLS on student, instructor, enrollment, and audit tables. No end-user read policies are installed because a verified authentication-to-student mapping is not part of the source schema. The schema is suitable for administrative testing; production use requires explicit least-privilege grants, per-user RLS policies, and a review of view privileges.

## Limitations / validation
The scripts have been assembled from project source materials but **not executed against a live database here**. Capacity limits and scheduling conflicts require further enforcement; the capacity view reports counts but does not prevent over-enrollment. This package is not proof of a successful live deployment. Verify before submitting.
