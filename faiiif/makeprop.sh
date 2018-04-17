#!/bin/sh

CANT=$1
JETTY=$2

echo "CANT:  ${CANT}"
echo "JETTY: ${JETTY}"

P=/projects/File-Analyzer-Test-Data/iiif/dog-photos/
S1="s%https://YOUR-IMAGE-SERVER-URL/project-path%http://${CANT}/dog-photos%g"
S2="s%# ManifestRoot: https://YOUR-IMAGE-SERVER-URL/manifest-path%ManifestRoot: http://${JETTY}/manifests%g"
S3="s%//YOUR-SERVER-PATH/IIIF/manifests%/home/user/jetty/webapps/manifests%g"

sed -e "${S1}" -e "${S2}" -e "${S3}" $P/manifestGenerate.template.prop > $P/manifestGenerate.prop