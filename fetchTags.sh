#!/bin/bash

cd $GITHUB_WORKSPACE

# Fix for: https://github.com/actions/checkout/issues/766 (git CVE-2022-24765)
git config --global --add safe.directory "$GITHUB_WORKSPACE"

git fetch --tags

currentTag=$(git describe --tags)
echo "currentTag: $currentTag"

if [[ -z "$TAG_MATCHER" ]]; then
   export TAG_MATCHER=".*"
fi
echo "TAG_MATCHER: '$TAG_MATCHER'"

if [[ "$currentTag" =~ $TAG_MATCHER ]]; then
  beforeTag=$(git tag --sort=-creatordate | grep "$TAG_MATCHER" | head -n 2 | tail -n 1)
  echo "beforeTag: $beforeTag"

  tickets=$(git log --pretty="%s" \
    "$beforeTag".."$currentTag" |
     grep -oE "[A-Z]+-[0-9]+" |
     sort |
     uniq |
     paste -sd, -)
fi

echo "::set-output name=tIDs::$tickets"
echo "::set-output name=tagName::$currentTag"
