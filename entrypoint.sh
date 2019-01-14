#!/bin/bash

# export GOMOD=/modcache
export PATH=$GOPATH/bin:$PATH

cd /source

# todo check for existence of go.mod

pkgpath=$(head -1 go.mod | cut -c8- )
pkgdir=$GOPATH/src/$packagename

go mod vendor
mv vendor/ $GOPATH/src
cp -r /source $pkgdir

cd $pkgdir

golangci-lint run