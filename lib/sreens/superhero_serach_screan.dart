import 'package:flutter/material.dart';
import 'package:superherp_app/data/model/superhero_detail_response.dart';
import 'package:superherp_app/data/model/superhero_respons.dart';
import 'package:superherp_app/data/repository.dart';
import 'package:superherp_app/sreens/superhero_detail_screeen.dart';

class SuperheroSerachScreen extends StatefulWidget {
  const SuperheroSerachScreen({super.key});

  @override
  State<SuperheroSerachScreen> createState() => _SuperheroSerachScreenState();
}

class _SuperheroSerachScreenState extends State<SuperheroSerachScreen> {
Future<SuperHeroResponce?>? _superheroInfo;
Repository _repository = Repository();
bool _isTexEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Superhero Seach"),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(//Agrega un recuadro para escribir
            decoration: InputDecoration(
              hintText: "Busca un superHeroe",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder()),
            onChanged: (text){
              setState(() {
                _isTexEmpty = text.isEmpty;
               _superheroInfo = _repository.fetchSuperheroInfo(text);
              });
              },//funcia el texto que se pulsa cada que se escribe en la app
  
              ),
          ),
          bodyList(_isTexEmpty)
        ],
      ),
    );
  }

    FutureBuilder<SuperHeroResponce?> bodyList(bool isTextEmpty) {
    return FutureBuilder(
        future: _superheroInfo,
        builder: (context, snapshot) {
          if (_isTexEmpty) return Center(child: Text("Introduce un nombre"));

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            var superheroList = snapshot.data?.result;
            return Expanded(
              child: ListView.builder(
                  itemCount: superheroList?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (superheroList != null) {
                      return itemSuperhero(superheroList[index]);
                    } else {
                      return Text("Error");
                    }
                  }),
            );
          } else {
            return Text("No hay resultados");
          }
        });
  }
  Padding itemSuperhero(SuperheroDetailResponse item) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SuperheroDetailScreeen(superhero: item))),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.red),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(item.url,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment(0, -0.6)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.name,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}