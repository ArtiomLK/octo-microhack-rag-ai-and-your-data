# Challenge 0: Environment Setup

```bash
# Validate prerequisites
azd version       # Validate that Azure CLI is installed
node -v           # Validate that Node.js is installed
git --version     # Validate that Git is installed
python --version  # Validate that Python is installed
az --version      # Validate that Azure CLI is installed

# Give the environment a unique name. This will be used to create your resources. For example, cowboy-hats would create resource group rg-cowboy-hats. It could be alk-mh.
azd init #alk-mh

# Login to Azure Developer CLI and Portal
azd auth login --use-device-code

# Login to Azure Portal
az login --use-device-code --tenant ########-####-####-####-############
az account set --subscription ########-####-####-####-############
az account show

# Start building the infrastructure and components deployment:
azd up
```
