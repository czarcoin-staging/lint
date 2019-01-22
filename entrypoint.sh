#!/bin/bash

# export GOMOD=/modcache
export PATH=$GOPATH/bin:$PATH

cd /source

# todo check for existence of go.mod

pkgpath=$(head -1 go.mod | cut -c8- )
echo "Package path: " $pkgpath
pkgdir=$GOPATH/src/$pkgpath

go mod vendor
mv vendor/* $GOPATH/src
mkdir -p $pkgdir
cp -r /source/* $pkgdir

cd $pkgdir

tree $GOPATH/src
golangci-lint run