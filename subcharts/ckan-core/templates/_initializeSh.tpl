{{/* vim: set filetype=sh: */}}
{{/*
Set up the primary CKAN configuration file
*/}}
{{- define "initializeSh" -}}
    #!/bin/sh

    echo 1

    /usr/lib/ckan/venv/bin/python2 /usr/local/bin/ckan-paster --plugin=ckan datastore set-permissions -c /etc/ckan/production.ini | psql -U ckan

    echo 2
    /usr/lib/ckan/venv/bin/python2 /usr/local/bin/ckan-paster --plugin=ckanext-validation validation init-db -c /etc/ckan/production.ini
    {{ if .Values.defaultUser }}

    echo 3

    echo "y
    {{ .Values.defaultUser.email }}
    {{ .Values.defaultUser.password }}
    {{ .Values.defaultUser.password }}
    " | /usr/lib/ckan/venv/bin/python2 /usr/local/bin/ckan-paster --plugin=ckan sysadmin add {{ .Values.defaultUser.username }} -c /etc/ckan/production.ini
    {{ end }}

    {{ if .Values.plugins.harvest }}
    /usr/lib/ckan/venv/bin/python2 /usr/local/bin/ckan-paster --plugin=ckanext-harvest harvester initdb -c /etc/ckan/production.ini
    {{ end }}

{{- end -}}
