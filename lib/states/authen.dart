

import 'package:flutter/material.dart';
import 'package:sabayshop/utility/my_constant.dart';
import 'package:sabayshop/widgets/show_image.dart';
import 'package:sabayshop/widgets/show_textformfield.dart';
import 'package:sabayshop/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImage(),
                  buildShowTitle(),
                  buildEmail(),
                  buildPassword(),
                  buildLogin(),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                        title: 'Non Account ?',
                        textStyle: MyConstant().h2Style(),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, MyConstant.routeCreateAccount),
                        child: const Text(' Create Account'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ShowTextFormField buildPassword() {
    return ShowTextFormField(
      label: 'Password',
      iconData: Icons.lock,
      scureText: true,
      funcValidate: passwordValidate,
      funcOnSave: savePassword,
    );
  }

  ShowTextFormField buildEmail() {
    return ShowTextFormField(
      label: 'Email :',
      iconData: Icons.email,
      funcValidate: emailValidate,
      funcOnSave: saveEmail,
    );
  }

  void saveEmail(String? string) {
    email = string;
  }

  void savePassword(String? string) {
    password = string;
  }

  String? emailValidate(String? string) {
    if (string!.isEmpty) {
      return 'Please Fill Email';
    } else {
      return null;
    }
  }

  String? passwordValidate(String? string) {
    if (string!.isEmpty) {
      return 'Please Fill Password';
    } else {
      return null;
    }
  }

  Container buildLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            // ignore: avoid_print
            print('email = $email, password = $password');
          }
        },
        child: const Text('Login'),
      ),
    );
  }

  ShowTitle buildShowTitle() {
    return ShowTitle(
      title: MyConstant.appName,
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox buildImage() {
    return const SizedBox(
      width: 200,
      child: ShowImage(),
    );
  }
}
