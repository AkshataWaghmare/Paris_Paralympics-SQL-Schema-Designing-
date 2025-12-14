# Paris_Paralympics (SQL Schema Designing)

This repository contains a relational SQL database project based on Paris Paralympics data. The project focuses on database design, schema normalization, and meaningful data relationships between athletes, events, disciplines, teams, coaches, and medals.

It is designed as a portfolio-ready SQL project suitable for GitHub, interviews, and academic submissions.


## 🗄️ Database Information

- Database Name: Paris_Paralympics

- SQL Dialect: MySQL (compatible with most relational databases)
## 📐 Schema Design

The database schema is fully normalized and includes primary keys, foreign keys, and many-to-many relationships.
## 🧱 Tables Included

## 1. Disciplines

Stores sports disciplines.

- Discipline_id (PK)

- Discipline_name

## 2. Athletes

Stores athlete details.

- Athlete_id (PK)

- Athlete_name

- Gender

- Classification

- NOC

- Discipline_id (FK)

## 3. Events

Stores event-level information.

- Event_id (PK)

- Event_name

- Classification

- Discipline_id (FK)

## 4. Teams

Stores team data.

- Team_id (PK)

- Team_name

- Discipline_id (FK)

## 5. Athlete_Team

Junction table for many-to-many relationship between athletes and teams.

- Athlete_id (PK, FK)

- Team_id (PK, FK)

## 6. Coaches

Stores coach details.

- Coach_id (PK)

- Coach_name

- Discipline_id (FK)

## 7. Medals 

Stores medal records for athletes and teams.

- Medal_No (PK)

- Medal_type

- Event_id (FK)

- Athlete_id (FK)

- Team_id (FK)
## 🔗 Relationships

- One discipline → many athletes, events, teams, and coaches

- Athletes ↔ Teams → many-to-many (via Athlete_Team)

- Events → linked to disciplines

- Medals → linked to events, athletes, and teams
## Author

- Akshata Waghmare
  
(SQL and Database Enthusiast)

