#!/usr/bin/env bash

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null 2>&1 && pwd )"
TEST_RUNNER=${PROJECT_DIR}/test/test.py

# UPDATE THESE AS NEEDED
MODULE_DIR=${PROJECT_DIR}/skeleton
MINIMUM_COVERAGE=100

source venv/bin/activate


echo "Running Unit Tests."
coverage run --source="${MODULE_DIR}" "${TEST_RUNNER}"
EXIT_CODE=$?

if [[ ${EXIT_CODE} == 0 ]]
then
  coverage report -m --fail-under=${MINIMUM_COVERAGE}
  EXIT_CODE=$?

  if [[ ${EXIT_CODE} == 0 ]]
  then
    echo "Success: Tests Passed and Coverage is ${MINIMUM_COVERAGE}%."
  else
    echo "Failed: Coverage is less than the required ${MINIMUM_COVERAGE}%."
    exit ${EXIT_CODE}
  fi
else
  echo "Failed: Not all unit tests passed."
  exit ${EXIT_CODE}
fi


echo
echo "Running Code Quality Tests (flake8)."
flake8
EXIT_CODE=$?

if [[ ${EXIT_CODE} == 0 ]]
then
  echo "Success: No code quality issues detected."
else
  echo "Failed: Please resolve flake8 code quality issues."
  exit ${EXIT_CODE}
fi
