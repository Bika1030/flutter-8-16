import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/movie/model/index.dart';

import 'package:movie_app/widgets/movie_special_card.dart';


class MoviesPage extends StatefulWidget {
  const MoviesPage
({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  // List<MovieModel> _data = [];

  Future<List<MovieModel>> _getData()async{
    String res = await DefaultAssetBundle.of(context).loadString("assets/movies,json");

    return MovieModel.formList(jsonDecode(res));
  }
   

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future:_getData() ,
      builder: (context, snapshot){
     if(snapshot.hasData){
      final _specialData = snapshot.data!.length > 3 
        ?snapshot.data!.sublist(0,3)
        : snapshot.data!;
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ШИлдэг"),
        SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: Row(
              children: 
                List.generate(
                  _specialData.length,
                  ((index) => MovieSpecialCard(_specialData[index]))
                ),
            ),
          ),
        ),
        Text("Бүх Кинонууд"),
        Wrap(
          children: [],
        ),
      ],
    );
  }else{
    return Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
        ),
      );
     }
    });

    
  }
}