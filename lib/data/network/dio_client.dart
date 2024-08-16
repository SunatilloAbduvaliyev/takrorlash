import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioClient {
  final Dio dio = Dio();

  // Singleton pattern
  DioClient._singleton() {
    dio
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 3)
      ..options.baseUrl = 'https://chat-app-71981-default-rtdb.firebaseio.com/'
      ..interceptors.add(TestInterceptor());
  }

  // Factory method for singleton instance
  static final DioClient _instance = DioClient._singleton();
  factory DioClient() => _instance;

  // GET request
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await dio.get(path, queryParameters: queryParams);
    } catch (error) {
      rethrow;
    }
  }

  // POST request
  Future<Response> post({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio.post(path, data: data);
    } catch (error) {
      rethrow;
    }
  }

  // PUT request
  Future<Response> put({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio.put(path, data: data);
    } on DioException catch(error) {
      throw Exception(error.response?.data['error']);//bu DioException bizga aniq xatoni chiqaridi ya'ni json fartda chiqarilgan xatoni
    }
    catch (error) {
      rethrow;
    }
  }

  // DELETE request
  Future<Response> delete({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await dio.delete(path, queryParameters: queryParams);
    } catch (error) {
      rethrow;
    }
  }
}

class TestInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("on request ${options.method}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("on response ${response.data}");
    super.onResponse(response, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("on error ${err.response?.data['error']}");
    super.onError(err, handler);
  }
}
