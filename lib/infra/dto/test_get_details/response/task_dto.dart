import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/answer_dto.dart';

class TaskDto extends Equatable {
  final String question;
  final int duration;
  final List<AnswerDto> answers;

  const TaskDto({
    required this.question,
    required this.duration,
    required this.answers,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) => TaskDto(
        question: json['question'],
        duration: json['duration'],
        answers: json['answers'].map<AnswerDto>((dynamic e) => AnswerDto.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'question': question,
        'duration': duration,
        'answers': answers.map<dynamic>((AnswerDto e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => <Object?>[question, duration, answers];
}
