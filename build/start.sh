#!/bin/sh

echo "Starting the parsing server..."
make -f /Alpino/Makefile.start_server
echo "Done!"
SCRIPTDIR=$ALPINO_HOME/Tokenization/tokenize_server

export LD_LIBRARY_PATH=${SCRIPTDIR}/..

echo "Starting the tokenizer server..."
${SCRIPTDIR}/tokenize_server &> /tokenizer.log &
echo "Done!"
