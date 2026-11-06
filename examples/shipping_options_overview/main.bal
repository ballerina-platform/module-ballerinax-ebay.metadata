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

// Lists the shipping options of an eBay marketplace: the supported carriers, the handling times
// and the shipping services offered by one carrier.

import ballerina/io;
import ballerinax/ebay.metadata;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string marketplaceId = "EBAY_US";
configurable string carrier = "USPS";

public function main() returns error? {
    metadata:Client ebay = check new ({
        auth: {
            clientId,
            clientSecret,
            scopes: ["https://api.ebay.com/oauth/api_scope"]
        }
    });

    metadata:ShippingCarrierResponse carriers = check ebay->getShippingCarriers(marketplaceId);
    foreach metadata:ShippingCarrier shippingCarrier in carriers.shippingCarriers {
        io:println("Carrier ", shippingCarrier.shippingCarrier, ": ", shippingCarrier.description);
    }

    metadata:ShippingHandlingTimeResponse handlingTimes = check ebay->getHandlingTimes(marketplaceId);
    foreach metadata:ShippingHandlingTime handlingTime in handlingTimes.handlingTimes {
        io:println("Handling time up to ", handlingTime.maxHandlingTime, " days: ", handlingTime.description);
    }

    metadata:ShippingServiceResponse services = check ebay->getShippingServices(marketplaceId);
    int carrierServices = 0;
    foreach metadata:ShippingService shippingService in services.shippingServices {
        if shippingService.shippingCarrier == carrier {
            carrierServices += 1;
            io:println(carrier, " service ", shippingService.shippingService, ": ", shippingService.description);
        }
    }
    if carrierServices == 0 {
        return error(string `No shipping services found for carrier ${carrier} on ${marketplaceId}`);
    }
}
