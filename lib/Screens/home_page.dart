import 'package:ecom_cf_2/utils/all_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mycolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "HomePage",
          style: TextStyle(color: mycolor),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.shopping_cart,
            color: mycolor,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "SmartPhones",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...AllProducts.map(
                    (e) => Container(
                      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      height: h * 0.392,
                      width: w * 0.495,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                color: Colors.grey)
                          ]),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    e['thumbnail'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // child: Image.network(
                              //   "https://media.licdn.com/dms/image/C5603AQFlTT8xZqtK0w/profile-displayphoto-shrink_800_800/0/1620211968028?e=2147483647&v=beta&t=X2TyH4NVL0DtEGNvdnVNOBE_fvP8zFS_bcyefWa9lmg",
                              // ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(left: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "\$ ${e['price']}",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  RatingBarIndicator(
                                    rating: e['rating'].toDouble(),
                                    itemBuilder: (context, i) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
                                    },
                                    itemCount: 5,
                                    itemSize: 25,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ],
              ),
            ),
            // ),
            // Center(
            //   child: CircleAvatar(
            //     radius: 300,
            //     backgroundColor: Colors.red,
            //     // backgroundImage: AssetImage("lib/Assets/Images/babu1.jpg")
            //     child: Image.asset(
            //       "lib/Assets/Images/dora.jpg",
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
