# Data dictionary

Schema: `university_registration`. Types and nullability reflect `001_schema.sql`.

## department

| Column | Type | Meaning / constraints |
|---|---|---|
| `department_id` | `INTEGER` | Primary key; generated identity; nullable |
| `department_name` | `VARCHAR(100)` | Attribute; NOT NULL; UNIQUE |
| `office_location` | `VARCHAR(100)` | Attribute; nullable |
| `phone_number` | `VARCHAR(30)` | Attribute; nullable |

## student

| Column | Type | Meaning / constraints |
|---|---|---|
| `student_id` | `INTEGER` | Primary key; generated identity; nullable |
| `first_name` | `VARCHAR(80)` | Attribute; NOT NULL |
| `last_name` | `VARCHAR(80)` | Attribute; NOT NULL |
| `email` | `VARCHAR(255)` | Attribute; NOT NULL; UNIQUE |
| `phone` | `VARCHAR(30)` | Attribute; nullable |
| `date_of_birth` | `DATE` | Attribute; nullable |
| `department_id` | `INTEGER` | Foreign key; NOT NULL |

## instructor

| Column | Type | Meaning / constraints |
|---|---|---|
| `instructor_id` | `INTEGER` | Primary key; generated identity; nullable |
| `first_name` | `VARCHAR(80)` | Attribute; NOT NULL |
| `last_name` | `VARCHAR(80)` | Attribute; NOT NULL |
| `email` | `VARCHAR(255)` | Attribute; NOT NULL; UNIQUE |
| `phone` | `VARCHAR(30)` | Attribute; nullable |
| `department_id` | `INTEGER` | Foreign key; NOT NULL |

## course

| Column | Type | Meaning / constraints |
|---|---|---|
| `course_id` | `INTEGER` | Primary key; generated identity; nullable |
| `course_code` | `VARCHAR(20)` | Attribute; NOT NULL; UNIQUE |
| `course_name` | `VARCHAR(150)` | Attribute; NOT NULL |
| `credit_hours` | `INTEGER` | Attribute; NOT NULL |
| `description` | `TEXT` | Attribute; nullable |
| `department_id` | `INTEGER` | Foreign key; NOT NULL |

## semester

| Column | Type | Meaning / constraints |
|---|---|---|
| `semester_id` | `INTEGER` | Primary key; generated identity; nullable |
| `semester_name` | `VARCHAR(40)` | Attribute; NOT NULL |
| `academic_year` | `INTEGER` | Attribute; NOT NULL |
| `start_date` | `DATE` | Attribute; NOT NULL |
| `end_date` | `DATE` | Attribute; NOT NULL |

## classroom

| Column | Type | Meaning / constraints |
|---|---|---|
| `classroom_id` | `INTEGER` | Primary key; generated identity; nullable |
| `building_name` | `VARCHAR(100)` | Attribute; NOT NULL |
| `room_number` | `VARCHAR(20)` | Attribute; NOT NULL |
| `capacity` | `INTEGER` | Attribute; NOT NULL |

## section

| Column | Type | Meaning / constraints |
|---|---|---|
| `section_id` | `INTEGER` | Primary key; generated identity; nullable |
| `section_number` | `VARCHAR(20)` | Attribute; NOT NULL |
| `schedule` | `VARCHAR(120)` | Attribute; NOT NULL |
| `maximum_capacity` | `INTEGER` | Attribute; NOT NULL |
| `course_id` | `INTEGER` | Foreign key; NOT NULL |
| `instructor_id` | `INTEGER` | Foreign key; NOT NULL |
| `semester_id` | `INTEGER` | Foreign key; NOT NULL |
| `classroom_id` | `INTEGER` | Foreign key; NOT NULL |

## enrollment

| Column | Type | Meaning / constraints |
|---|---|---|
| `enrollment_id` | `INTEGER` | Primary key; generated identity; nullable |
| `student_id` | `INTEGER` | Foreign key; NOT NULL |
| `section_id` | `INTEGER` | Foreign key; NOT NULL |
| `enrollment_date` | `DATE` | Attribute; NOT NULL |
| `enrollment_status` | `VARCHAR(20)` | Attribute; NOT NULL |
| `grade` | `VARCHAR(3)` | Attribute; nullable |

## enrollment_audit

| Column | Type | Meaning |
|---|---|---|
| audit_id | BIGINT | Generated primary key |
| enrollment_id | INTEGER | Audited enrollment identifier |
| old_status | VARCHAR(20) | Previous status |
| new_status | VARCHAR(20) | New status |
| changed_at | TIMESTAMPTZ | Change time |
| changed_by | TEXT | Database role |