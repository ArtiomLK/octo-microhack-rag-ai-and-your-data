# Challenge 1: Deploying Search Service

```bash
# Init vars
tenant_id="########-####-####-####-############";                         echo $tenant_id
sub_id="########-####-####-####-############";                            echo $sub_id
resource_token="#############";                                           echo $resource_token
srch_n="search0-$resource_token";                                         echo $srch_n
project="microhack";                                                      echo $project
env="dev";                                                                echo $env
l="eastus2";                                                              echo $l
rg_n="rg-alk-mh";                                                         echo $rg_n
tags="project=$project env=$env architecture=rag";                        echo $tags

# Login to Azure Portal
az login --use-device-code --tenant $tenant_id
az account set --subscription $sub_id
az account show

# Create srch
az search service create \
--name $srch_n \
--subscription $sub_id \
--resource-group $rg_n \
--sku "standard" \
--location $l \
--identity-type "SystemAssigned" \
--auth-options "aadOrApiKey" \
--aad-auth-failure-mode "http401WithBearerChallenge" \
--replica-count 1 \
--partition-count 1 \
--tags $tags
```

Replicas

- Role: Replicas are responsible for handling query requests.
- Function: Each replica contains a full copy of the index, allowing it to process queries independently.
- Benefit: Increasing the number of replicas improves query performance and availability because multiple replicas can handle queries simultaneously.

Partitions

- Role: Partitions are responsible for dividing the index data into smaller segments.
- Function: Each partition holds a portion of the index data, allowing the system to manage larger datasets.
- Benefit: Increasing the number of partitions improves indexing performance by enabling parallel processing of indexing operations.
- How It Works
  - When you have multiple partitions, the index data is divided among these partitions.
  - Each replica will have a full copy of the index, but this full copy is distributed across all partitions.
  - For example, if you have 2 partitions and 3 replicas, each replica will have data from both partitions, ensuring that the entire index is available on each replica.

How They Work Together

- Querying: When a query is executed, it is sent to one or more replicas. Each replica processes the query using its full copy of the index, which is distributed across partitions. The partitions allow the index to be managed more efficiently, but the replicas are the ones that handle the actual query processing.
- Indexing: When new data is indexed, it is distributed across partitions. This allows the indexing process to be parallelized, improving performance.

Summary

- Replicas: Handle query requests and improve query performance and availability.
- Partitions: Divide the index data for better data management and improved indexing performance.

Example

- Increasing Replicas: If you have high query traffic, adding more replicas will help distribute the load and improve query response times.
- Increasing Partitions: If you have a large dataset, adding more partitions will help manage the data more efficiently and improve indexing performance.
