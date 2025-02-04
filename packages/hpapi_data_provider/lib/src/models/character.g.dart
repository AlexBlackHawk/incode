// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as String,
      name: json['name'] as String,
      alternate_names: (json['alternate_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      species: json['species'] as String,
      gender: json['gender'] as String,
      house: json['house'] as String,
      dateOfBirth: json['dateOfBirth'] as String?,
      wizard: json['wizard'] as bool,
      ancestry: json['ancestry'] as String,
      eyeColour: json['eyeColour'] as String,
      hairColour: json['hairColour'] as String,
      patronus: json['patronus'] as String,
      hogwartsStudent: json['hogwartsStudent'] as bool,
      hogwartsStaff: json['hogwartsStaff'] as bool,
      actor: json['actor'] as String,
      alternate_actors: (json['alternate_actors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      alive: json['alive'] as bool,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternate_names': instance.alternate_names,
      'species': instance.species,
      'gender': instance.gender,
      'house': instance.house,
      'dateOfBirth': instance.dateOfBirth,
      'wizard': instance.wizard,
      'ancestry': instance.ancestry,
      'eyeColour': instance.eyeColour,
      'hairColour': instance.hairColour,
      'patronus': instance.patronus,
      'hogwartsStudent': instance.hogwartsStudent,
      'hogwartsStaff': instance.hogwartsStaff,
      'actor': instance.actor,
      'alternate_actors': instance.alternate_actors,
      'alive': instance.alive,
      'image': instance.image,
    };
