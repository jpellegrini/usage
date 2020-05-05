#!/bin/bash
set -eu -o pipefail
cd "$(dirname "$0")"
curl --fail --silent --show-error --location \
    https://github.com/gambit/gambit/archive/master.tar.gz |
    gunzip |
    tar -tf - |
    grep -oE 'gambit-master/lib/srfi/[0-9]+' |
    sed 's@%3a@@' |
    grep -oE '[0-9]+' |
    sort -g |
    uniq >gambit-head.scm
