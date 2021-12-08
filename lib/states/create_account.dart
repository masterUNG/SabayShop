import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sabayshop/widgets/show_textformfield.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findPosition();
  }

  Future<void> findPosition()async{

    bool locatonServiceEnable;
    LocationPermission locationPermission;

    locatonServiceEnable = await Geolocator.isLocationServiceEnabled();

    if (!locatonServiceEnable) {
      // Off Location Switch

    }
    else {}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Account'),
      ),
      body: Center(
        child: Column(
          children: [
            buildName(),
            buildEmail(),
            buildPassword(),
          ],
        ),
      ),
    );
  }

  ShowTextFormField buildPassword() => ShowTextFormField(
      label: 'Password :',
      iconData: Icons.lock,
      funcValidate: passwordValidate,
      funcOnSave: savePassword);

  ShowTextFormField buildEmail() => ShowTextFormField(
      label: 'Email :',
      iconData: Icons.email,
      funcValidate: emailValidate,
      funcOnSave: saveEmail);

  ShowTextFormField buildName() {
    return ShowTextFormField(
      label: 'Display Name',
      iconData: Icons.fingerprint,
      funcValidate: nameValidate,
      funcOnSave: saveName,
    );
  }

  void saveName(String? string) {}

  void saveEmail(String? string) {}

  void savePassword(String? string) {}

  String? nameValidate(String? string) {
    if (string!.isEmpty) {
      return 'Please Fill Name';
    } else {
      return null;
    }
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
}
