import 'package:dio/dio.dart';
import 'package:quizzproject/infra/dto/quiz_create_result/request/quiz_create_result_request.dart';
import 'package:quizzproject/infra/dto/quiz_get_results/response/get_quiz_results_response.dart';

class QuizRepository {
  final Dio webClient = Dio(BaseOptions(baseUrl: 'https://tgryl.pl'));
  
  
  Future<GetQuizResultsResponse> getAllResults() async {
    Response<dynamic> response = await webClient.get('/quiz/results');
    List<dynamic> responseData = response.data as List<dynamic>;
    return GetQuizResultsResponse.fromJsonList(responseData);
  } 
  
  Future<void> createResult(QuizCreateResultRequest quizCreateResultRequest) async {
    await webClient.post('/quiz/result', data: quizCreateResultRequest.toJson());
  }
}