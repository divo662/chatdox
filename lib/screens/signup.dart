import 'package:chatdox/screens/ottp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_number/phone_number.dart';

import '../main.dart';


class SignUpPage extends StatefulWidget {

  const SignUpPage({Key? key}) : super(key: key);
  static String verify = "";
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool onCheck = false;
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  final TextEditingController _phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final phoneRegex = RegExp(r'^\+?\d{10,12}$');

// Future<String?> _verifyPhoneNumber() async {
//     String verificationId = "";
//     int? forceResendingToken;
//
//     void _verified(AuthCredential authResult) {
//       _auth.signInWithCredential(authResult);
//       // Navigate to the OTP page if the authentication is successful
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const OTTPPage(verificationId: '',
//
//           ),
//         ),
//       );
//     }
//
//     void _verificationFailed(FirebaseAuthException authException) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Error: ${authException.message}"),
//         ),
//       );
//     }
//
//     void _smsSent(String verId, [int? resToken] ) {
//       verificationId = verId;
//       forceResendingToken = resToken;
//       // Navigate to the OTP page and pass the verification ID and forceResendingToken
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => OTTPPage(
//             verificationId: verificationId,
//             forceResendingToken: forceResendingToken,
//
//           ),
//         ),
//       );
//     }
//
//     void _autoRetrieve(String verificationId) {
//       // Do nothing
//     }
//
//     try {
//       await _auth.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           timeout: const Duration(seconds: 30),
//           verificationCompleted: _verified,
//           verificationFailed: _verificationFailed,
//           codeSent: _smsSent,
//           codeAutoRetrievalTimeout: _autoRetrieve);
//       return null;
//     } catch (e) {
//       return e.toString();
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.blue,
                      wordSpacing: 4,
                      letterSpacing: 3),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Image.asset(
                  "images/call.png",
                  width: 230,
                )),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "input phone number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 370,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.grey.shade200,
                      ),
                      child: Center(
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600
                            ),
                            hintText: "Phone Number",
                            border: InputBorder.none,
                            isDense: true,
                            filled: true,
                          ),
                          initialCountryCode: 'NG',
                          onChanged: ( value){
                            phoneNumber = value.completeNumber;
                          },
                        ),
                      ),
                      // child: Row(
                      //   children: [
                      //     const SizedBox(width: 10),
                      //     // Phone Number Text Form Field
                      //     Expanded(
                      //       child: TextFormField(
                      //         controller: _phoneController,
                      //         // keyboardType: TextInputType.phone,
                      //         // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Please enter your phone number';
                      //           }
                      //           return null;
                      //         },
                      //         decoration: const InputDecoration(
                      //           hintText: 'Phone number',
                      //           border: InputBorder.none,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: onCheck,
                        onChanged: (value){
                      setState(() {
                        onCheck = value!;
                      });
                        }),
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: "Do you agree to  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "terms and condition?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        ]))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                      onTap: onCheck? () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phoneNumber,
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            MyApp.verify = verificationId; // <-- set the static variable here
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => const OTTPPage()));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }: null,
                    child: Opacity(
                      opacity: onCheck ? 1.0 : 0.5,
                      child: Container(
                        height: 56,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Get Security Code",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
