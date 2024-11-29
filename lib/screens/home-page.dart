import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_ecommerce/screens/signin-page.dart';
import 'package:property_ecommerce/screens/wishlist-page.dart';
import 'package:property_ecommerce/tabs/houses-tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              "Home",
              style: GoogleFonts.mulish(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(14, 49, 70, 1),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(WishlistView(), transition: Transition.fade);
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(14, 49, 70, 0.247)),
                child: Center(
                    child: Icon(
                  Icons.bookmark,
                  color: Color.fromRGBO(14, 49, 70, 1),
                )),
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style:
                          GoogleFonts.mulish(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "Los Angeles, CA",
                      style: GoogleFonts.mulish(
                          color: const Color.fromRGBO(14, 49, 70, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                width: _screenWidth * 0.6,
                child: Text(
                  "Discover Best Suitable Property",
                  style: GoogleFonts.mulish(
                      color: const Color.fromRGBO(14, 49, 70, 1),
                      fontSize: 23,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: ButtonsTabBar(
                    backgroundColor: const Color.fromRGBO(14, 49, 70, 1),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    duration: 400,
                    unselectedLabelStyle: GoogleFonts.mulish(
                        color: const Color.fromRGBO(14, 49, 70, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                    labelStyle: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                    tabs: [
                      Tab(text: 'Houses'),
                      Tab(text: 'Apartments'),
                      Tab(text: 'Flats'),
                      Tab(text: 'Plots'),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(children: [
                  HouseTabView(),
                  Container(),
                  Container(),
                  Container(),
                ]),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
