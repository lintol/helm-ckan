{{/* vim: set filetype=mustache: */}}
{{/*
Script for doing final setup after initdb
*/}}
{{- define "postgresqlInitdbd" -}}

{{- if .Values.security.setAllMd5 -}}

sed -i 's/^\([^#].*\)trust$/\1md5/g' $PGDATA/pg_hba.conf
{{- end -}}

{{- if .Values.replication.ipRange -}}

sed -i 's/#host\s*replication.*127.0.0.1\/32.*/host replication laravel {{ .Values.replication.ipRange }}\/{{ .Values.replication.ipRangeBits }} {{ .Values.replication.security }}/' pg_hba.conf
{{- end -}}
{{- end -}}
