{{/*
Expand the name of the chart.
*/}}
{{- define "zahori-server-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "zahori-server-chart.myname" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "zahori-server-chart.label" -}}
zahori-server
{{- end }}

{{- define "zahori-server-chart.config.scripts" -}}
{{- printf "%s-scripts" (include "zahori-server-chart.name" .) -}}
{{- end }}

{{- define "zahori-server-chart.config.public" -}}
{{- printf "%s-config" (include "zahori-server-chart.name" .) -}}
{{- end }}

{{- define "zahori-server-chart.config.secret" -}}
{{- printf "%s-secret" (include "zahori-server-chart.name" .) -}}
{{- end }}

{{- define "zahori-server-chart.storageclass.name" -}}
{{- printf "%s-storage" (include "zahori-server-chart.name" .) -}}
{{- end }}

{{- define "zahori-server-chart.storage.claim" -}}
{{- printf "%s-claim" (include "zahori-server-chart.name" .) -}}
{{- end }}


{{- define "zahori-server-chart.deployment.name" -}}
{{- printf "%s-deployment" (include "zahori-server-chart.name" .) -}}
{{- end }}

{{- define "zahori-server-chart.service.name" -}}
{{- printf "%s-service" (include "zahori-server-chart.name" .) -}}
{{- end }}

{{- define "zahori-server-chart.traefik.name" -}}
{{- printf "%s-traefik" (include "zahori-server-chart.name" .) -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "zahori-server-chart.fullname" -}}
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
{{- define "zahori-server-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "zahori-server-chart.labels" -}}
helm.sh/chart: {{ include "zahori-server-chart.chart" . }}
{{ include "zahori-server-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "zahori-server-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "zahori-server-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "zahori-server-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "zahori-server-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
