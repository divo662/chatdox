import 'package:chatdox/screens/main_page.dart';
import 'package:chatdox/screens/signup.dart';
import 'package:chatdox/widget/onboard_widget.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 500,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/vec2.jpg"), fit: BoxFit.cover)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnboardContainer(
                            image: Image.asset("images/happy1.png",
                              filterQuality: FilterQuality.high,
                              colorBlendMode: BlendMode.darken,
                            )),
                        const SizedBox(width: 20,),
                        OnboardContainer(
                            image: Image.asset("images/happy3.png",
                              width: 150,
                              filterQuality: FilterQuality.high,
                              colorBlendMode: BlendMode.darken,)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnboardContainer(
                            image: Image.asset("images/happy2.png",
                              width: 170,
                              height: 100,
                              filterQuality: FilterQuality.high,
                              colorBlendMode: BlendMode.darken,)),
                        const SizedBox(width: 20,),
                        OnboardContainer(
                            image: Image.asset("images/happy4.png",
                              width: 370,
                              scale: 0.4,
                              filterQuality: FilterQuality.high,
                              colorBlendMode: BlendMode.darken,)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Enjoy the new experience of \n "
                      "chatting with global friends.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  "Connecting with people for free!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 75,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return const MainPage();
                    }));
                  },
                  child: Container(
                    height: 56,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 37,
                ),
                RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Powered by ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "CODE_DEE Studio.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.blue.shade700),
                      ),
                    ]))
              ],
            )
          ],
        ));
  }
}
