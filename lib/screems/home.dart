import 'package:flutter/material.dart';
import 'package:movie_app/screems/movies.dart';
import 'package:movie_app/screems/profile.dart';
import 'package:movie_app/screems/wishlist.dart';

class HomePage extends StatefulWidget {

 
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {

   int _currentIndex = 0;
   List<Widget> _totalPage = [MoviesPage(), WishListPage(),ProfilePage()];

   void _setCurrentIndex(int val){
       setState(() {
         _currentIndex  = val;
       });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff36393f),
      body: SafeArea(child:  _totalPage[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _setCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Кино",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Дуртай",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профайл",
          ),
        ],
      ),
    );
  }
}