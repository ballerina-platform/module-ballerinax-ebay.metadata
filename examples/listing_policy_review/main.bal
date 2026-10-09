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

// Reviews the listing rules of one eBay category before a seller creates a listing: the default
// currency of the marketplace, the category policy, the accepted item conditions, whether
// variations are supported and the return policy.

import ballerina/io;
import ballerinax/ebay.metadata;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string marketplaceId = "EBAY_US";
configurable string categoryId = ?;

public function main() returns error? {
    metadata:Client ebay = check new ({
        auth: {
            clientId,
            clientSecret,
            scopes: ["https://api.ebay.com/oauth/api_scope"]
        }
    });

    string categoryFilter = string `categoryIds:{${categoryId}}`;

    metadata:GetCurrenciesResponse? currencies = check ebay->getCurrencies(marketplaceId);
    if currencies is () {
        return error(string `No currency information returned for ${marketplaceId}`);
    }
    io:println("Default currency: ", currencies.defaultCurrency.code);

    metadata:CategoryPolicyResponse? categoryPolicies = check ebay->getCategoryPolicies(marketplaceId, {}, {filter: categoryFilter});
    if categoryPolicies is () || categoryPolicies.categoryPolicies.length() == 0 {
        return error(string `Category ${categoryId} has no policy on ${marketplaceId}`);
    }
    metadata:CategoryPolicy categoryPolicy = categoryPolicies.categoryPolicies[0];
    io:println("Auto pay enabled: ", categoryPolicy.autoPayEnabled ?: false);
    io:println("Reserve price allowed: ", categoryPolicy.reservePriceAllowed ?: false);

    metadata:ItemConditionPolicyResponse? conditionPolicies = check ebay->getItemConditionPolicies(marketplaceId, {}, {filter: categoryFilter});
    if conditionPolicies is () || conditionPolicies.itemConditionPolicies.length() == 0 {
        return error(string `Category ${categoryId} has no item condition policy on ${marketplaceId}`);
    }
    foreach metadata:ItemCondition condition in conditionPolicies.itemConditionPolicies[0].itemConditions {
        io:println("Item condition ", condition.conditionId, ": ", condition.conditionDescription);
    }

    metadata:ListingStructurePolicyResponse? structurePolicies = check ebay->getListingStructurePolicies(marketplaceId, {}, {filter: categoryFilter});
    if structurePolicies is () || structurePolicies.listingStructurePolicies.length() == 0 {
        return error(string `Category ${categoryId} has no listing structure policy on ${marketplaceId}`);
    }
    io:println("Variations supported: ", structurePolicies.listingStructurePolicies[0].variationsSupported);

    metadata:ReturnPolicyResponse? returnPolicies = check ebay->getReturnPolicies(marketplaceId, {}, {filter: categoryFilter});
    if returnPolicies is () || returnPolicies.returnPolicies.length() == 0 {
        return error(string `Category ${categoryId} has no return policy on ${marketplaceId}`);
    }
    io:println("Returns required: ", returnPolicies.returnPolicies[0].required ?: false);
}
