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
  /// Function to show delete confirmation dialog
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Clear Cart"),
          content: const Text(
              "Are you sure you want to remove all items from your cart?"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded edges
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel",
                  style: TextStyle(color: Colors.blueGrey)),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(favNotifierProvider.notifier)
                    .clearCart(); // Clear all items
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Yes, Remove",
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final favContent = ref.watch(favNotifierProvider); // Listen for updates

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: GoogleFonts.play(
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
            color: Colors.blueGrey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog(context); // Show alert dialog
            },
            icon: const Icon(Icons.delete_outlined,
                color: Colors.red), // Change icon to delete
          ),
        ],
      ),
      body: favContent.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty!",
                style: GoogleFonts.play(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16).r,
              itemCount: favContent.length,
              itemBuilder: (context, index) {
                final food = favContent.elementAt(index); // Convert Set to List
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage(food.image),
                  ),
                  title: Text(food.title),
                  subtitle: Text('#${food.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline,
                        color: Colors.blueGrey),
                    onPressed: () {
                      ref.read(favNotifierProvider.notifier).removeFood(food);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 1.5,
                          content: Text(
                            'Removed To Favorites',
                            style: GoogleFonts.play(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20).r,
                          ),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(
                              horizontal: 50.w, vertical: 20.h),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
