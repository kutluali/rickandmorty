// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EpisodeModel {
  final String id;
  final String name;
  final String episode;
  final List<String> characters;
  final String url;

  EpisodeModel({
    required this.id,
    required this.name,
    required this.episode,
    required this.characters,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'episode': episode,
      'characters': characters,
      'url': url,
    };
  }

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      episode: map['episode'] as String,
      characters: List<String>.from((map['characters'] as List)),
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeModel.fromJson(String source) =>
      EpisodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
