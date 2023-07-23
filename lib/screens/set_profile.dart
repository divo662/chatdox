import 'dart:io';
import 'package:chatdox/screens/main_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({Key? key}) : super(key: key);

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  TextEditingController usernameController = TextEditingController();

  File? _avatarImage;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg'],
    );
    if (result != null) {
      setState(() {
        _avatarImage = File(result.files.single.path!);
      });
    }
  }
  void removeAvatarImage() {
    setState(() {
      _avatarImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Set Up Your Profile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: Colors.blue,
                    letterSpacing: 3),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Add profile Picture",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
          Center(
            child: GestureDetector(
              onTap: () => _pickImage(),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey.shade400,
                backgroundImage: _avatarImage != null ? FileImage(_avatarImage!) : null,
                child: _avatarImage == null
                    ? const Icon(
                  Icons.add,
                  size: 73,
                )
                    : null,
              ),
            ),
          ),
              Center(
                child: TextButton(
                  onPressed: removeAvatarImage,
                  child: const Text('Remove profile Picture',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16
                  ),),
                ),
              ),

              const SizedBox(
                height: 60,
              ),
              const Text(
                "Add Username",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {
                    setState(() {
                      isButtonEnabled = _formKey.currentState!.validate();
                    });
                  },
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                            height: 50,
                            width: 380,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade300),
                            child: TextFormField(
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              enableSuggestions: true,
                              maxLength: 30,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              controller: usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Input a username";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "@username",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade600,
                                ),
                                contentPadding: const EdgeInsets.all(2),
                              ),
                            )),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 64,
              ),
              Center(
                child: GestureDetector(
                  onTap: isButtonEnabled
                      ? () {
                          setState(() {
                            usernameController.text;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const MainPage();
                            }));
                          });
                        }
                      : null,
                  child: Opacity(
                    opacity: isButtonEnabled ? 1.0 : 0.5,
                    child: Container(
                      height: 56,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          "Continue to Home page",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
    );
  }
}
