#!/usr/bin/env bash
# stop on all errors
set -euf -o pipefail
set -x

AUTHOR="${NCHART_FULL_NAME} <${NCHART_ACCOUNT_NAME}@${NCHART_ORGANIZATION}>"

# first argument
UUID="${@}"

# validate lowercase UUID
scripts/validate_uuid.sh "${UUID}"

CHARTDIR="${NCHART_SCRATCH}/${UUID}"

# copy standard chart template
cp -R templates/root/ "${CHARTDIR}"

# create empty commit
git -C "${CHARTDIR}" commit -q -a --allow-empty --no-edit \
  -m "Initialized Chart" --author="${AUTHOR}"

echo "Initialized chart located: ${CHARTDIR}"
