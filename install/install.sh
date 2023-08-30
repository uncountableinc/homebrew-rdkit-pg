#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

PG_BIN="$1"
ARCH="$2"
PG_CONFIG="$PG_BIN/pg_config"
PG_SHARE="$("$PG_CONFIG" --sharedir)"
PG_LIB="$("$PG_CONFIG" --libdir)"

date >>/tmp/run
echo "$PWD" >>/tmp/run
find . >>/tmp/run

FILES_PATH="$SCRIPT_DIR/../$ARCH"

cp "$FILES_PATH"/rdkit_pg/*.sql "$PG_SHARE/extension/"
cp "$FILES_PATH"/rdkit.control "$PG_SHARE/extension/"
cp "$FILES_PATH"/rdkit_pg/update_sql/*.sql "$PG_SHARE/extension/"
cp "$FILES_PATH"/rdkit.so "$PG_LIB/"
cp "$FILES_PATH"/rdkit.so "$PG_LIB/postgresql/"
cp "$FILES_PATH"/lib/* "$PG_LIB/"

cp "install/uninstall.sh" "$PG_BIN/uninstall_rdkit.sh"
