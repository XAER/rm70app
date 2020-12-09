import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Bars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          "Bar",
          style: TextStyle(
              fontSize: 20, letterSpacing: 3, color: Colors.amberAccent),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ListTile(
            title: Row(
              children: [
                Icon(Icons.local_cafe_outlined, size: 30.0),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bar 70",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(height: 3.5),
                    Text("Via Adolfo Consolini",
                        style: TextStyle(fontStyle: FontStyle.italic))
                  ],
                )
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Image(
                                image: AssetImage("assets/images/cafe_70.png"),
                                height: 200,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Cafè Roma 70",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(height: 5),
                            Text("  Via Adolfo Consolini n.xx",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 12)),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              " \"Per un Caffè fatto a regola d'arte! Ampia scelta di cornetti e prodotti anche biologici!\"",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Row(
                          children: [
                            TextButton(
                              child: Text("Naviga",
                                  style: TextStyle(fontSize: 18)),
                              onPressed: () {
                                MapsLauncher.launchQuery(
                                    "Café Roma 70 00142 Rome, Metropolitan City of Rome, Italy");
                              },
                            ),
                            TextButton(
                              child: Text("Chiudi",
                                  style: TextStyle(fontSize: 18)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  });
            },
          ),
          ListTile(
              title: Row(
                children: [
                  Icon(Icons.local_cafe_outlined, size: 30.0),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Neapolis Cafè",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(height: 3.5),
                      Text("Via Alberto Ascari",
                          style: TextStyle(fontStyle: FontStyle.italic))
                    ],
                  )
                ],
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Image(
                                    image: AssetImage(
                                        "assets/images/cafe_70.png")),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "Bar Neapolis",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(height: 5.0),
                              Text("Via Alberto Ascari n. 273",
                                  style:
                                      TextStyle(fontStyle: FontStyle.italic)),
                              SizedBox(height: 15.0),
                              Text(
                                "***Recensione***",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        actions: [
                          Row(
                            children: [
                              TextButton(
                                child: Text("Naviga",
                                    style: TextStyle(fontSize: 18)),
                                onPressed: () {
                                  MapsLauncher.launchQuery(
                                      "Bar Neapolis Via Alberto Ascari, 273, 00142 Roma RM, Italy");
                                },
                              ),
                              TextButton(
                                child: Text("Chiudi",
                                    style: TextStyle(fontSize: 18)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}
