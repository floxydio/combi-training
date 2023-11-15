import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mockxl/helper/logger.dart';
import 'package:mockxl/helper/shared_pref.dart';
import 'package:mockxl/helper/sizing.dart';
import 'package:mockxl/pages/home/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 600,
            // ),
            SvgPicture.asset(
              "assets/login_bg.svg",
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: Sizing.paddingInput,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isPassword = !isPassword;

                          print(isPassword);
                        });
                      },
                      child: isPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                  hintText: "Password",
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    text: "Dont have an account?",
                    style: const TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Tap dari sign");
                        },
                      text: " Sign Up",
                      style: const TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold))
                ])),
            SizedBox(
              height: Sizing.paddingInputButton,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) => AlertDialog(
                    //             content: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Text(
                    //                 "Your username is: ${usernameController.text}"),
                    //             Text(
                    //                 "Your password is: ${passwordController.text}"),
                    //             const SizedBox(
                    //               height: 40,
                    //             ),
                    //             Row(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 TextButton(
                    //                     onPressed: () {
                    //                       Navigator.pop(context);
                    //                     },
                    //                     child: const Text("Cancel")),
                    //                 ElevatedButton(
                    //                     onPressed: () {
                    //                       Navigator.pushReplacement(
                    //                           context,
                    //                           MaterialPageRoute(
                    //                               builder: (_) =>
                    //                                   const HomeScreen()));
                    //                     },
                    //                     child: const Text("Ok"))
                    //               ],
                    //             )
                    //           ],
                    //         )));
                    if (usernameController.text == "admin" &&
                        passwordController.text == "123") {
                      SharedPrefs.setToken("token", "eyJ111").then((value) => {
                            if (value)
                              {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen()))
                              }
                            else
                              {Debug.debugLog("Gagal Save")}
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  content: Center(
                                child: Text("Username atau password salah"),
                              )));
                    }
                  },
                  child: Text("Sign In")),
            )
          ],
        ),
      )),
    ));
  }
}
