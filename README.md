# theme-deploy

- downloads the remote theme into a temp folder
- runs git diff of the current folder against the temp folder downloaded
- shows differences if exists
- asks if you really want to overwrite the changes
- asks if you really want to deploy the changes

## Requirements
1. git cli
2. [Shopify themekit](https://shopify.dev/tools/theme-kit/getting-started)

## Installing
`curl -o /usr/local/bin/theme-deploy -k https://raw.githubusercontent.com/glaubermagal/theme-deploy/main/theme-deploy.sh && chmod +x /usr/local/bin/theme-deploy`

## Running
`theme-deploy [themekit arguments]`


----
```
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
