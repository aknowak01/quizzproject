import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/answer_dto.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/task_dto.dart';
import 'package:quizzproject/shared/models/test/test_answer_model.dart';

class TestTaskModel extends Equatable {
  final String question;
  final int duration;
  final List<TestAnswerModel> answers;

  const TestTaskModel._({
    required this.question,
    required this.duration,
    required this.answers,
  });
  
  factory TestTaskModel.fromDto(TaskDto taskDto) {
    return TestTaskModel._(
      question: taskDto.question,
      duration: taskDto.duration,
      answers: taskDto.answers.map<TestAnswerModel>((AnswerDto e) => TestAnswerModel.fromDto(e)).toList(),
    );
  }

  @override
  List<Object?> get props => <Object?>[question, duration, answers];
}
