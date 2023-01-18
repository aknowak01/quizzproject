import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/pages/dashboard/quiz_page_cubit/quiz_page_state.dart';
import 'package:quizzproject/infra/service/test_service.dart';
import 'package:quizzproject/shared/models/test/test_details_model.dart';

class QuizPageCubit extends Cubit<QuizPageState> {
  final TestService _testService = TestService();

  QuizPageCubit() : super(const QuizPageLoadingState());

  Future<void> reload(String id) async {
    try {
      TestDetailsModel testDetailsModel = await _testService.getTestDetails(id);
      emit(QuizPageLoadedState(testDetailsModel: testDetailsModel));
    } catch (e) {
      emit(const QuizPageErrorState('Error: Cannot load quiz'));
    }
  }
}