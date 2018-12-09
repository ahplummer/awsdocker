# Introduction
This is a working example of several things:
1. Shows how to pass env vars into docker container at runtime.
2. Shows how to execute AWS commands from within docker, bringing the STOUT to the calling host.  (JSON output emitting from the running container.)
3. This is designed to run against a pre-authenticated AWS SAML user (via the host).
4. This example also runs with a regular service account (non SAML) via 'key/secret' combination.

# Staging things
* Authenticate to AWS via SAML
* Take note of the three strings located in ~/.aws/credentials. These will be passed in as parms into the docker container at runtime.
  
# To build:
`docker build -t awsdocker:latest .`

# To run the enclosed awsscript.sh, and immediately exit: 
```bash
awsdocker docker run -t -i --rm \
-e AWS_KEY='<redacted>' \
-e SECRET_KEY='<redacted>' \
-e SESSION_TOKEN='<redacted>' \
--name awsdocker_container awsdocker awsscript.sh
```
# To run the enclosed pgsqlscript, and immediately exit: 
```bash
awsdocker docker run -t -i --rm \
-e PGUSER='<redacted>' \
-e PGDB='<redacted>'
-e PGPASS='<redacted>' \
-e PGINSTANCE='<redacted>' \
--name awsdocker_container awsdocker pgsqlscript
```


# To run, starting at the commandline, for debugging, or building on:
```bash
awsdocker docker run -t -i --rm \
-e AWS_KEY='<redacted>' \
-e SECRET_KEY='<redacted>' \
-e SESSION_TOKEN='<redacted>' \
-e PGUSER='<redacted>' \
-e PGDB='<redacted>'
-e PGPASS='<redacted>' \
-e PGINSTANCE='<redacted>' \
--name awsdocker_container awsdocker bash
```

* creates a container named 'awsdocker_container',
* Removes the container when done
* Goes interactive (-i)
* Attaches to TTY (-t)
* THe name of the image to create a container from
* Command to run: 'awsscript.sh'

## BASH Shenanigans
* PGSQL - to test PGSQL related up-time, a script is in 'src' that will test Postgres connectivity.  
`./pgsqlscript.sh`

* AWS - to test AWS connectivity, a script is in 'src':
`./awsscript.sh`

# To remove image:
`docker rmi awsdocker`
