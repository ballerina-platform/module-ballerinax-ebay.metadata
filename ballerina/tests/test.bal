// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.ebay.com/sell/metadata/v1" : "http://localhost:9090";
final string clientId = isLiveServer ? os:getEnv("EBAY_CLIENT_ID") : "test_client_id";
final string clientSecret = isLiveServer ? os:getEnv("EBAY_CLIENT_SECRET") : "test_client_secret";

final string marketplaceId = "EBAY_US";

final Client ebay = check initClient();

function initClient() returns Client|error {
    if isLiveServer {
        return new ({auth: {clientId, clientSecret, scopes: ["https://api.ebay.com/oauth/api_scope"]}}, serviceUrl);
    }
    return new ({auth: {token: "test_token"}, httpVersion: http:HTTP_1_1}, serviceUrl);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetAutomotivePartsCompatibilityPolicies() returns error? {
    AutomotivePartsCompatibilityPolicyResponse? response = check ebay->getAutomotivePartsCompatibilityPolicies("EBAY_MOTORS_US");
    test:assertTrue(response is AutomotivePartsCompatibilityPolicyResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCategoryPolicies() returns error? {
    CategoryPolicyResponse? response = check ebay->getCategoryPolicies(marketplaceId, {}, {filter: "categoryIds:{9355}"});
    test:assertTrue(response is CategoryPolicyResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCurrencies() returns error? {
    GetCurrenciesResponse? response = check ebay->getCurrencies(marketplaceId);
    test:assertTrue(response is GetCurrenciesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetExtendedProducerResponsibilityPolicies() returns error? {
    ExtendedProducerResponsibilityPolicyResponse? response = check ebay->getExtendedProducerResponsibilityPolicies("EBAY_FR");
    test:assertTrue(response is ExtendedProducerResponsibilityPolicyResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetHazardousMaterialsLabels() returns error? {
    HazardousMaterialDetailsResponse? response = check ebay->getHazardousMaterialsLabels(marketplaceId);
    test:assertTrue(response is HazardousMaterialDetailsResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetItemConditionPolicies() returns error? {
    ItemConditionPolicyResponse? response = check ebay->getItemConditionPolicies(marketplaceId);
    test:assertTrue(response is ItemConditionPolicyResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetListingStructurePolicies() returns error? {
    ListingStructurePolicyResponse? response = check ebay->getListingStructurePolicies(marketplaceId);
    test:assertTrue(response is ListingStructurePolicyResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetListingTypePolicies() returns error? {
    ListingTypePoliciesResponse? response = check ebay->getListingTypePolicies(marketplaceId);
    test:assertTrue(response is ListingTypePoliciesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetMinimumListingPricePolicies() returns error? {
    GetMinimumListingPricePoliciesResponse? response = check ebay->getMinimumListingPricePolicies(marketplaceId);
    test:assertTrue(response is GetMinimumListingPricePoliciesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetProductSafetyLabels() returns error? {
    ProductSafetyLabelsResponse? response = check ebay->getProductSafetyLabels("EBAY_DE");
    test:assertTrue(response is ProductSafetyLabelsResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetRegulatoryPolicies() returns error? {
    RegulatoryPolicyResponse? response = check ebay->getRegulatoryPolicies("EBAY_DE");
    test:assertTrue(response is RegulatoryPolicyResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetReturnPolicies() returns error? {
    ReturnPolicyResponse? response = check ebay->getReturnPolicies(marketplaceId);
    test:assertTrue(response is ReturnPolicyResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetShippingPolicies() returns error? {
    ShippingPoliciesResponse? response = check ebay->getShippingPolicies(marketplaceId);
    test:assertTrue(response is ShippingPoliciesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSiteVisibilityPolicies() returns error? {
    SiteVisibilityPoliciesResponse? response = check ebay->getSiteVisibilityPolicies(marketplaceId);
    test:assertTrue(response is SiteVisibilityPoliciesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetExcludeShippingLocations() returns error? {
    ShippingExcludeLocationResponse response = check ebay->getExcludeShippingLocations(marketplaceId);
    test:assertTrue(response.excludeShippingLocations.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetHandlingTimes() returns error? {
    ShippingHandlingTimeResponse response = check ebay->getHandlingTimes(marketplaceId);
    test:assertTrue(response.handlingTimes.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetShippingCarriers() returns error? {
    ShippingCarrierResponse response = check ebay->getShippingCarriers(marketplaceId);
    test:assertTrue(response.shippingCarriers.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetShippingLocations() returns error? {
    ShippingLocationResponse response = check ebay->getShippingLocations(marketplaceId);
    test:assertTrue(response.shippingLocations.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetShippingServices() returns error? {
    ShippingServiceResponse response = check ebay->getShippingServices(marketplaceId);
    test:assertTrue(response.shippingServices.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSalesTaxJurisdictions() returns error? {
    SalesTaxJurisdictions response = check ebay->getSalesTaxJurisdictions("US");
    test:assertTrue(response.salesTaxJurisdictions.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCompatibilitiesBySpecification() returns error? {
    SpecificationResponse? response = check ebay->getCompatibilitiesBySpecification(
        {xEBAYCMARKETPLACEID: "EBAY_US", contentType: "application/json"},
        {
            categoryId: "33563",
            specifications: [{propertyName: "Make", propertyValue: "Toyota"}]
        }
    );
    test:assertTrue(response is SpecificationResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCompatibilityPropertyNames() returns error? {
    PropertyNamesResponse? response = check ebay->getCompatibilityPropertyNames(
        {xEBAYCMARKETPLACEID: "EBAY_US", contentType: "application/json"},
        {categoryId: "33563"}
    );
    test:assertTrue(response is PropertyNamesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCompatibilityPropertyValues() returns error? {
    PropertyValuesResponse? response = check ebay->getCompatibilityPropertyValues(
        {xEBAYCMARKETPLACEID: "EBAY_US", contentType: "application/json"},
        {categoryId: "33563", propertyName: "Make"}
    );
    test:assertTrue(response is PropertyValuesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetMultiCompatibilityPropertyValues() returns error? {
    MultiCompatibilityPropertyValuesResponse? response = check ebay->getMultiCompatibilityPropertyValues(
        {xEBAYCMARKETPLACEID: "EBAY_US", contentType: "application/json"},
        {
            categoryId: "33563",
            propertyNames: ["Year", "Trim"],
            propertyFilters: [{propertyName: "Make", propertyValue: "Toyota"}]
        }
    );
    test:assertTrue(response is MultiCompatibilityPropertyValuesResponse);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetProductCompatibilities() returns error? {
    ProductResponse? response = check ebay->getProductCompatibilities(
        {xEBAYCMARKETPLACEID: "EBAY_US", contentType: "application/json"},
        {productIdentifier: {epid: "1234567890"}}
    );
    test:assertTrue(response is ProductResponse);
}
