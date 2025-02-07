import 'package:flutter/material.dart';

class FoodContent extends StatefulWidget {
  const FoodContent({super.key});

  @override
  State<FoodContent> createState() => _FoodContentState();
}

class _FoodContentState extends State<FoodContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.45,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image1.jpg'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30, // Adjust for padding
                        left: 15,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 15,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/image5.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Ensure the text content starts from the beginning
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [
                  const SizedBox(height: 15), // Spacing after image
                  const Text(
                    'Rice and Chicken Stew',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
                    'ut aliquip ex ea commodo consequat.',
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Price:',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '#3000.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.blueGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                            const SizedBox(width: 10),
                            Text('1'),
                            const SizedBox(width: 10),
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.blueGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueGrey, width: 3),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.transparent,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(child: Text('Cancel')),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueGrey, width: 3),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueGrey,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text('Add To Cart'),
                                ),
                              ),
                              Icon(Icons.add_shopping_cart),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
