import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/singletons/login_cubit.dart';
import 'package:quizzproject/blocs/widgets/quiz_viewer/quiz_viewer_state.dart';
import 'package:quizzproject/infra/dto/quiz_create_result/request/quiz_create_result_request.dart';
import 'package:quizzproject/infra/service/quiz_service.dart';
import 'package:quizzproject/shared/models/test/test_answer_model.dart';
import 'package:quizzproject/shared/models/test/test_details_model.dart';

class QuizViewerCubit extends Cubit<QuizViewerState> {
  final QuizService quizService = QuizService();

  QuizViewerCubit() : super(const QuizViewerLoadingState());

  TestDetailsModel? _currentQuestion;

  void loadQuiz(TestDetailsModel testDetailsModel) {
    _currentQuestion = testDetailsModel;
    emit(QuizViewerLoadedState(
      currentQuestionIndex: 1,
      totalQuestions: testDetailsModel.tasks.length,
      currentQuestion: testDetailsModel.tasks[0],
      score: 0,
    ));
  }

  void verifyQuestion(TestAnswerModel answerModel) {
    if (state is! QuizViewerLoadedState) {
      emit(const QuizViewerErrorState(0));
      return;
    }
    QuizViewerLoadedState quizViewerLoadedState = state as QuizViewerLoadedState;
    int currentIndex = quizViewerLoadedState.currentQuestionIndex;
    int score = quizViewerLoadedState.score;

    if (answerModel.isCorrect) {
      score = score + 1;
    }

    int nextIndex = currentIndex + 1;
    if (nextIndex > quizViewerLoadedState.totalQuestions) {
      _finishTest(score);
    } else {
      emit(QuizViewerLoadedState(
        currentQuestionIndex: nextIndex,
        totalQuestions: quizViewerLoadedState.totalQuestions,
        currentQuestion: _currentQuestion!.tasks[nextIndex - 1],
        score: score,
      ));
    }
  }

  void nextQuestion() {
    if (state is! QuizViewerLoadedState) {
      emit(const QuizViewerErrorState(0));
      return;
    }

    QuizViewerLoadedState quizViewerLoadedState = state as QuizViewerLoadedState;

    int currentIndex = quizViewerLoadedState.currentQuestionIndex;
    int score = quizViewerLoadedState.score;
    int nextIndex = currentIndex + 1;
    if (nextIndex > quizViewerLoadedState.totalQuestions) {
      _finishTest(score);
    } else {
      emit(quizViewerLoadedState.copyWith(
        score: score,
        currentQuestionIndex: nextIndex,
        currentQuestion: _currentQuestion!.tasks[nextIndex - 1],
      ));
    }
  }

  Future<void> _finishTest(int score) async {
    if (state is! QuizViewerLoadedState) {
      emit(const QuizViewerErrorState(0));
      return;
    }

    QuizViewerLoadedState quizViewerLoadedState = state as QuizViewerLoadedState;
    emit(const QuizViewerLoadingState());
    try {
      await quizService.postResult(
        QuizCreateResultRequest(
          nick: loginCubit.state,
          score: score,
          total: quizViewerLoadedState.totalQuestions,
          type: _currentQuestion!.tags.join(','),
        ),
      );
      emit(QuizViewerSuccessState(score: score));
    } catch(_) {
      emit(QuizViewerErrorState(score));
    }

  }
}
