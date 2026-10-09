# Running Tests

## Prerequisites

You need an eBay developer application keyset (client ID and client secret) to run the tests against the live eBay Metadata API. The mock tests need no credentials.

## Test environments

There are two test environments for running the connector tests. The default environment is the mock server and the other is the live eBay Metadata API.

| Test Groups  | Environment                                              |
| ------------ | -------------------------------------------------------- |
| mock_tests   | Mock server for the eBay Metadata API (default)          |
| live_tests   | eBay Metadata API (production)                           |

## Running the tests

1. To run the tests against the mock server, execute:

    ```bash
    bal test --groups mock_tests
    ```

2. To run the tests against the live API, set the following environment variables and execute the live test group:

    ```bash
    export IS_LIVE_SERVER=true
    export EBAY_CLIENT_ID=<client-id>
    export EBAY_CLIENT_SECRET=<client-secret>
    bal test --groups live_tests
    ```
