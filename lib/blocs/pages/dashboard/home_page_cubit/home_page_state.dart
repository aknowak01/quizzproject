import 'package:equatable/equatable.dart';
import 'package:quizzproject/shared/models/test/test_model.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomePageLoadingState extends HomePageState {
  const HomePageLoadingState() : super();
}

class HomePageErrorState extends HomePageState {
  final String message;
  const HomePageErrorState(this.message) : super();
}

class HomePageLoadedState extends HomePageState {
  final List<TestModel> tests;

  const HomePageLoadedState({
    required this.tests,
  });

  @override
  List<Object> get props => [tests];
}
