import 'package:flutter/material.dart';
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
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
              child: const Text('Forgot Password?'),
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
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.routeText),
              TextButton(
                onPressed: widget.onNextRoutePressed,
                child: Text(widget.routeTextButton),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
