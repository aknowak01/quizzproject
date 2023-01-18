import 'package:equatable/equatable.dart';
import 'package:quizzproject/shared/models/quiz/quiz_result_model.dart';
import 'package:quizzproject/shared/models/test/test_model.dart';

abstract class ResultsPageState extends Equatable {
  const ResultsPageState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ResultsPageLoadingState extends ResultsPageState {
  const ResultsPageLoadingState() : super();
}

class ResultsPageErrorState extends ResultsPageState {
  final String message;
  const ResultsPageErrorState(this.message) : super();
}


class ResultsPageLoadedState extends ResultsPageState {
  final List<QuizResultModel> quizResults;

  const ResultsPageLoadedState({
    required this.quizResults,
  });

  @override
  List<Object> get props => [quizResults];
}
