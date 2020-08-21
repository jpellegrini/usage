#!/bin/bash
set -eu -o pipefail
cd "$(dirname "$0")"
curl --fail --silent --show-error --location \
    https://github.com/egallesio/STklos/archive/stklos-1.50.tar.gz |
    gunzip |
    tar -xf - --to-stdout 'STklos-stklos-1.50/doc/skb/srfi.stk' |
    grep -oE '^ +.?\(?\([0-9]+ +\. "' |
    grep -oE '[0-9]+' |
    sort -g |
    uniq >stklos.scm
