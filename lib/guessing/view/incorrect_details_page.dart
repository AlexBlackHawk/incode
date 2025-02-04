import 'package:flutter/material.dart';

class InCorrectDetailsPage extends StatelessWidget {
  const InCorrectDetailsPage({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        leadingWidth: 90,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text("Back", style: TextStyle(color: Colors.black),),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Image.network(
              image.isEmpty ? "https://sp-ao.shortpixel.ai/client/q_lossless,ret_img,w_250/https://miamistonesource.com/wp-content/uploads/2018/05/no-avatar-25359d55aa3c93ab3466622fd2ce712d1.jpg" : image,
              width: width * 0.4,
              height: height * 0.3,
              fit: BoxFit.fill,
            ),
            Image.asset(
              "assets/access-denied.png",
              width: width * 0.45,
              // height: height * 0.1,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}