//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyEmail {
  /// Returns a new [VerifyEmail] instance.
  VerifyEmail({
    required this.key,
  });

  String key;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VerifyEmail &&
     other.key == key;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key.hashCode);

  @override
  String toString() => 'VerifyEmail[key=$key]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'key'] = this.key;
    return json;
  }

  /// Returns a new [VerifyEmail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyEmail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VerifyEmail[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VerifyEmail[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyEmail(
        key: mapValueOfType<String>(json, r'key')!,
      );
    }
    return null;
  }

  static List<VerifyEmail>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VerifyEmail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyEmail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyEmail> mapFromJson(dynamic json) {
    final map = <String, VerifyEmail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyEmail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyEmail-objects as value to a dart map
  static Map<String, List<VerifyEmail>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VerifyEmail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyEmail.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
  };
}

