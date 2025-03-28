class SuperheroDetailResponse {
  final String id;
  final String name;
  final String url;
  final String realName;
  final PowerstatsResponse powerstatsResponse;

  SuperheroDetailResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.realName,
    required this.powerstatsResponse
  });
  //factory SuperHeroResponce.fromJson(Map<String, dynamic> json){
  //   return SuperHeroResponce(response: json["response"]);
  //}
  //Asi ascedemos a los datos de la api
  factory SuperheroDetailResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroDetailResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
      realName: json["biography"]["full-name"],
      powerstatsResponse: PowerstatsResponse.fromJson(json[ "powerstats"])
    );
  }
}

class PowerstatsResponse {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  PowerstatsResponse({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });
  factory PowerstatsResponse.fromJson(Map<String,dynamic> json){
    return PowerstatsResponse(
      intelligence:json["intelligence"],
      strength:json["strength"],
      speed:json["speed"],
      durability:json["durability"],
      power:json["power"],
      combat:json["combat"]
    );
  }
}
