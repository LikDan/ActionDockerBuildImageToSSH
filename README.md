# ActionDockerBuildImageToSSH

This action builds docker container using GitHub actions and copy this container to the server through ssh

Inputs ypu can provide to the container 

#

**Required** image - Image name and tag\
**Required** destination - SSH connection string

#

**Optional** context - Context where project is located (default - '.')\
**Optional** folder - Folder where Dockerfile is located (default - '.')\
**Optional** destination_key - CSSH connection key (default - '')
 
