# Examples

The `ballerinax/ebay.metadata` connector provides practical examples illustrating usage in various scenarios.

1. **[Listing policy review](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/tree/main/examples/listing_policy_review)** - Review the currency, category, item condition, listing structure and return policies that apply to one category.

2. **[Shipping options overview](https://github.com/ballerina-platform/module-ballerinax-ebay.metadata/tree/main/examples/shipping_options_overview)** - List the carriers, handling times and shipping services of a marketplace.

## Prerequisites

1. Generate eBay credentials to authenticate the connector as described in the [Setup guide](https://central.ballerina.io/ballerinax/ebay.metadata/latest#setup-guide).

2. For each example, create a `Config.toml` in the related example folder with the required configuration, as described in the example's own README.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
