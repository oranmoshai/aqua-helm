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

{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" (required "A valid .Values.global.imageCredentials.registry entry required!" .Values.global.imageCredentials.registry) (printf "%s:%s" (required "A valid .Values.global.imageCredentials.username entry required!" .Values.global.imageCredentials.username) (required "A valid .Values.global.imageCredentials.password entry required!" .Values.global.imageCredentials.password) | b64enc) | b64enc }}
{{- end }}