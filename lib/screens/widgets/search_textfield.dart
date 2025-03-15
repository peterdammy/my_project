import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: Colors.grey.shade200,
        hintText: 'Search foods...',
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          ),
        ),

        // suffixIcon: IconButton(
        //   onPressed: () {},
        //   icon: Container(
        //       padding: const EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //         color: Theme.of(context).primaryColor,
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //       child: const Icon(Icons.search)),
        // ),
      ),
    );
  }
}
