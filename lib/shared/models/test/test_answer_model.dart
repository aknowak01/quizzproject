import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/answer_dto.dart';

class TestAnswerModel extends Equatable {
  final String content;
  final bool isCorrect;

  const TestAnswerModel._({
    required this.content,
    required this.isCorrect,
  });
  
  factory TestAnswerModel.fromDto(AnswerDto answerDto) {
    return TestAnswerModel._(
      content: answerDto.content,
      isCorrect: answerDto.isCorrect,
    );
  }
  
  @override
  List<Object?> get props => <Object?>[content, isCorrect];
}
