import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsView extends StatefulWidget {
  final houseDetail;
  const DetailsView({super.key, required this.houseDetail});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  CollectionReference wishlist =
      FirebaseFirestore.instance.collection('wishlist');

  addToWishlist() async {
    if (widget.houseDetail["name"] != null &&
        widget.houseDetail["location"] != null &&
        widget.houseDetail["beds"] != null &&
        widget.houseDetail["baths"] != null &&
        widget.houseDetail["garage"] != null &&
        widget.houseDetail["images"]?["main"] != null &&
        widget.houseDetail["images"]?["gallery"]?.length >= 4) {
      await wishlist.add(
        {
          "name": widget.houseDetail["name"],
          "location": widget.houseDetail["location"],
          "beds": widget.houseDetail["beds"],
          "baths": widget.houseDetail["baths"],
          "garage": widget.houseDetail["garage"],
          "price": widget.houseDetail["price"],
          "description": widget.houseDetail["description"],
          "images": {
            "main": widget.houseDetail["images"]["main"],
            "gallery": [
              widget.houseDetail["images"]["gallery"][0],
              widget.houseDetail["images"]["gallery"][1],
              widget.houseDetail["images"]["gallery"][2],
              widget.houseDetail["images"]["gallery"][3]
            ]
          }
        },
      );
      print("successfully added");
    } else {
      print("Error: Incomplete or null data in houseDetail");
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Details",
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(widget.houseDetail["images"]["main"]),
                      height: 280,
                      width: 320,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.houseDetail["name"],
                            style: GoogleFonts.mulish(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 14, 49, 70),
                            ),
                          ),
                          Text(
                            widget.houseDetail['location'],
                            style: GoogleFonts.mulish(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 14, 49, 70),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.bed, color: Colors.amber),
                              SizedBox(width: 3),
                              Text(
                                "${widget.houseDetail['beds']} Beds",
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  color:
                                      const Color.fromARGB(255, 133, 133, 133),
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.bathtub, color: Colors.amber),
                              SizedBox(width: 3),
                              Text(
                                "${widget.houseDetail['baths']} Baths",
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  color:
                                      const Color.fromARGB(255, 133, 133, 133),
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.garage, color: Colors.amber),
                              SizedBox(width: 3),
                              Text(
                                "${widget.houseDetail['garage']} Garages",
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  color:
                                      const Color.fromARGB(255, 133, 133, 133),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          await addToWishlist();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(28, 14, 49, 70),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Icon(
                              Icons.bookmark_border_rounded,
                              color: const Color.fromARGB(255, 14, 49, 70),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(),
                    title: Text(
                      "Owner Name",
                      style: GoogleFonts.mulish(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      "Owner of ${widget.houseDetail['name']}",
                      style:
                          GoogleFonts.mulish(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: InkWell(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 14, 49, 70),
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(0),
                          height: 30,
                          width: 80,
                          child: Center(
                              child: Icon(
                            Icons.call,
                            size: 22,
                            color: Colors.white,
                          ))),
                    ),
                  ),
                  Container(
                    width: _screenWidth,
                    child: Text(
                      widget.houseDetail['description'],
                      style: GoogleFonts.mulish(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Gallery",
                        style: GoogleFonts.mulish(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 14, 49, 70),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.houseDetail["images"]["gallery"][0]),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.houseDetail["images"]["gallery"][1]),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.houseDetail["images"]["gallery"][2]),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.houseDetail["images"]["gallery"][3]),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // padding: EdgeInsets.all(0),
        notchMargin: 0,
     
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
         
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.houseDetail['price'],
              style:  GoogleFonts.mulish(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 14, 49, 70),
                          ),),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 14, 49, 70),
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(0),
                  height: 35,
                  width: 100,
                  child: Center(
                    child: Text("Buy Now",
                    style:  GoogleFonts.mulish(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
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
