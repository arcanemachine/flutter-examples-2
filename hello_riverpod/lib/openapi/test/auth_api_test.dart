//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for AuthApi
void main() {
  // final instance = AuthApi();

  group('tests for AuthApi', () {
    // Check the credentials and return the REST Token if the credentials are valid and authenticated. Calls Django Auth login method to register User ID in Django session framework  Accept the following POST parameters: username, password Return the REST Framework Token Object's key.
    //
    //Future<Login> authLoginCreate(Login login) async
    test('test authLoginCreate', () async {
      // TODO
    });

    // Calls Django logout method and delete the Token object assigned to the current User object.  Accepts/Returns nothing.
    //
    //Future<RestAuthDetail> authLogoutCreate() async
    test('test authLogoutCreate', () async {
      // TODO
    });

    // Calls Django Auth SetPasswordForm save method.  Accepts the following POST parameters: new_password1, new_password2 Returns the success/fail message.
    //
    //Future<RestAuthDetail> authPasswordChangeCreate(PasswordChange passwordChange) async
    test('test authPasswordChangeCreate', () async {
      // TODO
    });

    // Password reset e-mail link is confirmed, therefore this resets the user's password.  Accepts the following POST parameters: token, uid,     new_password1, new_password2 Returns the success/fail message.
    //
    //Future<RestAuthDetail> authPasswordResetConfirmCreate(PasswordResetConfirm passwordResetConfirm) async
    test('test authPasswordResetConfirmCreate', () async {
      // TODO
    });

    // Calls Django Auth PasswordResetForm save method.  Accepts the following POST parameters: email Returns the success/fail message.
    //
    //Future<RestAuthDetail> authPasswordResetCreate(PasswordReset passwordReset) async
    test('test authPasswordResetCreate', () async {
      // TODO
    });

    //Future<Token> authRegistrationCreate(Register register) async
    test('test authRegistrationCreate', () async {
      // TODO
    });

    //Future<RestAuthDetail> authRegistrationResendEmailCreate({ ResendEmailVerification resendEmailVerification }) async
    test('test authRegistrationResendEmailCreate', () async {
      // TODO
    });

    //Future<RestAuthDetail> authRegistrationVerifyEmailCreate(VerifyEmail verifyEmail) async
    test('test authRegistrationVerifyEmailCreate', () async {
      // TODO
    });

    // Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
    //
    //Future<UserDetails> authUserPartialUpdate({ PatchedUserDetails patchedUserDetails }) async
    test('test authUserPartialUpdate', () async {
      // TODO
    });

    // Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
    //
    //Future<UserDetails> authUserRetrieve() async
    test('test authUserRetrieve', () async {
      // TODO
    });

    // Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
    //
    //Future<UserDetails> authUserUpdate(UserDetails userDetails) async
    test('test authUserUpdate', () async {
      // TODO
    });

  });
}
