import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sabayshop/models/user_model.dart';
import 'package:sabayshop/utility/my_dialog.dart';
import 'package:sabayshop/widgets/show_progress.dart';
import 'package:sabayshop/widgets/show_textformfield.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double? lat, lng;
  final formKey = GlobalKey<FormState>();
  String? name, email, password, token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findPosition();
    findToken();
  }

  Future<void> findToken() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    token = await firebaseMessaging.getToken();
    print('token = $token');
  }

  Future<void> findPosition() async {
    bool locatonServiceEnable;
    LocationPermission locationPermission;

    locatonServiceEnable = await Geolocator.isLocationServiceEnabled();

    if (!locatonServiceEnable) {
      // Off Location Switch
      print('off Location');
      Geolocator.openLocationSettings();
    } else {
      print('Servie Location On');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
      } else {
        if (locationPermission == LocationPermission.denied) {
          await Geolocator.requestPermission().then((value) {
            if (value == LocationPermission.deniedForever) {
              Geolocator.openAppSettings();
            } else {
              // find lat, lng
              findLatLng();
            }
          });
        } else {
          // find lat, lng
          findLatLng();
        }
      }
    }
  }

  Future<void> findLatLng() async {
    print('findLatLng Work !!!!');
    Position? position = await processPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print([lat, lng]);
    });
  }

  Future<Position?> processPosition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Account'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildName(),
                  buildEmail(),
                  buildPassword(),
                  buildMap(),
                  buttonCreateNewAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buttonCreateNewAccount() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print('name = $name, email = $email, password = $password');
            processRegister();
          }
        },
        child: Text('Create New Account'),
      ),
    );
  }

  Widget buildMap() {
    return Container(
      margin: EdgeInsets.all(30),
      width: double.infinity,
      height: 300,
      child: lat == null
          ? const ShowProgress()
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(lat!, lng!),
                zoom: 16,
              ),
              onMapCreated: (controller) {},
              markers: myMarkers(),
            ),
    );
  }

  Set<Marker> myMarkers() {
    return <Marker>{
      Marker(
          markerId: const MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
              title: 'You Here !', snippet: 'lat = $lat, lng = $lng')),
    };
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

  void saveName(String? string) {
    name = string;
  }

  void saveEmail(String? string) {
    email = string;
  }

  void savePassword(String? string) {
    password = string;
  }

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

  Future<void> processRegister() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) async {
      String uid = value.user!.uid;
      print('uid = $uid');

      UserModel model = UserModel(
          name: name,
          email: email,
          password: password,
          lat: lat,
          lng: lng,
          token: token);

      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .set(model.toJson())
          .then((value) => Navigator.pop(context));
    }).catchError((value) {
      String title = value.code;
      String message = value.message;
      MyDialog().normalDialog(context, title, message);
    });
  }
}
