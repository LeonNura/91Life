data "google_container_cluster" "primary" {
  name = ""
  location = "europe-west1-b"
}

resource "null_resource" "helm_install" {
  depends_on = [data.google_container_cluster.primary]

  provisioner "local-exec" {
    command = <<-EOF
      # Download Helm
      curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
      chmod 700 get_helm.sh
      ./get_helm.sh

      # Configure Helm to connect to the Kubernetes cluster
      gcloud container clusters get-credentials ${data.google_container_cluster.primary.name} --zone ${data.google_container_cluster.primary.location} --project ${data.google_container_cluster.primary.project}

      # Create a temporary configuration file
      echo "api:
  db:
    host: my-postgresql.default.svc.cluster.local
    name: mydb
    port: 5432
    username: admin
    password: admin
  migrations:
    host: my-postgresql.default.svc.cluster.local
    name: mydb
    port: 5432
    username: admin
    password: admin
  temporal:
    url: temporal-url
    defaultNamespace: temporal-namespace
    defaultSyncJobQueue: temporal-queue

worker:
  temporal:
    url: temporal-url
    namespace: temporal-namespace
    taskQueue: temporal-queue
  redis:
    url: redis-url" > config.yaml

      # Install Neosync chart
      helm upgrade --install neosync oci://ghcr.io/nucleuscloud/neosync/helm/neosync -f config.yaml
    EOF
  }
}