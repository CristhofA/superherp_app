import 'package:flutter/material.dart';
import 'package:superherp_app/data/model/superhero_detail_response.dart';

class SuperheroDetailScreeen extends StatelessWidget {
  final SuperheroDetailResponse superhero;

  const SuperheroDetailScreeen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Superherp ${superhero.name}")),
      body: Column(
        children: [
          Image.network(
            superhero.url,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(superhero.name, style: TextStyle(fontSize: 28)),
          ),
          Text(
            superhero.realName,
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),

            SizedBox(
              width: double.infinity,
              height: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.power,
                        ),
                        width: 20,
                        color: const Color.fromARGB(255, 255, 64, 64),
                      ),
                      Text("Power"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.intelligence,
                        ),
                        width: 20,
                        color: const Color.fromARGB(255, 64, 131, 255),
                      ),
                      Text("Intelligence"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.durability,
                        ),
                        width: 20,
                        color: const Color.fromARGB(255, 169, 64, 255),
                      ),
                      Text("durability"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.combat,
                        ),
                        width: 20,
                        color: const Color.fromARGB(255, 64, 255, 105),
                      ),
                      Text("combat"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.speed,
                        ),
                        width: 20,
                        color: const Color.fromARGB(255, 236, 255, 64),
                      ),
                      Text("speed"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.strength,
                        ),
                        width: 20,
                        color: const Color.fromARGB(255, 255, 64, 239),
                      ),
                      Text("strength"),
                    ],
                  ),
                ],
              ),
            ),
          
        ],
      ),
    );
  }
}
