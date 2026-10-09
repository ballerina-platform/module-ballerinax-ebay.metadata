## Overview

[eBay](https://www.ebay.com/) is a global online marketplace where businesses and individuals buy and sell goods. The [eBay Metadata API](https://developer.ebay.com/api-docs/sell/metadata/overview.html) provides the marketplace-specific configuration that sellers need when creating listings: category listing policies such as supported item conditions and variation support, sales tax jurisdictions, shipping carriers, services and handling times, parts compatibility data, and hazardous material and product safety label information.

The eBay Metadata connector lets Ballerina applications call these operations with typed requests and responses. It supports version 1 of the eBay Metadata API.

### Key features

- Retrieve category listing policies: item conditions, listing structure and types, return, shipping, regulatory, motors and site visibility policies
- Look up marketplace currencies, minimum listing prices and sales tax jurisdictions
- List shipping carriers, services, locations, excluded locations and handling times
- Query parts compatibility names, values and products by specification
- Read hazardous material and product safety label information

## Setup guide

To use the eBay Metadata connector, you need an eBay developer account and an application keyset. If you do not have a developer account, you can [sign up for one](https://developer.ebay.com/signin).

### Step 1: Create an application keyset

1. Sign in to the [eBay Developer Program](https://developer.ebay.com/my/keys) and open **Application Keys**.

2. Create a keyset for the **Production** environment and note down the **App ID (Client ID)** and **Cert ID (Client Secret)**.

### Step 2: Choose the OAuth scope

The Metadata API uses the OAuth 2.0 client credentials grant, which returns an application token. The token needs the following scope:

* `https://api.ebay.com/oauth/api_scope`

The connector requests a token from `https://api.ebay.com/identity/v1/oauth2/token` with your client ID and client secret and renews it when it expires.

## Quickstart

To use the eBay Metadata connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `ebay.metadata` module.

```ballerina
import ballerinax/ebay.metadata;
```

### Step 2: Instantiate a new connector

1. Create a `Config.toml` file and configure the credentials obtained in the steps above:

```toml
clientId = "<Client ID>"
clientSecret = "<Client Secret>"
```

2. Create a `metadata:ConnectionConfig` with the OAuth 2.0 client credentials and initialize the connector with it.

```ballerina
configurable string clientId = ?;
configurable string clientSecret = ?;

final metadata:Client ebay = check new ({
    auth: {
        clientId,
        clientSecret,
        scopes: ["https://api.ebay.com/oauth/api_scope"]
    }
});
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### Get the default currency of a marketplace

```ballerina
public function main() returns error? {
    metadata:GetCurrenciesResponse? _ = check ebay->getCurrencies("EBAY_US");
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The eBay Metadata connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/tree/main/examples/), covering the following use cases:

1. [Listing policy review](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/tree/main/examples/listing_policy_review) - Review the currency, category, item condition, listing structure and return policies that apply to one category.

2. [Shipping options overview](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/tree/main/examples/shipping_options_overview) - List the carriers, handling times and shipping services of a marketplace.

