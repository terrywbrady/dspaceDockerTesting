## Note on passing working directory
- Windows 10 Powershell: ${PWD}
- MacOS: "$(pwd)"

## Create network for our DSpace components
`docker network create dspacenet`

## Build DSpace
_If you already have a local copy of Maven, run this on your desktop instead_
`docker volume create M2`
`docker run -it -v M2:/home/user/.m2 -v ${PWD}:/opt/maven -w /opt/maven maven mvn clean install`

## Create DSpace Database
_This volume will persist you database data even if you stop the database server_
`docker volume create pgdataD6`

_Start the database service - this must be done before deployment_
`docker run -it -d --network dspacenet -p 5432:5432 --name dspacedbhost -v pgdataD6:/var/lib/postgresql/data terrywbrady/dspacedb`

_Attach to the database server to query directly_
`docker exec -it --detach-keys "ctrl-p" dspacedbhost psql -U dspace`

## Create DSpace Deployment
_This volume will persist the DSpace assetstore and solr content between runs_
`docker volume create dspaceD6`

_Deploy/install DSpace_
`docker run -it --rm --network dspacenet -v ${PWD}/dspace/target/dspace-installer:/installer -v dspaceD6:/dspace -w /installer terrywbrady/dspace-docker-ant ant update clean_backups`

_Start tomcat: for speed, only xmlui and solr are currently started_
`docker run -it --network dspacenet -v dspaceD6:/dspace -p 8080:8080 --name dspacetomcat terrywbrady/dspacetomcat`

_Attach to tomcat directly to run dspace commands (/dspace/bin/dspace)_
`docker exec -it --detach-keys "ctrl-p" dspacetomcat /bin/bash`

## Open in a Browser
http://localhost:8080/xmlui
