#!/bin/bash
TEMPLATE_ID="$1"
set -e

SRC_DIR="/tmp/${TEMPLATE_ID}"
echo "Running Smoke Test"

ID_LABEL="test-container=${TEMPLATE_ID}"

COMMAND_TO_EXECUTE='set -e && if [ -f "test-project/test.sh" ]; then cd test-project && if [ "$(id -u)" = "0" ]; then chmod +x test.sh; else sudo chmod +x test.sh; fi && ./test.sh; else ls -a; fi'

# Execute test and store exit code
set +e
npx devcontainer exec --workspace-folder "${SRC_DIR}" --id-label ${ID_LABEL} /bin/sh -c "${COMMAND_TO_EXECUTE}"
EXIT_CODE=$?
set -e

# Clean up
docker rm -f $(docker container ls -f "label=${ID_LABEL}" -q)
rm -rf "${SRC_DIR}"

if [ $EXIT_CODE -ne 0 ]; then
    echo "Tests failed for template '${TEMPLATE_ID}' with exit code ${EXIT_CODE}"
    exit $EXIT_CODE
fi

echo "Tests passed for template '${TEMPLATE_ID}'"
