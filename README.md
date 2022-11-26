# Helm Charts Registry

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
