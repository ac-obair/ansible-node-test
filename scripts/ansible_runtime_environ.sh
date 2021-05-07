#!/usr/bin/env bash

# args to this script are passed from ansible_runtime_environ.yaml as args: "$(System.PullRequest.SourceBranch) ${{ parameters.pipeline }}"
# if this script breaks with python 2.7 error, it's due a broken link and the env must be manually cleaned up on the ACS. 
# to resolve this simply rm -rf $HOME/.pyenv/versions/<YOUR_PYTHON_VERSION>/envs/<ENVIRON>

COMPLETE_BRANCH_NAME=$1
REPO_NAME=$2
SHORT_BRANCH_NAME=$(basename ${COMPLETE_BRANCH_NAME})
ENVIRON=${REPO_NAME}-${SHORT_BRANCH_NAME}

echo branch name ${COMPLETE_BRANCH_NAME}
echo repo name ${REPO_NAME}
echo branch name short ${SHORT_BRANCH_NAME}
echo environ ${ENVIRON}

pyenv virtualenvs --bare | grep ${ENVIRON} && pyenv virtualenv-delete -f ${ENVIRON} || echo Creating venv for the first time.
PYENV_VERSION=3.9.2 pyenv virtualenv -f ${ENVIRON}
cd $HOME/azure_pipelines/${REPO_NAME} && pyenv local ${ENVIRON}
