import 'package:flutter/material.dart';

// Main Function Start
void main() {
  runApp(MyApp());
}
// Main Function Ends

// First Stateless Widget with MaterialApp Start
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    );
  }
}
// First Stateless Widget with MaterialApp Ends

// Main Stateful Widget Start
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // Title List Here
  var titleList = [
    "แกงมัสมั่น",
    "Neapolitan Pizza",
    "ช็อกโกแลต",
    "ซูชิ",
    "เป็ดปักกิ่ง",
    "แฮมเบอร์เกอร์",
    "Penang Asam Laksa"
  ];

  // Description List Here
  var descList = [
    "อาหารที่อร่อยที่สุดในโลก",
    "พิซซ่าสูตรพิเศษตามแบบฉบับอิตาลี",
    "ช็อกโกแลตในเม็กซิโกอร่อยที่สุด",
    "เมื่อพูดถึงอาหารญี่ปุ่น ซูชิก็คงเป็นชื่อแรกๆ",
    "หนังเป็ดกรอบๆ หวานๆ ห่อแป้งบางๆ",
    "อาหารที่มีอยู่ในหลากหลายประเทศ",
    "หน้าตาคล้ายกับขนมจีน"
  ];

  // Image Name List Here
  var imgList = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg",
    "assets/images/img7.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "WORLD FOOD",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.yellow[800],
      ),
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, imgList[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
