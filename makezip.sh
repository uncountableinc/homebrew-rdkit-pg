RDKIT_VER="$1"
RDKIT_REPO="$2"
RDKIT_BUILD="$3"

if [[ -z "$RDKIT_VER" ]] || [[ -z "$RDKIT_BUILD" ]] || [[ -z "$RDKIT_REPO" ]] ; then
  echo "./makzip.sh <rdkit_ver> <rdkit_build_dir> <rdkit_repo_dir>"
  exit 1
fi

ARCH=$(arch)
if [[ "$ARCH" = "i386" ]]; then
   # Actually x86_64, there is no 32bit mac?
   ARCH="x86_64"
fi

rm -rf "./$ARCH"
mkdir -p "$ARCH/rdkit_pg/update_sql"

cp -v $RDKIT_BUILD/Code/PgSQL/rdkit/*.sql "$ARCH/rdkit_pg/"
cp -v $RDKIT_BUILD/Code/PgSQL/rdkit/update_sql/*.sql "$ARCH/rdkit_pg/update_sql"
cp -v "$RDKIT_REPO/Code/PgSQL/rdkit/rdkit.control" "$ARCH/"
cp -v "$RDKIT_BUILD/Code/PgSQL/rdkit/rdkit.so" "$ARCH/"
cp -vr "$RDKIT_BUILD/lib" "$ARCH/lib"

zip -r rdkit-pg_${RDKIT_VER}_${ARCH}.zip install ${ARCH}

