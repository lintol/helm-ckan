{{/* vim: set filetype=dosini: */}}
{{/*
Set up the primary CKAN configuration file
*/}}
{{- define "initializeSh" -}}
    #!/bin/sh

    source /usr/lib/ckan/venv/./src/ckan/contrib/docker/postgresql/docker-entrypoint-initdb.d/00_create_datastore.sh
    /usr/lib/ckan/venv/bin/python2 /usr/local/bin/ckan-paster --plugin=ckan datastore set-permissions -c /etc/ckan/production.ini | psql -U ckan

    /usr/lib/ckan/venv/bin/python2 /usr/local/bin/ckan-paster --plugin=ckanext-validation validation init-db -c /etc/ckan/production.ini
    echo "y
    info@example.org
    password
    password
    " | /usr/lib/ckan/venv/bin/python2 /usr/local/bin/ckan-paster --plugin=ckan sysadmin add johndoe -c /etc/ckan/production.ini

{{- end -}}
