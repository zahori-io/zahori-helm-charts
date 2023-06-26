## Tutorial: Step-by-Step Installation of the "zahori-consul" Helm Chart from ArtifactHub


**Note:** This tutorial will guide you through the step-by-step installation process of the "zahori-consul" Helm chart from [ArtifactHub](https://artifacthub.io/packages/helm/zahori/zahori-consul). 

### Step 1: Set up the environment

Ensure that Helm is installed on your local machine. You can follow the installation instructions on the official Helm website ([https://helm.sh](https://helm.sh)) based on your operating system.

### Step 2: Add the repository

To add the repository that contains the Helm chart, run the following command:

```shell
helm repo add zahori https://zahori-io.github.io/zahori-helm-charts
```

This will add the repository with the name "zahori".

### Step 3: Update the repositories

Once you have added the repository, make sure to update the repositories to fetch the latest information about the chart and its available versions. Run the following command:

```shell
helm repo update
helm dependency build
```

This will update the Helm repositories on your local machine.

### Step 4: Create Namespace zahori

Now you create namespace moon on your cluster. Run the following command:

```shell
kubectl create namespace zahori
```

### Step 5: Install the chart

Now you can install the chart on your cluster. Run the following command:

```shell
helm install consul zahori/zahori-consul values.yaml -n zahori
```

This will install the "zahori-consul" chart from the "zahori" repository into your cluster.

### Step 6: Verify the installation

Once the installation is complete, you can verify if the chart has been installed successfully by running the following command:

```shell
helm ls
```

This will display a list of charts installed in your cluster, and you should see the "zahori-consul" chart in the list.

### Step 7: Customize the installation (optional)

If you want to customize the installation of the chart, you can provide custom values using a YAML values file. You can create a custom values file (e.g., "my-values.yaml") and use it during installation with the following command:

```shell
helm install consul zahori/zahori-consul -n zahori -f my-values.yaml
```

Make sure to adjust the content of the "values.yaml" file according to your needs.

That's it! You have completed the installation of the "zahori-consul" chart into your cluster using Helm. Remember to refer to the chart's documentation and specific provider requirements for more information on how to use and configure it properly.

