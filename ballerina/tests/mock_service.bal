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

listener http:Listener ep0 = new (9090);

@http:ServiceConfig {treatNilableAsOptional: true}
service / on ep0 {
    # Get sales tax jurisdictions
    #
    # + countryCode - The two-letter ISO 3166 country code (US or CA)
    # + return - The retrieved sales tax jurisdictions
    resource function get country/[string countryCode]/sales_tax_jurisdiction() returns SalesTaxJurisdictions|http:BadRequest|http:NotFound|http:InternalServerError {
        return {
            salesTaxJurisdictions: [
                {salesTaxJurisdictionId: "AL"},
                {salesTaxJurisdictionId: "CA"},
                {salesTaxJurisdictionId: "NY"}
            ]
        };
    }

    # Get automotive parts compatibility policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptEncoding - The compression-encoding algorithms the client accepts
    # + return - The retrieved automotive parts compatibility policies
    resource function get marketplace/[string marketplaceId]/get_automotive_parts_compatibility_policies(string? filter, @http:Header {name: "Accept-Encoding"} string? acceptEncoding) returns AutomotivePartsCompatibilityPolicyResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            automotivePartsCompatibilityPolicies: [
                {
                    categoryId: "33563",
                    categoryTreeId: "100",
                    compatibilityBasedOn: "ASSEMBLY",
                    compatibleVehicleTypes: ["US_CARS_AND_TRUCKS", "US_MOTORCYCLES"],
                    maxNumberOfCompatibleVehicles: 3000
                }
            ]
        };
    }

    # Get category policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved category policies
    resource function get marketplace/[string marketplaceId]/get_category_policies(string? filter, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns CategoryPolicyResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            categoryPolicies: [
                {
                    categoryId: "9355",
                    categoryTreeId: "0",
                    autoPayEnabled: true,
                    reservePriceAllowed: true,
                    upcSupport: "ENABLED",
                    eanSupport: "ENABLED",
                    isbnSupport: "DISABLED",
                    valueCategory: false,
                    paymentMethods: ["OTHER"]
                }
            ]
        };
    }

    # Get marketplace currencies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + acceptLanguage - The language the client prefers
    # + return - The default currency of the marketplace
    resource function get marketplace/[string marketplaceId]/get_currencies(@http:Header {name: "Accept-Language"} string? acceptLanguage) returns GetCurrenciesResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            marketplaceId: "EBAY_US",
            defaultCurrency: {code: "USD", description: "United States Dollar"}
        };
    }

    # Get extended producer responsibility policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptEncoding - The compression-encoding algorithms the client accepts
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved extended producer responsibility policies
    resource function get marketplace/[string marketplaceId]/get_extended_producer_responsibility_policies(string? filter, @http:Header {name: "Accept-Encoding"} string? acceptEncoding, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns ExtendedProducerResponsibilityPolicyResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            extendedProducerResponsibilities: [
                {
                    categoryId: "11700",
                    categoryTreeId: "77",
                    supportedAttributes: [
                        {name: "ECO_PARTICIPATION_FEE", usage: "REQUIRED", enabledForVariations: true},
                        {name: "TAKE_BACK_POLICY", usage: "OPTIONAL", enabledForVariations: false}
                    ]
                }
            ]
        };
    }

    # Get hazardous materials labels
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved hazardous materials label information
    resource function get marketplace/[string marketplaceId]/get_hazardous_materials_labels(@http:Header {name: "Accept-Language"} string? acceptLanguage) returns HazardousMaterialDetailsResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            signalWords: [
                {signalWordId: "DANGER", signalWordDescription: "Danger"},
                {signalWordId: "WARNING", signalWordDescription: "Warning"}
            ],
            statements: [
                {statementId: "H225", statementDescription: "Highly flammable liquid and vapour"}
            ],
            pictograms: [
                {pictogramId: "GHS02", pictogramDescription: "Flammable", pictogramUrl: "https://pics.ebaystatic.com/hazmat/ghs02.png"}
            ]
        };
    }

    # Get item condition policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptEncoding - The compression-encoding algorithms the client accepts
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved item condition policies
    resource function get marketplace/[string marketplaceId]/get_item_condition_policies(string? filter, @http:Header {name: "Accept-Encoding"} string? acceptEncoding, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns ItemConditionPolicyResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            itemConditionPolicies: [
                {
                    categoryId: "261186",
                    categoryTreeId: "0",
                    itemConditionRequired: true,
                    itemConditions: [
                        {conditionId: "1000", conditionDescription: "New"},
                        {conditionId: "3000", conditionDescription: "Used"}
                    ]
                }
            ]
        };
    }

    # Get listing structure policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptEncoding - The compression-encoding algorithms the client accepts
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved listing structure policies
    resource function get marketplace/[string marketplaceId]/get_listing_structure_policies(string? filter, @http:Header {name: "Accept-Encoding"} string? acceptEncoding, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns ListingStructurePolicyResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            listingStructurePolicies: [
                {categoryId: "11450", categoryTreeId: "0", variationsSupported: true},
                {categoryId: "625", categoryTreeId: "0", variationsSupported: false}
            ]
        };
    }

    # Get listing type policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved listing type policies
    resource function get marketplace/[string marketplaceId]/get_listing_type_policies(string? filter, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns ListingTypePoliciesResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            listingTypePolicies: [
                {
                    categoryId: "15032",
                    categoryTreeId: "0",
                    pickupDropOffEnabled: false,
                    digitalGoodDeliveryEnabled: false,
                    listingDurations: [
                        {listingType: "FIXED_PRICE_ITEM", durationValues: ["GTC"]},
                        {listingType: "AUCTION", durationValues: ["DAYS_3", "DAYS_5", "DAYS_7", "DAYS_10"]}
                    ]
                }
            ]
        };
    }

    # Get minimum listing price policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + return - The retrieved minimum listing price policies
    resource function get marketplace/[string marketplaceId]/get_minimum_listing_price_policies() returns GetMinimumListingPricePoliciesResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            minimumListingPricePolicies: [
                {
                    listingType: "AUCTION",
                    description: "Minimum starting price for auction listings",
                    startPrice: {currency: "USD", value: "0.99"}
                },
                {
                    listingType: "FIXED_PRICE_ITEM",
                    description: "Minimum price for fixed price listings",
                    startPrice: {currency: "USD", value: "0.99"},
                    minBuyItNowPricePercent: "30"
                }
            ]
        };
    }

    # Get product safety labels
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + return - The retrieved product safety label information
    resource function get marketplace/[string marketplaceId]/get_product_safety_labels() returns ProductSafetyLabelsResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            pictograms: [
                {
                    pictogramId: "10",
                    pictogramDescription: "Choking hazard, small parts",
                    pictogramUrl: "https://pics.ebaystatic.com/safety/choking.png"
                }
            ],
            statements: [
                {statementId: "5", statementDescription: "Not suitable for children under 3 years"}
            ]
        };
    }

    # Get regulatory policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved regulatory policies
    resource function get marketplace/[string marketplaceId]/get_regulatory_policies(string? filter, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns RegulatoryPolicyResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            regulatoryPolicies: [
                {
                    categoryId: "20081",
                    categoryTreeId: "77",
                    supportedAttributes: [
                        {name: "HAZMAT", usage: "OPTIONAL"},
                        {name: "PRODUCT_SAFETY", usage: "REQUIRED"}
                    ]
                }
            ]
        };
    }

    # Get return policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptEncoding - The compression-encoding algorithms the client accepts
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved return policies
    resource function get marketplace/[string marketplaceId]/get_return_policies(string? filter, @http:Header {name: "Accept-Encoding"} string? acceptEncoding, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns ReturnPolicyResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            returnPolicies: [
                {
                    categoryId: "1249",
                    categoryTreeId: "0",
                    required: true,
                    domestic: {
                        returnsAcceptanceEnabled: true,
                        policyDescriptionEnabled: true,
                        refundMethods: ["MONEY_BACK"],
                        returnShippingCostPayers: ["BUYER", "SELLER"],
                        returnPeriods: [{unit: "DAY", value: 30}, {unit: "DAY", value: 60}]
                    }
                }
            ]
        };
    }

    # Get shipping policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved shipping policies
    resource function get marketplace/[string marketplaceId]/get_shipping_policies(string? filter, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns ShippingPoliciesResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            shippingPolicies: [
                {
                    categoryId: "293",
                    categoryTreeId: "0",
                    globalShippingEnabled: true,
                    handlingTimeEnabled: true,
                    shippingTermsRequired: false,
                    maxFlatShippingCost: {currency: "USD", value: "25.00"}
                }
            ]
        };
    }

    # Get site visibility policies
    #
    # + marketplaceId - The eBay marketplace for which policy information is retrieved
    # + filter - Limits the result to the given category IDs
    # + acceptLanguage - The language the client prefers
    # + return - The retrieved site visibility policies
    resource function get marketplace/[string marketplaceId]/get_site_visibility_policies(string? filter, @http:Header {name: "Accept-Language"} string? acceptLanguage) returns SiteVisibilityPoliciesResponse|http:NoContent|ErrorArrayBadRequest|ErrorArrayNotFound|ErrorArrayInternalServerError {
        return {
            siteVisibilityPolicies: [
                {
                    categoryId: "11116",
                    categoryTreeId: "0",
                    crossBorderTradeNorthAmericaEnabled: true,
                    crossBorderTradeGBEnabled: false,
                    crossBorderTradeAustraliaEnabled: false
                }
            ]
        };
    }

    # Get excluded shipping locations
    #
    # + marketplaceId - The eBay marketplace for which locations are retrieved
    # + acceptLanguage - The language the client prefers
    # + return - The list of locations a seller can exclude from shipping
    resource function get shipping/marketplace/[string marketplaceId]/get_exclude_shipping_locations(@http:Header {name: "Accept-Language"} string? acceptLanguage) returns ShippingExcludeLocationResponse|http:BadRequest|http:InternalServerError {
        return {
            excludeShippingLocations: [
                {location: "AK/HI", description: "Alaska and Hawaii", region: "DOMESTIC"},
                {location: "PO Box", description: "Post office boxes", region: "DOMESTIC"}
            ]
        };
    }

    # Get handling times
    #
    # + marketplaceId - The eBay marketplace for which handling times are retrieved
    # + acceptLanguage - The language the client prefers
    # + return - The list of supported handling times
    resource function get shipping/marketplace/[string marketplaceId]/get_handling_times(@http:Header {name: "Accept-Language"} string? acceptLanguage) returns ShippingHandlingTimeResponse|http:BadRequest|http:InternalServerError {
        return {
            handlingTimes: [
                {maxHandlingTime: 1, description: "1 business day", extendedHandling: false},
                {maxHandlingTime: 3, description: "3 business days", extendedHandling: false},
                {maxHandlingTime: 10, description: "10 business days", extendedHandling: true}
            ]
        };
    }

    # Get shipping carriers
    #
    # + marketplaceId - The eBay marketplace for which carriers are retrieved
    # + acceptLanguage - The language the client prefers
    # + return - The list of supported shipping carriers
    resource function get shipping/marketplace/[string marketplaceId]/get_shipping_carriers(@http:Header {name: "Accept-Language"} string? acceptLanguage) returns ShippingCarrierResponse|http:BadRequest|http:InternalServerError {
        return {
            shippingCarriers: [
                {shippingCarrier: "USPS", description: "United States Postal Service"},
                {shippingCarrier: "UPS", description: "United Parcel Service"},
                {shippingCarrier: "FedEx", description: "FedEx"}
            ]
        };
    }

    # Get shipping locations
    #
    # + marketplaceId - The eBay marketplace for which locations are retrieved
    # + acceptLanguage - The language the client prefers
    # + return - The list of supported shipping locations
    resource function get shipping/marketplace/[string marketplaceId]/get_shipping_locations(@http:Header {name: "Accept-Language"} string? acceptLanguage) returns ShippingLocationResponse|http:BadRequest|http:InternalServerError {
        return {
            shippingLocations: [
                {shippingLocation: "US", description: "United States"},
                {shippingLocation: "CA", description: "Canada"},
                {shippingLocation: "Worldwide", description: "Worldwide"}
            ]
        };
    }

    # Get shipping services
    #
    # + marketplaceId - The eBay marketplace for which services are retrieved
    # + acceptLanguage - The language the client prefers
    # + return - The list of supported shipping services
    resource function get shipping/marketplace/[string marketplaceId]/get_shipping_services(@http:Header {name: "Accept-Language"} string? acceptLanguage) returns ShippingServiceResponse|http:BadRequest|http:InternalServerError {
        return {
            shippingServices: [
                {
                    shippingService: "USPSPriority",
                    description: "USPS Priority Mail",
                    shippingCarrier: "USPS",
                    shippingCategory: "ONE_DAY",
                    shippingCostTypes: ["FLAT_RATE", "CALCULATED"],
                    internationalService: false,
                    validForSellingFlow: true,
                    minShippingTime: 1,
                    maxShippingTime: 3,
                    packageLimits: {
                        maxWeight: 70.0,
                        weightUnit: "LB",
                        maxLength: 108.0,
                        dimensionUnit: "IN"
                    }
                }
            ]
        };
    }

    # Get compatibilities by specification
    #
    # + xEBAYCMARKETPLACEID - The seller's eBay marketplace
    # + contentType - The format of the request body
    # + payload - The specification used to look up compatible applications
    # + return - The retrieved compatibilities by specification
    resource function post compatibilities/get_compatibilities_by_specification(@http:Header {name: "X-EBAY-C-MARKETPLACE-ID"} string xEBAYCMARKETPLACEID, @http:Header {name: "Content-Type"} string contentType, @http:Payload SpecificationRequest payload) returns SpecificationResponseOk|http:NoContent|http:BadRequest|http:Unauthorized|http:InternalServerError {
        SpecificationResponse body = {
            pagination: {count: 2, offset: 0, 'limit: 100, total: 2},
            compatibilityDetails: [
                {
                    compatibilityDetails: [
                        {propertyName: "Make", propertyValue: "Toyota"},
                        {propertyName: "Model", propertyValue: "Camry"}
                    ]
                },
                {
                    compatibilityDetails: [
                        {propertyName: "Make", propertyValue: "Honda"},
                        {propertyName: "Model", propertyValue: "Accord"}
                    ]
                }
            ]
        };
        return <SpecificationResponseOk>{body};
    }

    # Get compatibility property names
    #
    # + xEBAYCMARKETPLACEID - The seller's eBay marketplace
    # + contentType - The format of the request body
    # + payload - The category and datasets whose property names are requested
    # + return - The retrieved compatibility property names
    resource function post compatibilities/get_compatibility_property_names(@http:Header {name: "X-EBAY-C-MARKETPLACE-ID"} string xEBAYCMARKETPLACEID, @http:Header {name: "Content-Type"} string contentType, @http:Payload PropertyNamesRequest payload) returns PropertyNamesResponseOk|http:NoContent|http:BadRequest|http:Unauthorized|http:InternalServerError {
        PropertyNamesResponse body = {
            categoryId: payload.categoryId,
            properties: [
                {
                    dataset: "Searchable",
                    propertyNames: [
                        {propertyName: "Make", propertyDisplayName: "Make", propertyNameMetadata: {displaySequence: 1}},
                        {propertyName: "Model", propertyDisplayName: "Model", propertyNameMetadata: {displaySequence: 2}}
                    ]
                }
            ]
        };
        return <PropertyNamesResponseOk>{body};
    }

    # Get compatibility property values
    #
    # + xEBAYCMARKETPLACEID - The seller's eBay marketplace
    # + contentType - The format of the request body
    # + payload - The category and property whose values are requested
    # + return - The retrieved compatibility property values
    resource function post compatibilities/get_compatibility_property_values(@http:Header {name: "X-EBAY-C-MARKETPLACE-ID"} string xEBAYCMARKETPLACEID, @http:Header {name: "Content-Type"} string contentType, @http:Payload PropertyValuesRequest payload) returns PropertyValuesResponseOk|http:NoContent|http:BadRequest|http:Unauthorized|http:InternalServerError {
        PropertyValuesResponse body = {
            propertyName: payload.propertyName ?: "Make",
            propertyValues: ["Ford", "Honda", "Toyota"],
            metadataVersion: "2025.10"
        };
        return <PropertyValuesResponseOk>{body};
    }

    # Get multiple compatibility property values
    #
    # + xEBAYCMARKETPLACEID - The seller's eBay marketplace
    # + contentType - The format of the request body
    # + payload - The category, property names and filters used for the lookup
    # + return - The retrieved compatibility property values
    resource function post compatibilities/get_multi_compatibility_property_values(@http:Header {name: "X-EBAY-C-MARKETPLACE-ID"} string xEBAYCMARKETPLACEID, @http:Header {name: "Content-Type"} string contentType, @http:Payload MultiCompatibilityPropertyValuesRequest payload) returns MultiCompatibilityPropertyValuesResponseOk|http:NoContent|http:BadRequest|http:Unauthorized|http:InternalServerError {
        MultiCompatibilityPropertyValuesResponse body = {
            metadataVersion: "2025.10",
            compatibilities: [
                {
                    compatibilityDetails: [
                        {propertyName: "Year", propertyValue: "2020"},
                        {propertyName: "Trim", propertyValue: "LE"}
                    ]
                },
                {
                    compatibilityDetails: [
                        {propertyName: "Year", propertyValue: "2021"},
                        {propertyName: "Trim", propertyValue: "XLE"}
                    ]
                }
            ]
        };
        return <MultiCompatibilityPropertyValuesResponseOk>{body};
    }

    # Get product compatibilities
    #
    # + xEBAYCMARKETPLACEID - The seller's eBay marketplace
    # + contentType - The format of the request body
    # + payload - The product identifier and filters used for the lookup
    # + return - The retrieved product compatibilities
    resource function post compatibilities/get_product_compatibilities(@http:Header {name: "X-EBAY-C-MARKETPLACE-ID"} string xEBAYCMARKETPLACEID, @http:Header {name: "Content-Type"} string contentType, @http:Payload ProductRequest payload) returns ProductResponseOk|http:NoContent|http:BadRequest|http:Unauthorized|http:InternalServerError {
        ProductResponse body = {
            pagination: {count: 1, offset: 0, 'limit: 100, total: 1},
            compatibilityDetails: [
                {
                    productDetails: [
                        {propertyName: "Make", propertyValue: "Toyota"},
                        {propertyName: "Model", propertyValue: "Corolla"}
                    ],
                    noteDetails: [
                        {propertyName: "Note", propertyValue: "Fits all trims"}
                    ]
                }
            ]
        };
        return <ProductResponseOk>{body};
    }
}

// Service-mode response types. `bal openapi --mode client` collapses 4XX/5XX
// to `error` and never emits these, so they are defined here for the mock only.
public type Error record {
    string domain?;
    string category?;
    string message?;
    int errorId?;
};

public type ErrorArrayBadRequest record {|
    *http:BadRequest;
    Error[] body;
|};

public type ErrorArrayInternalServerError record {|
    *http:InternalServerError;
    Error[] body;
|};

public type ErrorArrayNotFound record {|
    *http:NotFound;
    Error[] body;
|};

public type MultiCompatibilityPropertyValuesResponseOk record {|
    *http:Ok;
    MultiCompatibilityPropertyValuesResponse body;
|};

public type ProductResponseOk record {|
    *http:Ok;
    ProductResponse body;
|};

public type PropertyNamesResponseOk record {|
    *http:Ok;
    PropertyNamesResponse body;
|};

public type PropertyValuesResponseOk record {|
    *http:Ok;
    PropertyValuesResponse body;
|};

public type SpecificationResponseOk record {|
    *http:Ok;
    SpecificationResponse body;
|};
