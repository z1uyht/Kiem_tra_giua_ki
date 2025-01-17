import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/bloc/student_blob/bloc.dart';
import 'package:qltv/bloc/student_blob/event.dart';
import 'package:qltv/enity/student.dart';

class DetailStudentScreen extends HookWidget {
  final ArgsDetailStudent args;

  DetailStudentScreen({required this.args});

  @override
  Widget build(BuildContext context) {
    final studentBloc = BlocProvider.of<StudentBloc>(context);

    final studentDetail = (studentBloc.state.props as List<Student>).firstWhere(
      (student) => student.id == args.id,
    );

    // Controllers for editing
    final nameController = useTextEditingController(
      text: studentDetail.name,
    );
    final classNameController = useTextEditingController(
      text: studentDetail.className,
    );
    final codeController = useTextEditingController(
      text: studentDetail.code,
    );
    final sb1Controller = useTextEditingController(
      text: "${studentDetail.sb1}",
    );
    final sb2Controller = useTextEditingController(
      text: "${studentDetail.sb2}",
    );
    final sb3Controller = useTextEditingController(
      text: "${studentDetail.sb3}",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin chi tiết"),
        leadingWidth: 24.0.sp,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Tên sinh viên",
                    ),
                  ),
                  SizedBox(height: 8.0.sp),
                  TextField(
                    controller: classNameController,
                    decoration: InputDecoration(
                      labelText: "Lớp học",
                    ),
                  ),
                  SizedBox(height: 8.0.sp),
                  TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      labelText: "Mã sinh viên",
                    ),
                    maxLines: 3,
                  ),
                  // sb1
                  SizedBox(height: 16.0.sp),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: sb1Controller,
                    decoration: InputDecoration(
                      labelText: "Điểm môn 1",
                    ),
                  ),
                  // sb2
                  SizedBox(height: 16.0.sp),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: sb2Controller,
                    decoration: InputDecoration(
                      labelText: "Điểm môn 2",
                    ),
                  ),
                  // sb3
                  SizedBox(height: 16.0.sp),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: sb3Controller,
                    decoration: InputDecoration(
                      labelText: "Điểm môn 3",
                    ),
                  ),
                  SizedBox(height: 16.0.sp),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      studentBloc.add(DeleteStudent(studentDetail.id));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Xóa",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0.sp),
                  ElevatedButton(
                    onPressed: () {
                      // Trigger update event
                      final updatedStudent = studentDetail.copyWith(
                        name: nameController.text,
                        className: classNameController.text,
                        code: codeController.text,
                        sb1: double.parse(sb1Controller.text),
                        sb2: double.parse(sb2Controller.text),
                        sb3: double.parse(sb3Controller.text),
                      );
                      studentBloc.add(UpdateStudent(updatedStudent));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8E07C2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Lưu",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArgsDetailStudent {
  final int id;

  ArgsDetailStudent({required this.id});
}
