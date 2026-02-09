#!/bin/sh
set -e

host="${POSTGRES_HOST:-127.0.0.1}"
user="${POSTGRES_USER:-postgres}"
db="${POSTGRES_DB:-postgres}"

pg_isready -h "$host" -U "$user" -d "$db"
