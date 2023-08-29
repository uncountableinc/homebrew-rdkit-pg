#!/usr/bin/env bash

PG_BIN="$1"
ARCH="$2"
PG_CONFIG="$PG_BIN/pg_config"
PG_SHARE="$("$PG_CONFIG" --sharedir)"
PG_LIB="$("$PG_CONFIG" --libdir)"

cp "$ARCH"/rdkit_pg/*.sql "$PG_SHARE/extension/"
cp "$ARCH"/rdkit.control "$PG_SHARE/extension/"
cp "$ARCH"/rdkit_pg/update_sql/*.sql "$PG_SHARE/extension/"
cp "$ARCH"/rdkit.so "$PG_LIB/"
cp "$ARCH"/rdkit.so "$PG_LIB/postgresql/"
cp "$ARCH"/lib/* "$PG_LIB/"

cp "install/uninstall.sh" "$PG_BIN/uninstall_rdkit.sh"
