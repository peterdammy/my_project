import 'package:flutter/material.dart';
import 'package:my_project/screens/favorite_page.dart';
import 'package:my_project/screens/food_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   elevation: 0,
      //   title: const Text(
      //     'Food World',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 24,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: const Icon(Icons.logout_rounded))
      //   ],
      // ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_rounded), label: 'Cart'),
          ],
          currentIndex: selectedIndex,
          onTap: onTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          FoodPage(),
          FavoritePage(),
        ],
      ),
    );
  }
}
