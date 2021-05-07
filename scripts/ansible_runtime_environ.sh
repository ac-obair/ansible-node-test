#!/usr/bin/env bash

BRANCH_NAME=$(basename $(System.PullRequest.SourceBranch))
pyenv virtualenvs --bare | grep ${{ parameters.pipeline }}-${BRANCH_NAME} && pyenv virtualenv-delete -f ${{ parameters.pipeline }}-${BRANCH_NAME} || echo Creating venv for the first time.
PYENV_VERSION=3.9.2 pyenv virtualenv -f ${{ parameters.pipeline }}-${BRANCH_NAME}
cd $HOME/azure_pipelines/${{ parameters.pipeline }} && pyenv local ${{ parameters.pipeline }}-${BRANCH_NAME}
