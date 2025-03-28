//Archibo que tendra un metodo que recupear la informacion de la api para usarolo en la app
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superherp_app/data/model/superhero_respons.dart';

class Repository {
  Future<SuperHeroResponce?> fetchSuperheroInfo(String name)async{
    final response = await http.get(Uri.parse(
        "https://superheroapi.com/api/0b3f3908527cfaf7ceafd8942e843d48/search/$name"
    ));

    if(response.statusCode == 200){
        var decodeJson = jsonDecode(response.body);
        SuperHeroResponce superHeroResponce = SuperHeroResponce.fromJson(decodeJson);
        return superHeroResponce;
    }else{
      return null;
    }
  }
}
