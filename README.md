# Music DB

A PostgreSQL database project for a music streaming app, built as part of a Database Engineer learning roadmap.

## Database Schema

6 tables:
- **singers** — artists with name, country, and birth date
- **albums** — albums linked to singers
- **songs** — songs linked to albums with genre
- **users** — app users
- **playlists** — playlists created by users
- **playlist_songs** — junction table linking playlists and songs

## Files

- `schema.sql` — CREATE TABLE statements and sample data
- `queries.sql` — 10 practice queries with comments

## Skills Practiced

- Table design with primary keys, foreign keys, and constraints
- JOIN across multiple tables
- GROUP BY, HAVING, ORDER BY
- Subqueries with NOT IN
- LEFT JOIN
- COUNT with DISTINCT

## Tools Used

- PostgreSQL 16
- pgAdmin 4
- Claude Code
