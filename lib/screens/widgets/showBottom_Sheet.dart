import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/screens/home_screen.dart';

class ShowbottomSheet extends StatefulWidget {
  final String headerText;
  final String eText;
  final String pText;
  final String buttonText;
  final String routeText;
  final String routeTextButton;
  final VoidCallback? onNextRoutePressed;

  const ShowbottomSheet({
    super.key,
    required this.headerText,
    required this.eText,
    required this.pText,
    required this.buttonText,
    required this.routeText,
    required this.routeTextButton,
    this.onNextRoutePressed,
  });

  @override
  State<ShowbottomSheet> createState() => _ShowbottomSheetState();
}

class _ShowbottomSheetState extends State<ShowbottomSheet> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          Text(
            widget.headerText,
            style: GoogleFonts.play(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: widget.eText,
              hintStyle: GoogleFonts.play(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: widget.pText,
              hintStyle: GoogleFonts.play(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.play(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor:
                    WidgetStateProperty.all(Theme.of(context).primaryColor),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Text(
                widget.buttonText,
                style: GoogleFonts.play(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.routeText,
                style: GoogleFonts.play(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: widget.onNextRoutePressed,
                child: Text(
                  widget.routeTextButton,
                  style: GoogleFonts.play(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
