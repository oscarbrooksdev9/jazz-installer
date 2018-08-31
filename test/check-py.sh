#!/usr/bin/env bash

if [[ -z "$TRAVIS_PULL_REQUEST_BRANCH" ]]; then
  BRANCH="$TRAVIS_PULL_REQUEST_BRANCH"
else
  BRANCH="master"
fi

for file in $(git diff --name-only $BRANCH | grep .py\$); do
  flake8 "$file"
done
