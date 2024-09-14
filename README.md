Week 1

This Terraform configuration provisions a Google Cloud VM instance and configures firewall rules to allow HTTP and HTTPS traffic. 
The VM is an Ubuntu instance (e2-medium), and firewall rules are set up for both HTTP (port 80) and HTTPS (port 443) access. 
Additionally, the Terraform state is stored securely in a Google Cloud Storage bucket.

To use this setup, you’ll need to configure Google Cloud and run the provided Terraform code, which will automatically set up the VM and firewall rules. 
The state of the deployment is saved in a GCS bucket for persistence.

Week 2

Provision Kubernetes Cluster with Terraform:
The Kubernetes cluster is provisioned using Terraform on Google Cloud with micro instances (e2-medium). The cluster includes auto-repair and auto-upgrade features for enhanced reliability. 
The google_container_cluster resource configures the cluster, and the Terraform state is saved in a Google Cloud Storage bucket for persistence.

Deploy Neosync with Helm:
Neosync is deployed using Helm via the CLI. ResourceQuotas are applied to the Neosync pods, and the deployment is initially tested through the CLI before being automated with Terraform. 
Helm configuration is stored in a config.yaml file, which contains database and temporal settings. This file is used in the Helm upgrade/install command to deploy Neosync.

Expose Neosync via HTTPS Using Ngrok:
Neosync is securely exposed using Ngrok. A self-signed SSL certificate is created with OpenSSL and linked to a Kubernetes secret. 
The certificate is applied to an Nginx proxy, which forwards traffic to Neosync via HTTPS. The Ingress, Service, and ConfigMap resources define the setup, 
allowing access to Neosync through Ngrok with secure traffic.

Deploy dbt-core and Apache Airflow:
dbt-core and Apache Airflow are deployed using Helm. Apache Airflow is exposed using the Ngrok ingress controller for secure external access. 
The Helm chart for Airflow is configured with custom values using a values.yaml file, and it’s deployed alongside dbt-core for data transformation and orchestration. 
he services are accessible through the Ngrok controller, providing HTTPS access to both tools.

Week 3

The task was to provision two serverless Google Cloud Functions and an API Gateway that routes requests to these functions, using Terraform. 
The requirement was to build this setup dynamically and modularly, meaning the infrastructure should be easily configurable and reusable across different environments. 
This involves creating and configuring Google Cloud Functions for specific endpoints (e.g., /hello and /api), and setting up an API Gateway that routes HTTP requests to these functions. 
The overall goal was to allow seamless interaction with the cloud functions through the API Gateway while maintaining scalability and modularity.

To achieve this, the Terraform code provisions two separate Google Cloud Functions. The first function handles a simple hello endpoint, and the second function handles an api endpoint. 
The API Gateway was configured to route HTTP requests to both of these functions using an OpenAPI specification file that dynamically references the two functions' trigger URLs. 
These URLs were captured by Terraform output variables, ensuring that once the functions were created, their addresses were automatically retrieved and passed into the API Gateway module, 
linking the functions to their respective paths within the gateway.

The solution was designed to be fully dynamic and modular. Each part of the infrastructure (both Google Cloud Functions and the API Gateway) was broken down into separate Terraform modules. 
Variables were extensively used to make the code configurable, including the Google Cloud project ID, region, function names, runtime, and source files. 
This modular approach ensures that the code can be reused for different projects or environments with minimal adjustments, 
as all relevant parameters can be passed dynamically through variable inputs.
