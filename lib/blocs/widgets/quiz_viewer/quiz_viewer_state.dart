import 'package:equatable/equatable.dart';
import 'package:quizzproject/shared/models/quiz/quiz_result_model.dart';
import 'package:quizzproject/shared/models/test/test_task_model.dart';

abstract class QuizViewerState extends Equatable {
  const QuizViewerState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class QuizViewerLoadingState extends QuizViewerState {
  const QuizViewerLoadingState() : super();
}

class QuizViewerErrorState extends QuizViewerSuccessState {
  const QuizViewerErrorState(int score) : super(score: score);
}

class QuizViewerSuccessState extends QuizViewerState {
  final int score;

  const QuizViewerSuccessState({
    required this.score,
  }) : super();
  
  @override
  List<Object?> get props => <Object?>[score];
}

class QuizViewerLoadedState extends QuizViewerState {
  final int currentQuestionIndex;
  final int totalQuestions;
  final TestTaskModel currentQuestion;
  final int score;

  const QuizViewerLoadedState({
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.currentQuestion,
    required this.score,
  });

  QuizViewerLoadedState copyWith({
    int? score,
    int? currentQuestionIndex,
    int? totalQuestions,
    TestTaskModel? currentQuestion,
  }) =>
      QuizViewerLoadedState(
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        totalQuestions: totalQuestions ?? this.totalQuestions,
        currentQuestion: currentQuestion ?? this.currentQuestion,
        score: score ?? this.score,
      );

  @override
  List<Object?> get props => <Object?>[currentQuestionIndex, totalQuestions, currentQuestion, score];
}
