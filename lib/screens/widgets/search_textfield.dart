import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: const BorderSide(
            color: Colors.blueGrey,
            width: 1.1,
          ),
        ),
        fillColor: Colors.grey.shade400,
        hintText: 'Search foods...',
        hintStyle: GoogleFonts.play(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: Colors.blueGrey,
        ),
        prefixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            size: 24.w,
            color: Colors.blueGrey,
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
