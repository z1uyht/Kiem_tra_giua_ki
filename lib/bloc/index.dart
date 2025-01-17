import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qltv/bloc/student_blob/bloc.dart';
import 'package:qltv/bloc/student_blob/event.dart';

class RootBloc extends MultiBlocProvider {
  final Widget child;

  RootBloc({
    Key? key,
    required this.child,
  }) : super(
          providers: [
            BlocProvider<StudentBloc>(
              create: (context) => StudentBloc()..add(LoadStudents()),
            ),
          ],
          key: key,
          child: child,
        );
}
