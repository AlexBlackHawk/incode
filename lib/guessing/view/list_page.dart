import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guessing_repository/guessing_repository.dart';
import 'package:incode/app/app.dart';
import 'package:incode/guessing/guessing.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          30, 45, 30, 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            AffiliationsGuessesInfo(),
            FilterCharactersTextField(),
            CharactersList(),
          ],
        ),
      ),
    );
  }
}

class FilterCharactersTextField extends StatelessWidget {
  const FilterCharactersTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<GuessingBloc>().add(GuessingQueryChanged(query: value));
      },
      decoration: InputDecoration(

        suffixIcon: Icon(Icons.search),
        hintText: "Filter characters ...",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
    );
  }
}

class CharactersList extends StatelessWidget {
  const CharactersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuessingBloc, GuessingState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.filteredGuesses.length,
            itemBuilder: (BuildContext context, int index) {
              return CharacterListTile(guess: state.filteredGuesses[index],);
            },
          ),
        );
      },
    );
  }
}

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({super.key, required this.guess,});

  final Guess guess;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        guess.isGuessed ? Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CorrectDetailsPage(character: guess.character,)),
        ) : Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => InCorrectDetailsPage(name: guess.character.name, image: guess.character.image,)),
        );
      },
      leading: Image.network(guess.character.image.isEmpty ? "https://sp-ao.shortpixel.ai/client/q_lossless,ret_img,w_250/https://miamistonesource.com/wp-content/uploads/2018/05/no-avatar-25359d55aa3c93ab3466622fd2ce712d1.jpg" : guess.character.image),
      title: Text(guess.character.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
      subtitle: Text("Attempts: ${guess.attempts}", style: TextStyle(color: Colors.black),),
      trailing: guess.isGuessed ? Image.asset(
        "assets/green_success_check.png",
        height: 40,
        width: 40,
      ) : Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.arrowsRotate,
              size: 40,
            ),
            onPressed: () {
              context.read<GuessingBloc>().add(GuessingCharacterSet(character: guess.character));
              context.read<AppBloc>().add(AppIndexChanged(index: 0));
            },
          ),
          Image.asset(
            "assets/red_cross.png",
            height: 40,
            width: 40,
          ),
        ],
      ),
      tileColor: Colors.white,
    );
  }
}
