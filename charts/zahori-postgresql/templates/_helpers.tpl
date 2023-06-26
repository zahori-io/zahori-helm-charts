{{/*
Expand the name of the chart.
*/}}
{{- define "zahori-postgresql-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "zahori-postgresql-chart.myname" -}}
{{- printf "%s" (trimSuffix "-chart" .Chart.Name) -}}
{{- end }}

{{- define "zahori-postgresql-chart.service.name" -}}
zahori-postgresql-service
{{- end }}

{{- define "zahori-postgresql-chart.storageclass.name" -}}
{{- printf "%s-storage" (include "zahori-postgresql-chart.myname" .) -}}
{{- end }}

{{- define "zahori-postgresql-chart.storage.claim" -}}
{{- printf "%s-claim" (include "zahori-postgresql-chart.myname" .) -}}
{{- end }}

{{- define "zahori-postgresql-chart.config.secret" -}}
{{- printf "%s-secret" (include "zahori-postgresql-chart.myname" .) -}}
{{- end }}

{{- define "zahori-postgresql-chart.config.public" -}}
{{- printf "%s-public" (include "zahori-postgresql-chart.myname" .) -}}
{{- end }}

{{- define "zahori-postgresql-chart.statefulset.public" -}}
{{- printf "%s-statefulset" (include "zahori-postgresql-chart.myname" .) -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "zahori-postgresql-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "zahori-postgresql-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "zahori-postgresql-chart.labels" -}}
helm.sh/chart: {{ include "zahori-postgresql-chart.chart" . }}
{{ include "zahori-postgresql-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "zahori-postgresql-chart.label" -}}
postgres
{{- end }}


{{/*
Selector labels
*/}}
{{- define "zahori-postgresql-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "zahori-postgresql-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "zahori-postgresql-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "zahori-postgresql-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
