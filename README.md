A Dockerfile for Alpino parser in server mode.
============

Both a paser and a tokenizer are running on port 42424 and 42425 respectively.

## Usage
```bash
docker run -d --restart always --name alpino -p 42424:42424 -p 42425:42425 weblicht/alpino:latest
```
This will start a server with name alpino. The server listens on port 42424 and 42425.
