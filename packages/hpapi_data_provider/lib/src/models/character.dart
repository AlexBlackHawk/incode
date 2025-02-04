import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  const Character({
    required this.id,
    required this.name,
    required this.alternate_names,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternate_actors,
    required this.alive,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  final String id;
  final String name;
  final List<String> alternate_names;
  final String species;
  final String gender;
  final String house;
  final String? dateOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final List<String> alternate_actors;
  final bool alive;
  final String image;

  static const empty = Character(
    id: "",
    name: "",
    alternate_names: [],
    species: "",
    gender: "",
    house: "",
    dateOfBirth: "",
    wizard: false,
    ancestry: "",
    eyeColour: "",
    hairColour: "",
    patronus: "",
    hogwartsStudent: false,
    hogwartsStaff: false,
    actor: "",
    alternate_actors: [],
    alive: false,
    image: "https://sp-ao.shortpixel.ai/client/q_lossless,ret_img,w_250/https://miamistonesource.com/wp-content/uploads/2018/05/no-avatar-25359d55aa3c93ab3466622fd2ce712d1.jpg",
  );
}