import 'package:e_learningplatform/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/AboutUs';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[_buildInfo1(), _buildInfo2(), _buildInfo3()],
        ),
      ),
    );
  }

  Widget _buildInfo1() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.redAccent,
                        child: Image.asset(
                          AppImageAsset.elearning,
                          height: 120,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'E-Learning Platform',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: Icon(Icons.info),
                    title: Text("Version"),
                    subtitle: Text("1.0"),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.cached),
                    title: Text("Changelog"),
                  ),
                  const Divider(),
                  const ListTile(
                      leading: Icon(Icons.offline_pin), title: Text("License")),
                ],
              )),
        ));
  }

  Widget _buildInfo2() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Author',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Asim & Ahmed"),
                    subtitle: Text("Syria"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.file_download),
                    title: Text("Download From Cloud"),
                  ),
                ],
              )),
        ));
  }

  Widget _buildInfo3() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Company',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("IT-SMART"),
                    subtitle: Text("Mobile App Specialist"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Syria , Dara'a"),
                  ),
                ],
              )),
        ));
  }
}
