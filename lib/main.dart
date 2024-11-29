import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:property_ecommerce/firebase_options.dart';
import 'package:property_ecommerce/screens/home-page.dart';
import 'package:property_ecommerce/screens/signin-page.dart';
import 'package:property_ecommerce/screens/signup-page.dart';
void main()async{
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignUpView(),
      
    );
  }
}
