CHARTSDIR := "./charts"

# External variables
REPO_NAME     := ''
REPO_URL      := ''
CHART_NAME    := ''
CHART_VERSION := ''

# This list of available targets.
default:
	@just --list

# Index file update.
index:
	@helm repo index {{CHARTSDIR}}

# Example: 
# 	just REPO_NAME=prometheus-community REPO_URL=https://prometheus-community.github.io/helm-charts CHART_NAME=alertmanager CHART_VERSION=0.22.0 fetch
# Fetch a helm chart from the specified repository.
fetch:
	@helm repo add {{REPO_NAME}} {{REPO_URL}}
	@helm repo update
	@helm fetch {{REPO_NAME}}/{{CHART_NAME}} -d {{CHARTSDIR}} --version {{CHART_VERSION}}
	just index