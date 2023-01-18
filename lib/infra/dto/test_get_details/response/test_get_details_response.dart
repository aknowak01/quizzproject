import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/task_dto.dart';

class TestGetDetailsResponse extends Equatable {
  final String id;
  final String name;
  final String description;
  final String level;
  final List<String> tags;
  final List<TaskDto> tasks;

  const TestGetDetailsResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.tags,
    required this.tasks,
  });
  
  factory TestGetDetailsResponse.fromJson(Map<String, dynamic> json) => TestGetDetailsResponse(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        level: json['level'],
        tags: List<String>.from(json['tags']),
        tasks: json['tasks'].map<TaskDto>((dynamic e) => TaskDto.fromJson(e as Map<String, dynamic>)).toList(),
      );
  
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'level': level,
        'tags': tags,
        'tasks': tasks.map<dynamic>((TaskDto e) => e.toJson()).toList(),
      };
  
  @override
  List<Object?> get props => <Object?>[id, name, description, level, tags, tasks];
}
