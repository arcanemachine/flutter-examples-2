//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ApiApi {
  ApiApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/todos' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Todo] todo (required):
  Future<Response> apiTodosCreateWithHttpInfo(Todo todo,) async {
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
  Future<Todo?> apiTodosCreate(Todo todo,) async {
    final response = await apiTodosCreateWithHttpInfo(todo,);
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
  Future<Response> apiTodosDestroyWithHttpInfo(int id,) async {
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
  Future<void> apiTodosDestroy(int id,) async {
    final response = await apiTodosDestroyWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/todos' operation and returns the [Response].
  Future<Response> apiTodosListWithHttpInfo() async {
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

  Future<List<Todo>?> apiTodosList() async {
    final response = await apiTodosListWithHttpInfo();
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
  Future<Response> apiTodosPartialUpdateWithHttpInfo(int id, { PatchedTodo? patchedTodo, }) async {
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
  Future<Todo?> apiTodosPartialUpdate(int id, { PatchedTodo? patchedTodo, }) async {
    final response = await apiTodosPartialUpdateWithHttpInfo(id,  patchedTodo: patchedTodo, );
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
  Future<Response> apiTodosRetrieveWithHttpInfo(int id,) async {
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
  Future<Todo?> apiTodosRetrieve(int id,) async {
    final response = await apiTodosRetrieveWithHttpInfo(id,);
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
  Future<Response> apiTodosUpdateWithHttpInfo(int id, Todo todo,) async {
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
  Future<Todo?> apiTodosUpdate(int id, Todo todo,) async {
    final response = await apiTodosUpdateWithHttpInfo(id, todo,);
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
