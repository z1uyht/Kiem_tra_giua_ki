import 'package:equatable/equatable.dart';
import 'package:qltv/enity/student.dart';

abstract class StudentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddStudent extends StudentEvent {
  final Student student;

  AddStudent(this.student);

  @override
  List<Object?> get props => [student];
}

class UpdateStudent extends StudentEvent {
  final Student student;

  UpdateStudent(this.student);

  @override
  List<Object?> get props => [student];
}

class DeleteStudent extends StudentEvent {
  final int studentId;

  DeleteStudent(this.studentId);

  @override
  List<Object?> get props => [studentId];
}

class LoadStudents extends StudentEvent {}
