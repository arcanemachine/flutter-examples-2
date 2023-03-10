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

// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final login = Login(); // Login | 

try {
    final result = api_instance.authLoginCreate(login);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authLoginCreate: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuthApi* | [**authLoginCreate**](doc//AuthApi.md#authlogincreate) | **POST** /api/auth/login/ | 
*AuthApi* | [**authLogoutCreate**](doc//AuthApi.md#authlogoutcreate) | **POST** /api/auth/logout/ | 
*AuthApi* | [**authPasswordChangeCreate**](doc//AuthApi.md#authpasswordchangecreate) | **POST** /api/auth/password/change/ | 
*AuthApi* | [**authPasswordResetConfirmCreate**](doc//AuthApi.md#authpasswordresetconfirmcreate) | **POST** /api/auth/password/reset/confirm/ | 
*AuthApi* | [**authPasswordResetCreate**](doc//AuthApi.md#authpasswordresetcreate) | **POST** /api/auth/password/reset/ | 
*AuthApi* | [**authRegistrationCreate**](doc//AuthApi.md#authregistrationcreate) | **POST** /api/auth/registration/ | 
*AuthApi* | [**authRegistrationResendEmailCreate**](doc//AuthApi.md#authregistrationresendemailcreate) | **POST** /api/auth/registration/resend-email/ | 
*AuthApi* | [**authRegistrationVerifyEmailCreate**](doc//AuthApi.md#authregistrationverifyemailcreate) | **POST** /api/auth/registration/verify-email/ | 
*AuthApi* | [**authUserPartialUpdate**](doc//AuthApi.md#authuserpartialupdate) | **PATCH** /api/auth/user/ | 
*AuthApi* | [**authUserRetrieve**](doc//AuthApi.md#authuserretrieve) | **GET** /api/auth/user/ | 
*AuthApi* | [**authUserUpdate**](doc//AuthApi.md#authuserupdate) | **PUT** /api/auth/user/ | 
*TodosApi* | [**todosCreate**](doc//TodosApi.md#todoscreate) | **POST** /api/todos | 
*TodosApi* | [**todosDestroy**](doc//TodosApi.md#todosdestroy) | **DELETE** /api/todos/{id} | 
*TodosApi* | [**todosList**](doc//TodosApi.md#todoslist) | **GET** /api/todos | 
*TodosApi* | [**todosPartialUpdate**](doc//TodosApi.md#todospartialupdate) | **PATCH** /api/todos/{id} | 
*TodosApi* | [**todosRetrieve**](doc//TodosApi.md#todosretrieve) | **GET** /api/todos/{id} | 
*TodosApi* | [**todosUpdate**](doc//TodosApi.md#todosupdate) | **PUT** /api/todos/{id} | 


## Documentation For Models

 - [Login](doc//Login.md)
 - [PasswordChange](doc//PasswordChange.md)
 - [PasswordReset](doc//PasswordReset.md)
 - [PasswordResetConfirm](doc//PasswordResetConfirm.md)
 - [PatchedTodo](doc//PatchedTodo.md)
 - [PatchedUserDetails](doc//PatchedUserDetails.md)
 - [Register](doc//Register.md)
 - [ResendEmailVerification](doc//ResendEmailVerification.md)
 - [RestAuthDetail](doc//RestAuthDetail.md)
 - [Todo](doc//Todo.md)
 - [Token](doc//Token.md)
 - [UserDetails](doc//UserDetails.md)
 - [VerifyEmail](doc//VerifyEmail.md)


## Documentation For Authorization


## cookieAuth

- **Type**: API key
- **API key parameter name**: sessionid
- **Location**: 

## tokenAuth

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header


## Author



