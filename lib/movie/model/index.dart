import "package:json_annotation/json_annotation.dart";
import "package:movie_app/widgets/movie_special_card.dart";

part 'index.g.dart';

@JsonSerializable()
class MovieModel{
   String imgUrl;
   int title ,id;
   int? publishedYear ,durationMin;
   String? type, description;

   MovieModel({
    required this.imgUrl, 
    required this.title, 
    required this.id ,
    this.description ,
    this.publishedYear ,
    this.durationMin,
    this.type});





 


  static List<MovieModel> formList(List<dynamic> data) => data.map((e)=> MovieModel.fromJson(e)).toList();

    factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  /// Connect the generated [_$MovieModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

}