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

# To run: 
```bash
awsdocker docker run -t -i --rm \
-e AWS_KEY='<redacted>' \
-e SECRET_KEY='<redacted>' \
-e SESSION_TOKEN='<redacted>' \
--name awsdocker_container awsdocker awsscript.sh
```

* creates a container named 'awsdocker_container',
* Removes the container when done
* Goes interactive (-i)
* Attaches to TTY (-t)
* THe name of the image to create a container from
* Command to run: 'awsscript.sh'

# To remove image:
`docker rmi awsdocker`