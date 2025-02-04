import 'package:flutter/material.dart';
import 'package:hpapi_data_provider/hpapi_data_provider.dart';

class CorrectDetailsPage extends StatelessWidget {
  const CorrectDetailsPage({super.key, required this.character});

  final Character character;

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
        title: Text(character.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        leadingWidth: 90,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text("Back"),
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
              character.image.isEmpty ? "https://sp-ao.shortpixel.ai/client/q_lossless,ret_img,w_250/https://miamistonesource.com/wp-content/uploads/2018/05/no-avatar-25359d55aa3c93ab3466622fd2ce712d1.jpg" : character.image,
              width: width * 0.4,
              height: height * 0.3,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text("House: ${character.house}", style: TextStyle(color: Colors.black),),
                Text("Date of birth: ${character.dateOfBirth ?? ""}", style: TextStyle(color: Colors.black),),
                Text("Actor: ${character.actor}", style: TextStyle(color: Colors.black),),
                Text("Species: ${character.species}", style: TextStyle(color: Colors.black),),
                Text("Alternate names: ${character.alternate_names.join(", ")}", style: TextStyle(color: Colors.black),),
                Text("Gender: ${character.gender}", style: TextStyle(color: Colors.black),),
                Text("Is wizard: ${character.wizard ? "Yes" : "No"}", style: TextStyle(color: Colors.black),),
                Text("Ancestry: ${character.ancestry}", style: TextStyle(color: Colors.black),),
                Text("Eye colour: ${character.eyeColour}", style: TextStyle(color: Colors.black),),
                Text("Hair color: ${character.hairColour}", style: TextStyle(color: Colors.black),),
                Text("Patronus: ${character.patronus}", style: TextStyle(color: Colors.black),),
                Text("Is Student of Hogwarts: ${character.hogwartsStudent ? "Yes" : "No"}", style: TextStyle(color: Colors.black),),
                Text("Is Staff of Hogwarts: ${character.hogwartsStaff ? "Yes" : "No"}", style: TextStyle(color: Colors.black),),
                Text("Actor: ${character.actor}", style: TextStyle(color: Colors.black),),
                Text("Alternate actors: ${character.alternate_actors.join(", ")}", style: TextStyle(color: Colors.black),),
                Text("Is alive: ${character.alive ? "Yes" : "No"}", style: TextStyle(color: Colors.black),),
              ],
            )
          ],
        ),
      ),
    );
  }
}