import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode/guessing/guessing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text("Home Screen", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        actions: [
          TextButton(
            onPressed: () {
              context.read<GuessingBloc>()..add(GuessingResetPressed())..add(GuessingCharacterSet(character: null));
            },
            child: Text("Reset", style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
          if (context.mounted) context.read<GuessingBloc>().add(GuessingCharacterSet(character: null));
        },
        child: Stack(
          children: [
            ListView(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                30,45,30,0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  AffiliationsGuessesInfo(),
                  CharacterInfo(),
                  HouseButtons(),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<GuessingBloc, GuessingState>(
      builder: (context, state) {
        return Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              state.currentCharacter.image.isEmpty ? "https://sp-ao.shortpixel.ai/client/q_lossless,ret_img,w_250/https://miamistonesource.com/wp-content/uploads/2018/05/no-avatar-25359d55aa3c93ab3466622fd2ce712d1.jpg" : state.currentCharacter.image,
              width: width * 0.4,
              height: height * 0.25,
              fit: BoxFit.cover,
            ),
            Text(state.currentCharacter.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
          ],
        );
      },
    );
  }
}

class HouseButtons extends StatelessWidget {
  const HouseButtons({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      spacing: 10,
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (1/0.5),
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 3),
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                context.read<GuessingBloc>()..add(GuessingHouseClicked(house: "Gryffindor"))..add(GuessingCharacterSet(character: null));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Image.asset(
                    "assets/Gryffindor.webp",
                    width: 35,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  Text("Gryffindor", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 3),
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                context.read<GuessingBloc>()..add(GuessingHouseClicked(house: "Hufflepuff"))..add(GuessingCharacterSet(character: null));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Image.asset(
                    "assets/Hufflepuff.webp",
                    width: 35,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  Text("Hufflepuff", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // fixedSize: Size(width, height * 0.05),
                side: BorderSide(color: Colors.black, width: 3),
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                context.read<GuessingBloc>()..add(GuessingHouseClicked(house: "Ravenclaw"))..add(GuessingCharacterSet(character: null));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Image.asset(
                    "assets/Ravenclaw.webp",
                    width: 35,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  Text("Ravenclaw", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // fixedSize: Size(width, height * 0.05),
                side: BorderSide(color: Colors.black, width: 3),
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                context.read<GuessingBloc>()..add(GuessingHouseClicked(house: "Slytherin"))..add(GuessingCharacterSet(character: null));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Image.asset(
                    "assets/Slytherin.webp",
                    width: 35,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  Text("Slytherin", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(width, height * 0.1),
            side: BorderSide(color: Colors.black, width: 3),
            backgroundColor: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          onPressed: () {
            context.read<GuessingBloc>()..add(GuessingHouseClicked(house: ""))..add(GuessingCharacterSet(character: null));
          },
          child: Text("Not in House", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        ),
      ],
    );
  }
}

