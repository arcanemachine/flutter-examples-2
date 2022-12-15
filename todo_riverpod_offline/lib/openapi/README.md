# openapi
A basic todo list API.

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 0.0.1
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    path: /path/to/openapi
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/api.dart';

// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';

final api_instance = ApiApi();
final todo = Todo(); // Todo | 

try {
    final result = api_instance.apiTodosCreate(todo);
    print(result);
} catch (e) {
    print('Exception when calling ApiApi->apiTodosCreate: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ApiApi* | [**apiTodosCreate**](doc//ApiApi.md#apitodoscreate) | **POST** /api/todos | 
*ApiApi* | [**apiTodosDestroy**](doc//ApiApi.md#apitodosdestroy) | **DELETE** /api/todos/{id} | 
*ApiApi* | [**apiTodosList**](doc//ApiApi.md#apitodoslist) | **GET** /api/todos | 
*ApiApi* | [**apiTodosPartialUpdate**](doc//ApiApi.md#apitodospartialupdate) | **PATCH** /api/todos/{id} | 
*ApiApi* | [**apiTodosRetrieve**](doc//ApiApi.md#apitodosretrieve) | **GET** /api/todos/{id} | 
*ApiApi* | [**apiTodosUpdate**](doc//ApiApi.md#apitodosupdate) | **PUT** /api/todos/{id} | 


## Documentation For Models

 - [PatchedTodo](doc//PatchedTodo.md)
 - [Todo](doc//Todo.md)


## Documentation For Authorization


## basicAuth

- **Type**: HTTP Basic authentication

## cookieAuth

- **Type**: API key
- **API key parameter name**: sessionid
- **Location**: 


## Author


