#!/bin/bash
set -e

# Switch environment for pritunl-web
# Usage: ./use-env.sh [local|production]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
ENV_DIR="${PROJECT_DIR}/.env_directory"

ENV_TYPE="${1:-local}"

echo "pritunl-web: Activate ${ENV_TYPE}"

case "${ENV_TYPE}" in
    local)
        LOCAL_ENV="${ENV_DIR}/local/.env"
        if [ ! -f "$LOCAL_ENV" ]; then
            echo "Local env not found. Create from examples."
            exit 1
        fi
        cp "${LOCAL_ENV}" "${PROJECT_DIR}/.env"
        echo "Activated local environment"
        ;;
    production)
        TEMP_FILE=$(mktemp)
        for file in "${ENV_DIR}/production"/*.env; do
            [ -f "$file" ] && grep -v '^#' "$file" | grep -v '^$' >> "${TEMP_FILE}"
        done
        [ -s "${TEMP_FILE}" ] && tac "${TEMP_FILE}" | awk -F= '!seen[$1]++' | tac > "${PROJECT_DIR}/.env"
        rm -f "${TEMP_FILE}"
        echo "Activated production environment"
        ;;
    *)
        echo "Usage: $0 [local|production]"
        exit 1
        ;;
esac
