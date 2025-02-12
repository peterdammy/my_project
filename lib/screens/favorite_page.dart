import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_project/provider/fav_provider.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favContent = ref.watch(favNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView.builder(
            itemCount: favContent.length, // Use the correct length
            itemBuilder: (context, index) {
              final favList = favContent.toList(); // Convert Set to List
              return Card(
                color: Colors.blueGrey,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(favList[index].image), // FIXED
                  ),
                  title: Text(favList[index].title), // Get title
                  subtitle: Text('#${favList[index].price}'), // Get price
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
