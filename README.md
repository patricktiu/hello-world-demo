# Hello World

A simple `Hello World` application that demonstrate a basic pattern for deploying an application into Red Hat OpenShift with IBM Cloud Pack for Application 4.0.1

## Building the application image
Dockerfile adds three things to build application image
1. application EAR file
2. application installation script (Jython)
3. sample properties file that increases container thread pool to 100

## Create a custom Tekton pipeline to build and push the application image to OCP with ICP4A

*Note: make sure you have Openshift pipeline operator v0.8.2 or higher.  ICP4A 4.0.0 installation comes with v0.7.0 only*

1. Login to your OCP cluster
   ```
   oc login URI --token=TOKEN (from Copy Login Command in OCP console)
   ```

2. Create a new project
   ```
   oc new-project hello-world-pipeline
   ```

3. Create pipeline build tasks
   ```
   oc create -f pipeline/update_deployment_task.yaml
   oc create -f pipeline/apply_manifest_task.yaml
   oc apply -f pipeline/buildah.yaml
   ```
   *A limitation was removed in the tektoncd buildah support*

4. Create custom pipeline and pipeline resource
   ```
   oc create -f pipeline/pipeline.yaml
   oc create -f pipeline/resources.yaml
   ```

5. Start the pipeline (or use the Tekton dashboard)
   ```
   tkn pipeline start build-and-deploy
   ```

10. Congratulations! You've successfully deployed your application to OCP 4.x.

