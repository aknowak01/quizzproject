import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/pages/dashboard/home_page_cubit/home_page_state.dart';
import 'package:quizzproject/infra/service/test_service.dart';
import 'package:quizzproject/shared/models/test/test_model.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final TestService _testService = TestService();
  
  HomePageCubit() : super(const HomePageLoadingState());

  Future<void> reload() async {
    try {
      emit(const HomePageLoadingState());
      List<TestModel> tests = await _testService.getAllTests();
      tests.shuffle();
      emit(HomePageLoadedState(tests: tests));
    } catch (e) {
      emit(const HomePageErrorState('Error: Cannot load tests'));
    }
  }
  
  Future<TestModel> random() async{
     if( state is HomePageLoadedState){
       List<TestModel> tests = (state as HomePageLoadedState).tests;
       tests.shuffle();
       return tests.first;
     } else {
       await reload();
       return random();
     }
  }
}