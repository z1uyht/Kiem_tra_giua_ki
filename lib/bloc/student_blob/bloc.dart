import 'package:bloc/bloc.dart';
import 'package:qltv/bloc/student_blob/event.dart';
import 'package:qltv/bloc/student_blob/state.dart';
import 'package:qltv/enity/student.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<LoadStudents>((event, emit) {
      emit(StudentLoading());
      try {
        emit(StudentLoaded([]));
      } catch (e) {
        emit(StudentError("Failed to load Students"));
      }
    });

    on<AddStudent>((event, emit) {
      if (state is StudentLoaded) {
        final students = List<Student>.from((state as StudentLoaded).students);

        final newId = students.isNotEmpty ? students.last.id + 1 : 1;

        final newStudent = event.student.copyWith(id: newId);
        students.add(newStudent);

        emit(StudentLoaded(students));
      }
    });

    on<UpdateStudent>((event, emit) {
      if (state is StudentLoaded) {
        final students = (state as StudentLoaded).students.map((student) {
          return student.id == event.student.id ? event.student : student;
        }).toList();
        emit(StudentLoaded(students));
      }
    });

    on<DeleteStudent>((event, emit) {
      if (state is StudentLoaded) {
        final students = (state as StudentLoaded)
            .students
            .where((student) => student.id != event.studentId)
            .toList();
        emit(StudentLoaded(students));
      }
    });
  }
}
