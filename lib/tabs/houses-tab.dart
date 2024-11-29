import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_ecommerce/screens/details-page.dart';
import 'package:property_ecommerce/screens/signin-page.dart';

class HouseTabView extends StatefulWidget {
  const HouseTabView({super.key});

  @override
  State<HouseTabView> createState() => _HouseTabViewState();
}

class _HouseTabViewState extends State<HouseTabView> {
  List housesList = [
    {
      "name": "Sunset Villa",
      "location": "Malibu, California",
      "beds": 4,
      "baths": 3,
      "garage": 2,
      "price": "\$1,200,000",
      "description":
          "Experience the charm of the Sunset Villa, a luxurious home with stunning ocean views, spacious interiors, and modern amenities. Perfect for families and entertaining.",
      "images": {
        "main":
            "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "gallery": [
          "https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://images.pexels.com/photos/276724/pexels-photo-276724.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://images.pexels.com/photos/2635038/pexels-photo-2635038.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://images.pexels.com/photos/2079249/pexels-photo-2079249.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        ]
      }
    },
    {
      "name": "Maplewood Cottage",
      "location": "Asheville, North Carolina",
      "beds": 3,
      "baths": 2,
      "garage": 1,
      "price": "\$850,000",
      "description":
          "Cozy and picturesque, the Maplewood Cottage offers a warm and inviting atmosphere with a beautiful garden and easy access to the mountains. Ideal for a serene lifestyle.",
      "images": {
        "main":
            "https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "gallery": [
          "https://images.pexels.com/photos/5644702/pexels-photo-5644702.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://images.pexels.com/photos/3554424/pexels-photo-3554424.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://images.pexels.com/photos/5644367/pexels-photo-5644367.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://images.pexels.com/photos/1358900/pexels-photo-1358900.jpeg?auto=compress&cs=tinysrgb&w=600"
        ]
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        width: _screenWidth,
        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Best for you",
              style: GoogleFonts.mulish(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(14, 49, 70, 1),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 290,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: housesList.length,
                itemBuilder: (context, index) {
                  final onTileHouse = housesList[index];
                  return InkWell(
                    onTap: () {
                      Get.to(DetailsView(houseDetail: onTileHouse),
                      transition: Transition.fadeIn);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(top: 0),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(14, 49, 70, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.network(
                              onTileHouse["images"]["main"],
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    onTileHouse['name'],
                                    style: GoogleFonts.mulish(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    onTileHouse['location'],
                                    style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                          255, 185, 185, 185),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.bed, color: Colors.amber),
                                      SizedBox(width: 3),
                                      Text(
                                        "${onTileHouse['beds']} Beds",
                                        style: GoogleFonts.mulish(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 185, 185, 185),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(Icons.bathtub, color: Colors.amber),
                                      SizedBox(width: 3),
                                      Text(
                                        "${onTileHouse['baths']} Baths",
                                        style: GoogleFonts.mulish(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 185, 185, 185),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(Icons.garage, color: Colors.amber),
                                      SizedBox(width: 3),
                                      Text(
                                        "${onTileHouse['garage']} Garages",
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
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Nearby your Location",
              style: GoogleFonts.mulish(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(14, 49, 70, 1),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 90,
              width: _screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(28, 14, 49, 70),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCGg_GZiPH1hVG2NfTnLS45vs5e47I_VQxkg&s"),
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ranch Home",
                          style: GoogleFonts.mulish(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromRGBO(14, 49, 70, 1),
                          ),
                        ),
                        Text(
                          "Los Angles, CA",
                          style: GoogleFonts.mulish(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: const Color.fromRGBO(14, 49, 70, 1),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.bed, color: Colors.amber),
                            SizedBox(width: 3),
                            Text(
                              "3 Beds",
                              style: GoogleFonts.mulish(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 151, 151, 151),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.bathtub, color: Colors.amber),
                            SizedBox(width: 3),
                            Text(
                              "3 Baths",
                              style: GoogleFonts.mulish(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 151, 151, 151),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.garage, color: Colors.amber),
                            SizedBox(width: 3),
                            Text(
                              "1 Garages",
                              style: GoogleFonts.mulish(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 151, 151, 151),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
