import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/Auth/Login/LoginPage.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: 3,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              return Column(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/bg-welcome.jpg"),
                              fit: BoxFit.cover),
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ),
                  ),
                  Positioned(
                    top: 350,
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        "Life is short and the "
                        "world is wide",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Text(
                      "As Friends tours and travel, we customize "
                      "reliable and trustworthy educational tours to "
                      "destination all over the world",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14, height: 1.5, color: Colors.grey),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(3, (index) => dot(index, context)),
                    ),
                  ),
                  const Spacer(),
                  // GestureDetector(
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const LoginPage())),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue,
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //     padding: const EdgeInsets.only(
                  //         left: 130, right: 130, top: 20, bottom: 20),
                  //     child: Text(
                  //       'Get Started',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(40),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        currentIndex == 3 - 3 ? "Get started" : "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (currentIndex == 3 - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginPage(),
                            ),
                          );
                        }
                        _controller.nextPage(
                          duration: Duration(microseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
        )
      ],
    ));
  }

  Container dot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 40 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
    );
  }
}
