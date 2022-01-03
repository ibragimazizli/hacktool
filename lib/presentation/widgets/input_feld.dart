import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  InputField(
      {Key? key,
      required this.controller,
      required this.validator,
      required this.fieldName})
      : super(key: key);
  TextEditingController controller;
  String? fieldName;
  String Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color:const Color.fromRGBO(2, 26, 63, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: validator,
                autocorrect: false,
                controller: controller,
                style:const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintStyle:const TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      fieldName!,
                      style:const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
