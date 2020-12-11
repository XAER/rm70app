import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            color: Colors.red[900],
            child: DrawerHeader(
              child: IconButton(
                icon: Icon(Icons.account_circle),
                iconSize: 90.0,
                onPressed: () {
                  if (FirebaseAuth.instance.currentUser != null) {
                    Navigator.pushNamed(context, "/user");
                  } else {
                    Navigator.pushNamed(context, "/authentication");
                  }
                },
              ),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.local_offer_outlined),
                SizedBox(width: 10.0),
                Text("Offerte"),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
              title: Row(
                children: [
                  Icon(Icons.local_cafe_outlined),
                  SizedBox(width: 10.0),
                  Text("Bar"),
                ],
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, "/bars");
              }),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.cloud_queue_outlined),
                SizedBox(width: 10.0),
                Text("Meteo"),
              ],
            ),
            onTap: () {
              // Navigator.popAndPushNamed(context, "/weather");
            },
          )
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          "Roma 70 App",
          style: TextStyle(
              fontSize: 20, letterSpacing: 3, color: Colors.amberAccent),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (FirebaseAuth.instance.currentUser != null) {
                Navigator.pushNamed(context, "/user");
              } else {
                Navigator.pushNamed(context, "/authentication");
              }
            },
            icon: Icon(Icons.account_circle),
            iconSize: 35,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: NetworkImage(
                    "https://f643.z3portal.com/image.php?nocache=1&width=1200&image=/archivio/foto/731133/DSCF0632_2.jpg"),
                height: 190,
              ),
            ),
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {
                          Navigator.pushNamed(context, "/bars");
                        },
                        icon: Icon(Icons.local_cafe_outlined)),
                    Text("Bars",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart_outlined)),
                    Text("Negozi",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {
                          Navigator.pushNamed(context, "/poste");
                        },
                        icon: Icon(Icons.local_post_office_outlined)),
                    Text("Poste",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: Icon(Icons.people_alt_outlined)),
                    Text("Gruppi",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: Icon(Icons.navigation_outlined)),
                    Text("Mappa",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: Icon(Icons.cloud_queue_outlined)),
                    Text("Meteo",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: Icon(Icons.card_giftcard_outlined)),
                    Text("Offerte",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: Icon(Icons.feedback_outlined)),
                    Text("Feedback",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: Icon(Icons.info_outline)),
                    Text("Info",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
