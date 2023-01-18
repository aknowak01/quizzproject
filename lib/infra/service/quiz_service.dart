import 'package:quizzproject/infra/dto/quiz_create_result/request/quiz_create_result_request.dart';
import 'package:quizzproject/infra/dto/quiz_get_results/response/get_quiz_results_response.dart';
import 'package:quizzproject/infra/repository/local_quiz_repository.dart';
import 'package:quizzproject/infra/repository/quiz_repository.dart';
import 'package:quizzproject/shared/models/quiz/quiz_result_model.dart';

class QuizService {
  final QuizRepository quizRepository = QuizRepository();
  final LocalQuizRepository localQuizRepository = LocalQuizRepository();
  
  Future<List<QuizResultModel>> getAllResults() async {
    GetQuizResultsResponse getQuizResultsResponse = await quizRepository.getAllResults();
    localQuizRepository.saveAllResults(getQuizResultsResponse);
    List<QuizResultModel> quizResults = getQuizResultsResponse.results.map((e) => QuizResultModel.fromDto(e)).toList();
    return quizResults;
  }
  
  Future<void> postResult(QuizCreateResultRequest quizCreateResultRequest) async {
    await quizRepository.createResult(quizCreateResultRequest);
  }
}