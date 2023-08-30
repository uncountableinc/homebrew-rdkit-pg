#!/usr/bin/env bash

PG_BIN="$1"
ARCH="$2"
PG_CONFIG="$PG_BIN/pg_config"
PG_SHARE="$("$PG_CONFIG" --sharedir)"
PG_LIB="$("$PG_CONFIG" --libdir)"

if [[ -z "$PG_SHARE" ]] || [[ -z "$PG_LIB" ]]; then
   exit 1
fi

rm -v "$PG_SHARE/extension/rdkit*" || true
rm -v "$PG_LIB/libRDKit*" || true
rm -v "$PG_LIB/rdkit.so" || true
rm -v "$PG_LIB/postgresql/rdkit.so" || true
