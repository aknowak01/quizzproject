import 'package:equatable/equatable.dart';

class QuizCreateResultRequest extends Equatable {
  final String nick;
  final int score;
  final int total;
  final String type;

  const QuizCreateResultRequest({
    required this.nick,
    required this.score,
    required this.total,
    required this.type,
  });
  
  factory QuizCreateResultRequest.fromJson(Map<String, dynamic> json) => QuizCreateResultRequest(
        nick: json['nick'],
        score: json['score'],
        total: json['total'],
        type: json['type'],
      );
  
  Map<String, dynamic> toJson() => {
        'nick': nick,
        'score': score,
        'total': total,
        'type': type,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}
