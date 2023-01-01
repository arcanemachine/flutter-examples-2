//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserDetails {
  /// Returns a new [UserDetails] instance.
  UserDetails({
    required this.pk,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
  });

  int pk;

  /// Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
  String username;

  String email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? firstName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserDetails &&
     other.pk == pk &&
     other.username == username &&
     other.email == email &&
     other.firstName == firstName &&
     other.lastName == lastName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (pk.hashCode) +
    (username.hashCode) +
    (email.hashCode) +
    (firstName == null ? 0 : firstName!.hashCode) +
    (lastName == null ? 0 : lastName!.hashCode);

  @override
  String toString() => 'UserDetails[pk=$pk, username=$username, email=$email, firstName=$firstName, lastName=$lastName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'pk'] = this.pk;
      json[r'username'] = this.username;
      json[r'email'] = this.email;
    if (this.firstName != null) {
      json[r'first_name'] = this.firstName;
    } else {
      json[r'first_name'] = null;
    }
    if (this.lastName != null) {
      json[r'last_name'] = this.lastName;
    } else {
      json[r'last_name'] = null;
    }
    return json;
  }

  /// Returns a new [UserDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserDetails[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserDetails(
        pk: mapValueOfType<int>(json, r'pk')!,
        username: mapValueOfType<String>(json, r'username')!,
        email: mapValueOfType<String>(json, r'email')!,
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
      );
    }
    return null;
  }

  static List<UserDetails>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserDetails> mapFromJson(dynamic json) {
    final map = <String, UserDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserDetails-objects as value to a dart map
  static Map<String, List<UserDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserDetails>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDetails.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'pk',
    'username',
    'email',
  };
}

