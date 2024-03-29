import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelok_vietnam_app/Views/Home/components/CardTravelL.dart';
import 'package:travelok_vietnam_app/Views/Notify/NotifyPage.dart';
import 'package:travelok_vietnam_app/Views/Profile/ProfilePage.dart';
import 'package:travelok_vietnam_app/Views/ViewAll/ViewAllPage.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: constants.AppColor.xOverViewBackgroundColor,
          body: Column(
            children: <Widget>[
              // NAV BAR
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Row(
                  children: [
                    // Click -> Profile
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 3, right: 12, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                          color: constants.AppColor.xGrayBackgroundColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            currentUser!.photoURL == null
                                ? const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                                  )
                                : CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        currentUser!.photoURL!.toString())),
                            const SizedBox(width: 5),
                            Text(
                              currentUser!.displayName!.toString(),
                              style: GoogleFonts.acme(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: constants.AppColor.xDarkTextColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Empty Container
                    Expanded(child: Container()),
                    // Click -> Notification
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotifyPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: constants.AppColor.xGrayBackgroundColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          size: 25,
                          color: constants.AppColor.xIconBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // TITLE APP
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Khám phá",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        color: constants.AppColor.xDarkTextColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Thế giới cùng",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: constants.AppColor.xDarkTextColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "TraveloK",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: constants.AppColor.xOrangeColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // TITLE LISTVIEW
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Row(
                  children: [
                    Text(
                      'Địa điểm du lịch',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: constants.AppColor.xDarkTextColor,
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Xem tất cả',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: constants.AppColor.xBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // LISTVIEW BUILDER
              Expanded(
                child: CardTravelL(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
