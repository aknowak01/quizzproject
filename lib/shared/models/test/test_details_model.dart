import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/task_dto.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/test_get_details_response.dart';
import 'package:quizzproject/shared/models/test/test_task_model.dart';

class TestDetailsModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String level;
  final List<String> tags;
  final List<TestTaskModel> tasks;

  const TestDetailsModel._({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.tags,
    required this.tasks,
  });
  
  factory TestDetailsModel.fromDto(TestGetDetailsResponse testGetDetailsResponse) {
    return TestDetailsModel._(
      id: testGetDetailsResponse.id,
      name: testGetDetailsResponse.name,
      description: testGetDetailsResponse.description,
      level: testGetDetailsResponse.level,
      tags: testGetDetailsResponse.tags,
      tasks: testGetDetailsResponse.tasks.map<TestTaskModel>((TaskDto e) => TestTaskModel.fromDto(e)).toList(),
    );
  }

  @override
  List<Object?> get props => <Object?>[id, name, description, level, tags, tasks];
}
