
import 'package:chatdox/main.dart';
import 'package:chatdox/screens/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;



class OTTPPage extends StatefulWidget {


  const OTTPPage({Key? key, }) : super(key: key);
  static String verify = "";
  @override
  State<OTTPPage> createState() => _OTTPPageState();
}

class _OTTPPageState extends State<OTTPPage> {
  bool isLoading = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String verificationId = '';
  bool _isLoading = false;
  final List<TextEditingController?> _otpControllerList = List.generate(6, (_) => TextEditingController());
  String _otpCode = '';


  @override
  void dispose() {
    _otpControllerList.forEach((controller) => controller!.dispose());
    super.dispose();
  }

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
                  "Verification Code",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.blue,
                      wordSpacing: 2,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: Image.asset(
                  "images/otp.png",
                  width: 270,
                )),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Enter OTP code sent to your phone'),
                      const SizedBox(height: 20),
                      OtpTextField(
                        handleControllers: (controllers) {
                          for (int i = 0; i < controllers.length; i++) {
                            _otpControllerList[i] = controllers[i]!;
                            _otpControllerList[i]!.addListener(() {
                              if (_otpControllerList[i]!.text.length == 1 && i < _otpControllerList.length - 1) {
                                // Move focus to the next text field
                                FocusScope.of(context).nextFocus();
                              }
                              _otpCode = _otpControllerList.map((controller) => controller!.text).join();
                            });
                          }
                        },

                        styles: const [
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ],
                        numberOfFields: 6,
                        fieldWidth: 55,
                        borderColor: const Color(0xFF512DA8),
                        enabledBorderColor: Colors.blue,
                        disabledBorderColor: Colors.grey.shade600,
                        showFieldAsBox: true,
                        onCodeChanged: (value) {
                          _otpCode = value;
                        },

                      ),
                      const SizedBox(height: 20),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: GestureDetector(
                    onTap: ()async {
                      try{
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                            verificationId: MyApp.verify, smsCode: _otpCode);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(
                            builder: (context) => const MainPage()));
                      }
                      catch(e){
                        print("Wrong OTP code, input the code sent to you");
                      }

                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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

