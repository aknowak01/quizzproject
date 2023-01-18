import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/test_get_all/response/test_dto.dart';

class TestModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<String> tags;
  final String level;
  final int numberOfTasks;

  const TestModel._({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.level,
    required this.numberOfTasks,
  });

  factory TestModel.fromDto(TestDto testDto) {
    return TestModel._(
      id: testDto.id,
      name: testDto.name,
      description: testDto.description,
      tags: testDto.tags,
      level: testDto.level,
      numberOfTasks: testDto.numberOfTasks,
    );
  }
  
  List<String> getHashTags() {
    return tags.map<String>((String tag) => '#$tag').toList();
  }

  @override
  List<Object?> get props => <Object>[];
}
