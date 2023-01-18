import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/quiz_get_results/response/quiz_result_dto.dart';

class GetQuizResultsResponse extends Equatable {
  final List<QuizResultDto> results;

  const GetQuizResultsResponse({
    required this.results,
  });
  
  factory GetQuizResultsResponse.fromJsonList(List<dynamic> json) => GetQuizResultsResponse(
        results: json.map<QuizResultDto>((dynamic e) => QuizResultDto.fromJson(e as Map<String, dynamic>)).toList(),
      );

  List<dynamic> toJsonList() => results.map<dynamic>((QuizResultDto e) => e.toJson()).toList();
  
  @override
  List<Object?> get props => <Object?>[results];
}
