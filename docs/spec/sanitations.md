_Author_:  @DimuthuMadushan \
_Created_: 2026/10/09 \
_Updated_: 2026/10/09 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from eBay Metadata.
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/ebay/metadata/v1/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Changed the `openapi` version from `3.1.0` to `3.0.1`. The specification uses no OpenAPI 3.1 only feature, but `bal openapi flatten` drops the `type` of every schema, property and parameter of a 3.1 document, which turned every field of the generated client into `anydata`.

2. Added the missing `"in": "path"` to the `marketplace_id` parameter of `getItemConditionPolicies` (`GET /marketplace/{marketplace_id}/get_item_condition_policies`). Without it the path parameter was undeclared and `bal openapi` rejected the specification.

3. Added a `summary` to all 28 operations. The original specification has none, and the summaries become the method documentation of the generated client. Each summary is unique and starts with `Get`, matching the operation ID.

4. Kept the operation IDs of the original specification, because all of them are already concise, unique and within the 37 character limit. Renamed three schemas (`ProductIdentiferEnabledEnum` to `ProductIdentifierEnabledEnum` to fix a typo, `PropertyFilterInner` to `PropertyFilter` and `SortOrderInner` to `SortOrder`) and kept the other 112 as they are. All decisions are recorded in `ai-mappings.json` so that a regeneration reproduces them.

5. Ran `tooling/sanitize_spec.py --strip-html` on the aligned specification (`aligned_ballerina_openapi.json`) after the renames: it replaced the generic `Success`/`OK` descriptions of the 28 `200` responses with a description of what is returned and stripped the HTML markup from descriptions. This edit is made to the aligned specification, not the original, and must be re-applied after a re-align (`postfix.py` runs it again).

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client --license docs/license.txt -o ballerina --client-methods remote
```

Note: The license year is hardcoded to 2026, change if necessary.
