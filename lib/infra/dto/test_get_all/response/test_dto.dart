import 'package:equatable/equatable.dart';

class TestDto extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<String> tags;
  final String level;
  final int numberOfTasks;

  const TestDto({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.level,
    required this.numberOfTasks,
  });
  
  factory TestDto.fromJson(Map<String, dynamic> json) => TestDto(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        tags: List<String>.from(json['tags']),
        level: json['level'],
        numberOfTasks: json['numberOfTasks'],
      );
  
  
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'tags': tags,
        'level': level,
        'numberOfTasks': numberOfTasks,
      };
  
  @override
  List<Object?> get props => <Object?>[id, name, description, tags, level, numberOfTasks];
}
