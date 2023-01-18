import 'package:equatable/equatable.dart';

class AnswerDto extends Equatable {
  final String content;
  final bool isCorrect;

  const AnswerDto({
    required this.content,
    required this.isCorrect,
  });
  
  factory AnswerDto.fromJson(Map<String, dynamic> json) => AnswerDto(
        content: json['content'],
        isCorrect: json['isCorrect'],
      );
  
  Map<String, dynamic> toJson() => {
        'content': content,
        'isCorrect': isCorrect,
      };
  
  @override
  List<Object?> get props => <Object?>[content, isCorrect];
}
