import 'package:equatable/equatable.dart';

class QuizResultDto extends Equatable {
  final String id;
  final String nick;
  final int score;
  final int total;
  final String type;
  final DateTime createdOn;
  final DateTime? updatedOn;

  const QuizResultDto({
    required this.id,
    required this.nick,
    required this.score,
    required this.total,
    required this.type,
    required this.createdOn,
    this.updatedOn,
  });

  factory QuizResultDto.fromJson(Map<String, dynamic> json) => QuizResultDto(
        id: json['id'],
        nick: json['nick'],
        score: json['score'],
        total: json['total'],
        type: json['type'],
        createdOn: DateTime.parse(json['createdOn']),
        updatedOn: json['updatedOn'] != null ? DateTime.parse(json['updatedOn']) : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nick': nick,
        'score': score,
        'total': total,
        'type': type,
        'createdOn': createdOn.toIso8601String(),
        'updatedOn': updatedOn?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[id, nick, score, total, type, createdOn, updatedOn];
}
