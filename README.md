## Terraform Backend Bootstrap

This folder contains scripts to create and delete the Terraform backend resources in Azure.

The backend uses Azure Storage to store the Terraform state file securely.

### Prerequisites

Before running the scripts, ensure the following tools are installed:

* Azure CLI
* Terraform
* Logged into Azure

Login to Azure:

```
az login
```

Verify the subscription:

```
az account show
```

---

## Step 1 – Navigate to Backend Folder

```
cd bootstrap/terraform-backend
```

---

## Step 2 – Give Execute Permission

```
chmod +x create_backend.sh
chmod +x delete_backend.sh
```

---

## Step 3 – Create Terraform Backend

Run the following command to create the backend resources.

```
./create_backend.sh
```

This script will create:

* Resource Group
* Storage Account
* Blob Container
* Blob Versioning
* Soft Delete

After successful execution, Terraform state can be stored in Azure Storage.

---

## Step 4 – Initialize Terraform

Navigate to the Terraform environment folder and run:

```
terraform init -reconfigure
```

---

## Step 5 – Destroy Backend (Optional)

If you want to delete the backend resources:

```
./delete_tf_backend.sh
```

This will delete the entire Resource Group and all resources inside it.

---

## Notes

* Ensure the storage account name is globally unique.
* Do not delete the backend while Terraform infrastructure is active.
* Backend must exist before running `terraform init`.
