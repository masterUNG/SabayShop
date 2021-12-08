import 'package:flutter/material.dart';
import 'package:sabayshop/widgets/show_title.dart';

class ShowTextFormField extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool? scureText;
  final String? Function(String?)? funcValidate;
  final void Function(String?)? funcOnSave;
  const ShowTextFormField({
    Key? key,
    required this.label,
    required this.iconData,
    this.scureText,
    required this.funcValidate,
    required this.funcOnSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        onSaved: funcOnSave,
        validator: funcValidate,
        obscureText: scureText ?? false,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          label: ShowTitle(title: label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
