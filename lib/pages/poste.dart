import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Poste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("Poste di Zona"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                height: 150,
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.red[900],
                        radius: 45,
                        child: CircleAvatar(
                          radius: 42,
                          backgroundImage: NetworkImage(
                              "https://media-cdn.tripadvisor.com/media/photo-s/0e/34/47/50/ufficio-postale-all-interno.jpg"),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Poste Italiane - I Granai",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Via Mario Rigamonti, 100",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              MapsLauncher.launchQuery(
                  "Poste Italiane Via Mario Rigamonti, 100, 00142 Roma RM");
            },
            child: Text(
              "Naviga",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  height: 150,
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.red[900],
                          radius: 45,
                          child: CircleAvatar(
                            radius: 42,
                            backgroundImage: NetworkImage(
                                "https://media-cdn.tripadvisor.com/media/photo-s/0e/34/47/50/ufficio-postale-all-interno.jpg"),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Poste Italiane - 161",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Via della Fotografia, 107",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              MapsLauncher.launchQuery(
                  "Poste Italiane Via della Fotografia, 107, 00142 Roma RM");
            },
            child: Text(
              "Naviga",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
