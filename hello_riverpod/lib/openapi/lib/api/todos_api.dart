//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TodosApi {
  TodosApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/todos' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Todo] todo (required):
  Future<Response> todosCreateWithHttpInfo(Todo todo,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/todos';

    // ignore: prefer_final_locals
    Object? postBody = todo;

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
  /// * [Todo] todo (required):
  Future<Todo?> todosCreate(Todo todo,) async {
    final response = await todosCreateWithHttpInfo(todo,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Todo',) as Todo;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/todos/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  Future<Response> todosDestroyWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/todos/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  Future<void> todosDestroy(int id,) async {
    final response = await todosDestroyWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/todos' operation and returns the [Response].
  Future<Response> todosListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/todos';

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

  Future<List<Todo>?> todosList() async {
    final response = await todosListWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Todo>') as List)
        .cast<Todo>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'PATCH /api/todos/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  ///
  /// * [PatchedTodo] patchedTodo:
  Future<Response> todosPartialUpdateWithHttpInfo(int id, { PatchedTodo? patchedTodo, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/todos/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = patchedTodo;

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

  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  ///
  /// * [PatchedTodo] patchedTodo:
  Future<Todo?> todosPartialUpdate(int id, { PatchedTodo? patchedTodo, }) async {
    final response = await todosPartialUpdateWithHttpInfo(id,  patchedTodo: patchedTodo, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Todo',) as Todo;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/todos/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  Future<Response> todosRetrieveWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/todos/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  Future<Todo?> todosRetrieve(int id,) async {
    final response = await todosRetrieveWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Todo',) as Todo;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/todos/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  ///
  /// * [Todo] todo (required):
  Future<Response> todosUpdateWithHttpInfo(int id, Todo todo,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/todos/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = todo;

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

  /// Parameters:
  ///
  /// * [int] id (required):
  ///   A unique integer value identifying this todo.
  ///
  /// * [Todo] todo (required):
  Future<Todo?> todosUpdate(int id, Todo todo,) async {
    final response = await todosUpdateWithHttpInfo(id, todo,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Todo',) as Todo;
    
    }
    return null;
  }
}
