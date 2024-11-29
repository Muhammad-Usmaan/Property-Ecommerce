import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_ecommerce/screens/details-page.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  CollectionReference wishlist =
      FirebaseFirestore.instance.collection('wishlist');
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wishlist",
                    style: GoogleFonts.mulish(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 14, 49, 70),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(28, 14, 49, 70),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: const Color.fromARGB(255, 14, 49, 70),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: 300,
                child: FutureBuilder(
                    future: wishlist.get(),
                    builder: (context, snapShot) {
                      if (snapShot.connectionState == ConnectionState.waiting) {
                        // While data is loading
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapShot.hasError) {
                        // Handle errors
                        return Center(child: Text("Something went wrong!"));
                      }

                      if (!snapShot.hasData || snapShot.data!.docs.isEmpty) {
                        // Handle empty data
                        return Center(child: Text("No items in the wishlist."));
                      }

                      return ListView.builder(
                          itemCount: snapShot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(DetailsView(
                                    houseDetail: snapShot.data!.docs[index]));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 290,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(14, 49, 70, 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10)),
                                      child: Image.network(
                                        snapShot.data!.docs[index]["images"]
                                            ["main"],
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapShot.data!.docs[index]
                                                  ['name'],
                                              style: GoogleFonts.mulish(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              snapShot.data!.docs[index]
                                                  ['location'],
                                              style: GoogleFonts.mulish(
                                                fontSize: 14,
                                                color: const Color.fromARGB(
                                                    255, 185, 185, 185),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.bed,
                                                    color: Colors.amber),
                                                SizedBox(width: 3),
                                                Text(
                                                  "${snapShot.data!.docs[index]['beds']} Beds",
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 14,
                                                    color: const Color.fromARGB(
                                                        255, 185, 185, 185),
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Icon(Icons.bathtub,
                                                    color: Colors.amber),
                                                SizedBox(width: 3),
                                                Text(
                                                  "${snapShot.data!.docs[index]['baths']} Baths",
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 14,
                                                    color: const Color.fromARGB(
                                                        255, 185, 185, 185),
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Icon(Icons.garage,
                                                    color: Colors.amber),
                                                SizedBox(width: 3),
                                                Text(
                                                  "${snapShot.data!.docs[index]['garage']} Garages",
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 14,
                                                    color: const Color.fromARGB(
                                                        255, 185, 185, 185),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
