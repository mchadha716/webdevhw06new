#!/bin/bash

export SECRET_KEY_BASE=W68eso5YQOlbtvSNUR50N/HDWj6IaEhAwMR3LtzuBEQAefwYVbX84bvoTA7XtiGi
export MIX_ENV=prod
export PORT=4794
export NODEBIN='pwd'/assets/node_modules/.bin
export PATH="$PATH:$NODEBIN"

_build/prod/rel/bullscows/bin/bullscows start
