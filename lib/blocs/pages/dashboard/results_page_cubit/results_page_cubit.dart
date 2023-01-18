import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/pages/dashboard/results_page_cubit/results_page_state.dart';
import 'package:quizzproject/infra/service/quiz_service.dart';
import 'package:quizzproject/shared/models/quiz/quiz_result_model.dart';

class ResultsPageCubit extends Cubit<ResultsPageState> {
  final QuizService _quizService = QuizService();

  ResultsPageCubit() : super(const ResultsPageLoadingState());

  Future<void> reload() async {
    try {
      List<QuizResultModel> quizResults = await _quizService.getAllResults();
      emit(ResultsPageLoadedState(
        quizResults: quizResults.reversed.toList(),
      ));
    } catch (e) {
      emit(const ResultsPageErrorState('Error: Cannot load results'));
    }
  }
}