//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Check the credentials and return the REST Token if the credentials are valid and authenticated. Calls Django Auth login method to register User ID in Django session framework  Accept the following POST parameters: username, password Return the REST Framework Token Object's key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Login] login (required):
  Future<Response> authLoginCreateWithHttpInfo(Login login,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/login/';

    // ignore: prefer_final_locals
    Object? postBody = login;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Check the credentials and return the REST Token if the credentials are valid and authenticated. Calls Django Auth login method to register User ID in Django session framework  Accept the following POST parameters: username, password Return the REST Framework Token Object's key.
  ///
  /// Parameters:
  ///
  /// * [Login] login (required):
  Future<Login?> authLoginCreate(Login login,) async {
    final response = await authLoginCreateWithHttpInfo(login,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Login',) as Login;
    
    }
    return null;
  }

  /// Calls Django logout method and delete the Token object assigned to the current User object.  Accepts/Returns nothing.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> authLogoutCreateWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/logout/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Calls Django logout method and delete the Token object assigned to the current User object.  Accepts/Returns nothing.
  Future<RestAuthDetail?> authLogoutCreate() async {
    final response = await authLogoutCreateWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Calls Django Auth SetPasswordForm save method.  Accepts the following POST parameters: new_password1, new_password2 Returns the success/fail message.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasswordChange] passwordChange (required):
  Future<Response> authPasswordChangeCreateWithHttpInfo(PasswordChange passwordChange,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/password/change/';

    // ignore: prefer_final_locals
    Object? postBody = passwordChange;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Calls Django Auth SetPasswordForm save method.  Accepts the following POST parameters: new_password1, new_password2 Returns the success/fail message.
  ///
  /// Parameters:
  ///
  /// * [PasswordChange] passwordChange (required):
  Future<RestAuthDetail?> authPasswordChangeCreate(PasswordChange passwordChange,) async {
    final response = await authPasswordChangeCreateWithHttpInfo(passwordChange,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Password reset e-mail link is confirmed, therefore this resets the user's password.  Accepts the following POST parameters: token, uid,     new_password1, new_password2 Returns the success/fail message.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasswordResetConfirm] passwordResetConfirm (required):
  Future<Response> authPasswordResetConfirmCreateWithHttpInfo(PasswordResetConfirm passwordResetConfirm,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/password/reset/confirm/';

    // ignore: prefer_final_locals
    Object? postBody = passwordResetConfirm;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Password reset e-mail link is confirmed, therefore this resets the user's password.  Accepts the following POST parameters: token, uid,     new_password1, new_password2 Returns the success/fail message.
  ///
  /// Parameters:
  ///
  /// * [PasswordResetConfirm] passwordResetConfirm (required):
  Future<RestAuthDetail?> authPasswordResetConfirmCreate(PasswordResetConfirm passwordResetConfirm,) async {
    final response = await authPasswordResetConfirmCreateWithHttpInfo(passwordResetConfirm,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Calls Django Auth PasswordResetForm save method.  Accepts the following POST parameters: email Returns the success/fail message.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasswordReset] passwordReset (required):
  Future<Response> authPasswordResetCreateWithHttpInfo(PasswordReset passwordReset,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/password/reset/';

    // ignore: prefer_final_locals
    Object? postBody = passwordReset;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Calls Django Auth PasswordResetForm save method.  Accepts the following POST parameters: email Returns the success/fail message.
  ///
  /// Parameters:
  ///
  /// * [PasswordReset] passwordReset (required):
  Future<RestAuthDetail?> authPasswordResetCreate(PasswordReset passwordReset,) async {
    final response = await authPasswordResetCreateWithHttpInfo(passwordReset,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/registration/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Register] register (required):
  Future<Response> authRegistrationCreateWithHttpInfo(Register register,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/registration/';

    // ignore: prefer_final_locals
    Object? postBody = register;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [Register] register (required):
  Future<Token?> authRegistrationCreate(Register register,) async {
    final response = await authRegistrationCreateWithHttpInfo(register,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Token',) as Token;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/registration/resend-email/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ResendEmailVerification] resendEmailVerification:
  Future<Response> authRegistrationResendEmailCreateWithHttpInfo({ ResendEmailVerification? resendEmailVerification, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/registration/resend-email/';

    // ignore: prefer_final_locals
    Object? postBody = resendEmailVerification;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ResendEmailVerification] resendEmailVerification:
  Future<RestAuthDetail?> authRegistrationResendEmailCreate({ ResendEmailVerification? resendEmailVerification, }) async {
    final response = await authRegistrationResendEmailCreateWithHttpInfo( resendEmailVerification: resendEmailVerification, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/registration/verify-email/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [VerifyEmail] verifyEmail (required):
  Future<Response> authRegistrationVerifyEmailCreateWithHttpInfo(VerifyEmail verifyEmail,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/registration/verify-email/';

    // ignore: prefer_final_locals
    Object? postBody = verifyEmail;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [VerifyEmail] verifyEmail (required):
  Future<RestAuthDetail?> authRegistrationVerifyEmailCreate(VerifyEmail verifyEmail,) async {
    final response = await authRegistrationVerifyEmailCreateWithHttpInfo(verifyEmail,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PatchedUserDetails] patchedUserDetails:
  Future<Response> authUserPartialUpdateWithHttpInfo({ PatchedUserDetails? patchedUserDetails, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/user/';

    // ignore: prefer_final_locals
    Object? postBody = patchedUserDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Parameters:
  ///
  /// * [PatchedUserDetails] patchedUserDetails:
  Future<UserDetails?> authUserPartialUpdate({ PatchedUserDetails? patchedUserDetails, }) async {
    final response = await authUserPartialUpdateWithHttpInfo( patchedUserDetails: patchedUserDetails, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetails',) as UserDetails;
    
    }
    return null;
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> authUserRetrieveWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/user/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  Future<UserDetails?> authUserRetrieve() async {
    final response = await authUserRetrieveWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetails',) as UserDetails;
    
    }
    return null;
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UserDetails] userDetails (required):
  Future<Response> authUserUpdateWithHttpInfo(UserDetails userDetails,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/user/';

    // ignore: prefer_final_locals
    Object? postBody = userDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Parameters:
  ///
  /// * [UserDetails] userDetails (required):
  Future<UserDetails?> authUserUpdate(UserDetails userDetails,) async {
    final response = await authUserUpdateWithHttpInfo(userDetails,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetails',) as UserDetails;
    
    }
    return null;
  }
}
