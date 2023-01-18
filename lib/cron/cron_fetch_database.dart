import 'package:flutter/material.dart';
import 'package:quizzproject/infra/service/quiz_service.dart';
import 'package:quizzproject/infra/service/test_service.dart';
import 'package:quizzproject/shared/models/test/test_model.dart';

class CronFetchDatabase {
  final TestService testService = TestService();
  final QuizService quizService = QuizService();

  Future<void> fetchDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    List<TestModel> tests = await testService.getAllTests();
    for (TestModel test in tests) {
      await testService.getTestDetails(test.id);
    }
    await quizService.getAllResults();
  }
}
