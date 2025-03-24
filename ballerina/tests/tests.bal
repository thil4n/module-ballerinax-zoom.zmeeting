// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
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
import ballerina/io;
import ballerina/test;

configurable boolean isLive = false;
configurable string clientId = "testClientId";
configurable string clientSecret = "testClientSecret";
configurable string refreshToken = "testRefreshToken";

string serviceUrl = "https://api.zoom.us/v2/";


// Zoom client for interacting with the API
final Client zoomClient;

function init() returns error? {

    zoomClient = check new Client(config, serviceUrl);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
@test:BeforeGroups
function beforeGroups1() {
    io:println("I'm the before groups function!");
}

// Test: Get Schema - Fetches a list of object schemas
@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testGetSchemas() returns error? {
    // Make GET request to fetch schemas
    CollectionResponseObjectSchemaNoPaging response = check hpClient->/.get();
    test:assertNotEquals(response.results, ());
}
