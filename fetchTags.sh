#!/bin/bash

cd $GITHUB_WORKSPACE

git fetch --tags

currentTag=$(git describe --tags)

tickets=$(git log --pretty="%s" \
    $(git tag --sort=-creatordate | head -n 2 | tail -n 1)..$(git tag --sort=-creatordate | head -n 1 | tail -n 1) \
    | grep -oE "[A-Z]+-[0-9]+" \
    | sort \
    | uniq \
    | sed 's/^\|$/"/g'|paste -sd, -)

echo "::set-output name=tIDs::$tickets"
echo "::set-output name=tagName::$currentTag"
