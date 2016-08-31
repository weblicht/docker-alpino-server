#!/bin/sh

SCRIPTDIR=$ALPINO_HOME/Tokenization/tokenize_server

export LD_LIBRARY_PATH=${SCRIPTDIR}/..

echo "Starting the tokenizer server..."
${SCRIPTDIR}/tokenize_server 
