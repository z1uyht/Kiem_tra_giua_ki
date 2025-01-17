import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qltv/components/button_custom/index.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/enity/student.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/pages/detail_student/index.dart';
import 'package:qltv/routers/index.dart';

class StudentComponent extends HookWidget {
  final Student student;

  StudentComponent({
    super.key,
    required this.student,
  });

  void handleCreateBook() {
    rootNavigatorKey.currentState!.pushNamed(RouterName.createStudent);
  }

  void detailBook(Student book) {
    rootNavigatorKey.currentState!.pushNamed(
      RouterName.detailStudent,
      arguments: ArgsDetailStudent(id: book.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
        border: Border.all(width: 2.0.sp, color: Color(0xFF6E54B5)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: TextStyle(fontSize: 18.0.sp),
                ),
                Text("Mã sinh viên: ${student.code}"),
              ],
            ),
            ButtonCustom(
              text: "Chi tiết",
              onPressed: () {
                detailBook(student);
              },
            ),
          ],
        ),
      ),
    );
  }
}
