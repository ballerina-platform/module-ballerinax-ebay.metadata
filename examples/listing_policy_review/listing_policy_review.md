# Listing policy review

This example reviews the listing rules of one eBay category before a listing is created. It reads the default currency of the marketplace, the category policy, the accepted item conditions, whether variations are supported and the return policy.

## Prerequisites

### 1. Set up an eBay application

Follow the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/blob/main/ballerina/README.md#setup-guide) to obtain a client ID and client secret. The application token needs the `https://api.ebay.com/oauth/api_scope` scope.

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
clientId = "<client-id>"
clientSecret = "<client-secret>"
marketplaceId = "<marketplace-id, e.g. EBAY_US>"
categoryId = "<leaf-category-id, e.g. 9355>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```
