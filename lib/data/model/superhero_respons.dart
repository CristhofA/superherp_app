
import 'package:superherp_app/data/model/superhero_detail_response.dart';

class SuperHeroResponce{
  final String response;
  final List<SuperheroDetailResponse>result;

  SuperHeroResponce({required this.response, required this.result});
  factory SuperHeroResponce.fromJson(Map<String, dynamic> json){
    var list = json["results"] as List;
    List<SuperheroDetailResponse> heroList = 
    list.map((hero)=> SuperheroDetailResponse.fromJson(hero)).toList();
    return SuperHeroResponce(response: json["response"], result: heroList);
  }
}