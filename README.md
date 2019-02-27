# Simple Helm Chart for CKAN

## Plugin configuration

Go to the `example` directory.

1. Update _build.sh_ to install the necessary plugins
2. Build your custom ckan-core image, with `docker build -t MYREPO/my-ckan-image:MYTAG` and push it up with `docker push`
3. Set the plugins in values.yaml, and correct the ckan-core image name to `MYREPO/my-ckan-image:MYTAG`
4. If you have added plugins that have settings not already included in this Helm chart, you may need to add appropriate settings to `./subcharts/ckan-core/templates/_productionIni.tpl` and re-run `helm dependencies update .` (please consider a pull request, to help us support more plugins out of the box)

## Deployment

1. Copy the `values.yaml` file from the `example` subdirectory into a new location outside the gitroot, e.g. `development.yaml` in the directory above.
2. `helm install --name development-ckan . --values=../development.yaml --namespace=ckan`

At present, we do not have any default ingress, so you can reach the CKAN web interface using:

```
kubectl port-forward $(kubectl get pods --no-headers | awk '{print $1}' | head -n 1) 5000:5000
```

and hitting http://localhost:5000 will give you the CKAN UI. When you wish to remove it you will need to:

```
helm delete --purge development-ckan
helm delete job development-ckan-post-install
```

(the second command is only required in the event that the database initialization fails, otherwise the job will be cleaned on start-up)
