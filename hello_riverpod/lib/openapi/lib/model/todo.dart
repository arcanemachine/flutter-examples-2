//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Todo {
  /// Returns a new [Todo] instance.
  Todo({
    required this.id,
    required this.content,
    this.isCompleted,
  });

  int id;

  String content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isCompleted;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Todo &&
     other.id == id &&
     other.content == content &&
     other.isCompleted == isCompleted;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (content.hashCode) +
    (isCompleted == null ? 0 : isCompleted!.hashCode);

  @override
  String toString() => 'Todo[id=$id, content=$content, isCompleted=$isCompleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'content'] = this.content;
    if (this.isCompleted != null) {
      json[r'is_completed'] = this.isCompleted;
    } else {
      json[r'is_completed'] = null;
    }
    return json;
  }

  /// Returns a new [Todo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Todo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Todo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Todo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Todo(
        id: mapValueOfType<int>(json, r'id')!,
        content: mapValueOfType<String>(json, r'content')!,
        isCompleted: mapValueOfType<bool>(json, r'is_completed'),
      );
    }
    return null;
  }

  static List<Todo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Todo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Todo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Todo> mapFromJson(dynamic json) {
    final map = <String, Todo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Todo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Todo-objects as value to a dart map
  static Map<String, List<Todo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Todo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Todo.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'content',
  };
}

