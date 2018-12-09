#!/bin/bash
if [ ! -z "$PGUSER" ] && [ ! -z "$PGPASS" ] && [ ! -z "$PGINSTANCE" ] && [ ! -z "$PGDB" ]; then
    psql postgresql://$PGUSER:$PGPASS@$PGINSTANCE/$PGDB -c "SELECT 1 FROM pg_database where datname='$PGDB';"
fi
