#!/bin/bash
set -x

export PATH=$GOPATH/bin:$PATH

cd /source

if [ ! -f "go.mod" ]; then
    echo "go.mod: required"
    exit 1
fi

pkgpath=$(head -1 go.mod | cut -c8- )
if [ -z "$pkgpath" ]; then
    echo "go.mod: unable to parse module path"
    exit 1
fi

pkgdir=$GOPATH/src/$pkgpath

go mod vendor
mv vendor/* $GOPATH/src
mkdir -p $pkgdir
cp -r /source/* $pkgdir

cd $pkgdir

if [ ! -f ".golangci.yml" ]; then
    # use default
    cp /lint/.golangci.yml .golangci.yml
fi

golangci-lint run

echo "# linters finished"