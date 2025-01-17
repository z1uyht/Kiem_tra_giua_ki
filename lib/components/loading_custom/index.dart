import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldCustom extends HookWidget {
  final String? hintText;
  final String? label;
  final TextEditingController? textController;

  TextFieldCustom({
    this.hintText,
    this.label,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null ? Text(label ?? "") : Container(),
          TextFormField(
            controller: textController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xFF767676)),
              fillColor: Color(0xFF211428),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Color(0xFF8E06C5),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
          )
        ],
      ),
    );
  }
}
