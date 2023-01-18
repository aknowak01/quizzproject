import 'package:equatable/equatable.dart';
import 'package:quizzproject/shared/models/test/test_details_model.dart';

abstract class QuizPageState extends Equatable {
  const QuizPageState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class QuizPageLoadingState extends QuizPageState {
  const QuizPageLoadingState() : super();
}

class QuizPageErrorState extends QuizPageState {
  final String message;
  const QuizPageErrorState(this.message) : super();
}

class QuizPageLoadedState extends QuizPageState {
  final TestDetailsModel testDetailsModel;

  const QuizPageLoadedState({
    required this.testDetailsModel,
  });

  @override
  List<Object> get props => [testDetailsModel];
}
