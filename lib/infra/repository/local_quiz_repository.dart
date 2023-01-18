import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quizzproject/infra/dto/quiz_get_results/response/get_quiz_results_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalQuizRepository {
  final Dio webClient = Dio(BaseOptions(baseUrl: 'https://tgryl.pl'));
  
  Future<GetQuizResultsResponse> getAllResults() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String result = prefs.getString('/quiz/results')!;
    List<dynamic> responseData = jsonDecode(result) as List<dynamic>;
    return GetQuizResultsResponse.fromJsonList(responseData);
  } 
  
  Future<void> saveAllResults(GetQuizResultsResponse getQuizResultsResponse) async {
    Response<dynamic> response = await webClient.get('/quiz/results');
    List<dynamic> responseData = response.data as List<dynamic>;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('/quiz/results', jsonEncode(responseData));
  }
}