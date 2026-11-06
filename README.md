# Ballerina eBay Metadata connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-ebay.metadata.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/ebay.metadata.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Febay.metadata)

## Overview

[eBay](https://www.ebay.com/) is a global online marketplace where businesses and individuals buy and sell goods. The [eBay Metadata API](https://developer.ebay.com/api-docs/sell/metadata/overview.html) provides the marketplace-specific configuration that sellers need when creating listings: category listing policies such as supported item conditions and variation support, sales tax jurisdictions, shipping carriers, services and handling times, parts compatibility data, and hazardous material and product safety label information.

The eBay Metadata connector lets Ballerina applications call these operations with typed requests and responses. It supports version 1 of the eBay Metadata API.

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

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`ebay.metadata` package](https://central.ballerina.io/ballerinax/ebay.metadata/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
