# Shipping options overview

This example lists the shipping options of an eBay marketplace: the supported carriers, the handling times and the shipping services offered by one carrier.

## Prerequisites

### 1. Set up an eBay application

Follow the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/blob/main/ballerina/README.md#setup-guide) to obtain a client ID and client secret. The application token needs the `https://api.ebay.com/oauth/api_scope` scope.

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
clientId = "<client-id>"
clientSecret = "<client-secret>"
marketplaceId = "<marketplace-id, e.g. EBAY_US>"
carrier = "<shipping-carrier, e.g. USPS>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```
