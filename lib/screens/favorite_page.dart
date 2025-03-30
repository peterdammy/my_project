import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_project/provider/fav_provider.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favContent = ref.watch(favNotifierProvider); // Listen for updates

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
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: favContent.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty!",
                style: GoogleFonts.play(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16).r,
              itemCount: favContent.length,
              itemBuilder: (context, index) {
                final food = favContent.elementAt(index); // Convert Set to List
                return ListTile(
                  leading: Image.asset(
                    food.image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(food.title),
                  subtitle: Text('#${food.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () {
                      ref.read(favNotifierProvider.notifier).removeFood(food);
                    },
                  ),
                );
              },
            ),
    );
  }
}
