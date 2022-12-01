# Helm Charts Registry

An example of adding an external dependency:
```bash
just \
  REPO_NAME=prometheus-community \
  REPO_URL=https://prometheus-community.github.io/helm-charts \
  CHART_NAME=alertmanager \
  CHART_VERSION=0.22.0 \
  fetch
```

After that, you should push the changes to the `master` branch. A pipeline will automatically start that will update `GitHub Pages`. The new chart will be available in about 2 minutes.

An example of using charts from another repository:
```yaml
apiVersion: skaffold/v2beta29
kind: Config
profiles:
  - name: dependencies
    deploy:
      helm:
        releases:
        - name: kafka
          namespace: inf-data
          createNamespace: true
          remoteChart: kafka
          repo: https://ryazanovalexander.github.io/pipeline-manager.charts
          version: 18.0.3
          upgradeOnChange: true
          setValueTemplates:
            persistence:
              enabled: false
            zookeeper:
              persistence:
                enabled: false
        - name: signoz
          namespace: inf-telemetry
          createNamespace: true
          remoteChart: signoz
          repo: https://ryazanovalexander.github.io/pipeline-manager.charts
          version: 0.5.0
          upgradeOnChange: true
```
