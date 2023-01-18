import 'package:equatable/equatable.dart';
import 'package:quizzproject/infra/dto/test_get_all/response/test_dto.dart';

class TestGetAllResponse extends Equatable {
  final List<TestDto> testList;

  const TestGetAllResponse({
    required this.testList,
  });
  
  factory TestGetAllResponse.fromJsonList(List<dynamic> json) => TestGetAllResponse(
        testList: json.map<TestDto>((dynamic e) => TestDto.fromJson(e as Map<String, dynamic>)).toList(),
      );
  
  List<dynamic> toJsonList() => testList.map<dynamic>((TestDto e) => e.toJson()).toList();

  @override
  List<Object?> get props => <Object?>[testList];
}