import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_ecommerce/screens/home-page.dart';
import 'package:property_ecommerce/screens/signin-page.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  // Password obscure
  bool showPass = false;

  // Remember me?
  bool rememberMe = false;
  // Text Field Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Sign up User method
  registerUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(top: 50),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/appLogo.png'))),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create an Account",
                      style: GoogleFonts.mulish(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(125, 216, 216, 216),
                            hintText: 'Email',
                            prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 25,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your Email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _passController,
                          obscureText: !showPass,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(125, 216, 216, 216),
                            hintText: 'Password',
                            prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                  size: 25,
                                )),
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    showPass = !showPass;
                                  });
                                },
                                child: showPass
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.remove_red_eye)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your Password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            rememberMe = !rememberMe;
                          });
                        },
                        child: rememberMe
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.blueAccent,
                              )
                            : const Icon(Icons.check_circle_outline_outlined)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Remember me",
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () async {
                        // Validate the form
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, proceed to register
                          await registerUser();
                        } else {
                          // If the form is invalid, show errors and do nothing
                          print(
                              "Form is invalid. Fix errors before proceeding.");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: Colors.blueAccent,
                          shadowColor: Colors.blueGrey,
                          padding: const EdgeInsets.symmetric(vertical: 15)),
                      child: Text(
                        "Create",
                        style: GoogleFonts.mulish(
                            color: Colors.white, fontSize: 22),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "or continue with",
                  style: GoogleFonts.mulish(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: const Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: const Icon(
                          Icons.apple,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: const Icon(
                          Icons.g_mobiledata,
                          color: Colors.green,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style:
                          GoogleFonts.mulish(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SignInView(),
                            transition: Transition.leftToRight);
                        //                        Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const SignInView()),
                        // );
                      },
                      child: Text(
                        "sign In",
                        style: GoogleFonts.mulish(
                            color: Colors.blueAccent, fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
