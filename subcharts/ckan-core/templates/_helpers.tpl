{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*

*/}}

{{- define "ckanSqlalchemyUrl" -}}
postgresql://ckan:{{- .Values.postgres.password -}}@{{- .Release.Name -}}-postgresql/ckan
{{- end -}}

{{- define "ckanDatastoreWriteUrl" -}}
postgresql://ckan:{{- .Values.postgres.password -}}@{{- .Release.Name -}}-postgresql/datastore
{{- end -}}

{{- define "ckanDatastoreReadUrl" -}}
postgresql://datastore_ro:{{- .Values.postgres.dataStoreRoPassword -}}@{{- .Release.Name -}}-postgresql/datastore
{{- end -}}

{{- define "ckanSolrUrl" -}}
http://{{- .Release.Name -}}-ckan-solr:8983/solr/ckan
{{- end -}}

{{- define "ckanRedisUrl" -}}
http://:{{- .Values.redisPassword -}}@{{- .Release.Name -}}-redis:6379/1
{{- end -}}

{{- define "ckanDatapusherUrl" -}}
http://ckan_datapusher:8800
{{- end -}}
