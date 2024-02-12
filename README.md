Shopify Theme Diff Tool

This tool facilitates the deployment of a Shopify theme by performing the following steps:

- Downloads the remote theme into a temporary folder.
- Runs a git diff of the current folder against the downloaded temporary folder.
- Displays any differences that exist.
- Prompts the user to confirm if they want to overwrite the changes.
- Asks for confirmation before deploying the changes.

## Requirements

Ensure the following prerequisites are met:
1. [git CLI](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [Shopify Themekit](https://shopify.dev/tools/theme-kit/getting-started)


## Installation

To install, run the following command in your terminal:

```bash
curl -o /usr/local/bin/theme-deploy -k https://raw.githubusercontent.com/glaubermagal/theme-deploy/main/theme-deploy.sh && chmod +x /usr/local/bin/theme-deploy
```

## Usage
Run the tool with Themekit arguments:

```bash
theme-deploy [themekit arguments]
```

### Example Usage

```bash
apt0$ sh ./theme-deploy.sh --env=store-dev

STARTING...

COPIED ALL FILES TO TEMP FOLDER /var/folders/10/n410lql16td0ljldpVkttj5c0010gn/T/shopify-theme-.KZvdfyfc
DOWNLOADING REMOTE THEME TO TEMP FOLDER...
[store-dev] 242|242 [==============================================================================]  100 %
[store-dev] 242 files, Downloaded: 2, No Change: 240

M	/Users/apt0/Projects/theme/config/settings_data.json
M	/Users/apt0/Projects/theme/sections/product-template.liquid

The above files will be overwritten on Shopify. Would you like to continue anyway? (y/N)? y


DEPLOYING THEME...
[store-dev] 242|242 [==============================================================================]  100 %
```
