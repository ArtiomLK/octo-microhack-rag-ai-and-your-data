#!/bin/bash

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Install Azure Functions Core Tools
sudo apt-get update
sudo apt-get install azure-functions-core-tools-4

# Make all scripts in the scripts folder executable
chmod +x ./scripts/*
chmod +x ./code/gpt-rag-ingestion/scripts/*
chmod +x ./code/gpt-rag-frontend/deploy.sh
chmod +x ./code/gpt-rag-frontend/deploy.ps1
