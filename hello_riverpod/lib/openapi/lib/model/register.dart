//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Register {
  /// Returns a new [Register] instance.
  Register({
    required this.username,
    this.email,
    required this.password1,
    required this.password2,
  });

  String username;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  String password1;

  String password2;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Register &&
     other.username == username &&
     other.email == email &&
     other.password1 == password1 &&
     other.password2 == password2;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (username.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (password1.hashCode) +
    (password2.hashCode);

  @override
  String toString() => 'Register[username=$username, email=$email, password1=$password1, password2=$password2]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'username'] = this.username;
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
      json[r'password1'] = this.password1;
      json[r'password2'] = this.password2;
    return json;
  }

  /// Returns a new [Register] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Register? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Register[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Register[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Register(
        username: mapValueOfType<String>(json, r'username')!,
        email: mapValueOfType<String>(json, r'email'),
        password1: mapValueOfType<String>(json, r'password1')!,
        password2: mapValueOfType<String>(json, r'password2')!,
      );
    }
    return null;
  }

  static List<Register>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Register>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Register.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Register> mapFromJson(dynamic json) {
    final map = <String, Register>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Register.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Register-objects as value to a dart map
  static Map<String, List<Register>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Register>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Register.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'username',
    'password1',
    'password2',
  };
}

