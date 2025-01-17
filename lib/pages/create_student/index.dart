import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/bloc/student_blob/bloc.dart';
import 'package:qltv/bloc/student_blob/event.dart';
import 'package:qltv/enity/student.dart';
import 'package:qltv/routers/index.dart';

class CreateStudentScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final nameController = useTextEditingController();
    final classNameController = useTextEditingController();
    final codeController = useTextEditingController();

    final nameError = useState<String?>(null);
    final classNameError = useState<String?>(null);
    final codeError = useState<String?>(null);

    final studentBloc = BlocProvider.of<StudentBloc>(context);

    bool validateForm() {
      bool isValid = true;

      if (nameController.text.isEmpty) {
        nameError.value = "Vui lòng nhập tên sinh viên";
        isValid = false;
      } else {
        nameError.value = null;
      }

      if (classNameController.text.isEmpty) {
        classNameError.value = "Vui lòng nhập mô tả sách";
        isValid = false;
      } else {
        classNameError.value = null;
      }

      if (codeController.text.isEmpty) {
        codeError.value = "Vui lòng nhập tên tác giả";
        isValid = false;
      } else {
        codeError.value = null;
      }

      return isValid;
    }

    void submitForm() {
      if (validateForm()) {
        final name = nameController.text;
        final className = classNameController.text;
        final code = codeController.text;

        studentBloc.add(AddStudent(Student(
          id: 0,
          name: name,
          className: className,
          code: code,
          sb1: 0.0,
          sb2: 0.0,
          sb3: 0.0,
        )));

        nameController.clear();
        classNameController.clear();
        codeController.clear();

        rootNavigatorKey.currentState!.pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm Mới Sách"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Tên sinh viên',
                      hintText: 'Nhập tên sinh viên',
                      errorText: nameError.value,
                    ),
                  ),
                  SizedBox(height: 16.0.sp),
                  TextField(
                    controller: classNameController,
                    decoration: InputDecoration(
                      labelText: 'Tên lớp',
                      hintText: 'Nhập tên lớp',
                      errorText: classNameError.value,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0.sp),
                  TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      labelText: 'Mã sinh viên',
                      hintText: 'Nhập mã sinh viên',
                      errorText: codeError.value,
                    ),
                  ),
                  SizedBox(height: 32.0.sp),
                ],
              ),
            ),
            Container(
              width: width,
              child: ElevatedButton(
                onPressed: submitForm,
                child: Text('Thêm Mới'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
