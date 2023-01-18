import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quizzproject/infra/dto/test_get_all/response/test_get_all_response.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/test_get_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalTestRepository {

  Future<TestGetAllResponse> getAllTests() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String result = prefs.getString('/quiz/tests')!;
    List<dynamic> responseData = jsonDecode(result) as List<dynamic>;
    return TestGetAllResponse.fromJsonList(responseData);
  }

  Future<TestGetDetailsResponse> getTestDetails(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String result = prefs.getString('/quiz/tests/$id')!;
    Map<String, dynamic> responseData = jsonDecode(result) as Map<String, dynamic>;
    return TestGetDetailsResponse.fromJson(responseData);
  }
  
  Future<void> saveAllTests(TestGetAllResponse testGetAllResponse) async {
    List<dynamic> responseData = testGetAllResponse.toJsonList();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('/quiz/tests', jsonEncode(responseData));
  }
  
  Future<void> saveTestDetails(TestGetDetailsResponse testGetDetailsResponse) async {
    Map<String, dynamic> responseData = testGetDetailsResponse.toJson();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('/quiz/tests/${testGetDetailsResponse.id}', jsonEncode(responseData));
  }
}
