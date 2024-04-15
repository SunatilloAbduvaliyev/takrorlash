import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:takrorlash/data/model/book_model.dart';
import 'package:takrorlash/utils/constants/app_constants.dart';

import '../../my_response/my_response.dart';

class ApiProvider {
 static Future<MyResponse> getAllBook() async {
    try {
      http.Response response = await http.get(
        Uri.https(AppConstants.baseUrl),
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );
      if(response.statusCode == HttpStatus.ok){
        return MyResponse(
          data: (jsonDecode(response.body)['items'] as List?)?.map((e) => BookModel.fromJson(e)).toList() ?? []
        );
      }else{
        return MyResponse(errorMessage: response.statusCode.toString());
      }
    } catch (error) {
      return MyResponse(errorMessage: error.toString());
    }
  }
 static Future<MyResponse> addBook({required BookModel bookModel}) async {
    try {
      http.Response response = await http.post(
        Uri.https(AppConstants.baseUrl),
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([bookModel.toJson()]),
      );
      if(response.statusCode == HttpStatus.ok){
        return MyResponse(
            data: "Product added successfully!"
        );
      }else{
        return MyResponse(errorMessage: response.statusCode.toString());
      }
    } catch (error) {
      return MyResponse(errorMessage: error.toString());
    }
  }
 static Future<MyResponse> deleteBook({required String uuid}) async {
    try {
      http.Response response = await http.delete(
        Uri.https(AppConstants.baseUrl),
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([{"_uuid": uuid}]),
      );
      if(response.statusCode == HttpStatus.ok){
        return MyResponse(
            data: "Product delete successfully!"
        );
      }else{
        return MyResponse(errorMessage: response.statusCode.toString());
      }
    } catch (error) {
      return MyResponse(errorMessage: error.toString());
    }
  }
 static Future<MyResponse> updateBook({required BookModel bookModel}) async {
    try {
      http.Response response = await http.put(
        Uri.https(AppConstants.baseUrl),
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([bookModel.toForUpdateJson()]),
      );
      if(response.statusCode == HttpStatus.ok){
        return MyResponse(
            data: "Product update successfully!"
        );
      }else{
        return MyResponse(errorMessage: response.statusCode.toString());
      }
    } catch (error) {
      return MyResponse(errorMessage: error.toString());
    }
  }


}

