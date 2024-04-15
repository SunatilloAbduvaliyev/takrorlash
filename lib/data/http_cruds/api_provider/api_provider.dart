import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:takrorlash/data/model/book_model.dart';
import 'package:takrorlash/data/my_repository/my_response.dart';
import 'package:takrorlash/utils/constants/app_constants.dart';

class ApiProvider {
  Future<MyResponse> getAllBook() async {
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
}
