import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/quiz_get_results/response/quiz_result_dto.dart';

class QuizModel extends Equatable {
  final String id;
  final String nick;
  final int score;
  final int total;
  final String type;
  final DateTime createdOn;
  final DateTime? updatedOn;

  const QuizModel._({
    required this.id,
    required this.nick,
    required this.score,
    required this.total,
    required this.type,
    required this.createdOn,
    this.updatedOn,
  });
  
  factory QuizModel.fromDto(QuizResultDto dto) => QuizModel._(
        id: dto.id,
        nick: dto.nick,
        score: dto.score,
        total: dto.total,
        type: dto.type,
        createdOn: dto.createdOn,
        updatedOn: dto.updatedOn,
      );

  @override
  List<Object?> get props => <Object?>[id, nick, score, total, type, createdOn, updatedOn];
}
