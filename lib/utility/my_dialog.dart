import 'package:flutter/material.dart';
import 'package:sabayshop/utility/my_constant.dart';
import 'package:sabayshop/widgets/show_image.dart';
import 'package:sabayshop/widgets/show_title.dart';

class MyDialog {
  Future<void> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const ShowImage(),
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(title: message),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }
}
