import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/bloc/student_blob/bloc.dart';
import 'package:qltv/bloc/student_blob/state.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/enity/student.dart';
import 'package:qltv/pages/manager_student/student.dart';
import 'package:qltv/routers/index.dart';

class ManagerStudentScreen extends HookWidget {
  void handleCreateStudent() {
    rootNavigatorKey.currentState!.pushNamed(RouterName.createStudent);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<StudentBloc, StudentState>(builder: (context, state) {
      final listStudent = List<Student>.from(state.props);

      return Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0.sp),
                  itemCount: listStudent.length,
                  itemBuilder: (context, index) {
                    final student = listStudent[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.0.sp),
                      child: StudentComponent(
                        student: student,
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: screenWidth,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: ElevatedButton(
                    onPressed: handleCreateStudent,
                    child: Text("Thêm mới"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
