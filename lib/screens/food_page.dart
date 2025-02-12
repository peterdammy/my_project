import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/provider/fav_provider.dart';
import 'package:my_project/provider/food_provider.dart';
import 'package:my_project/screens/food_content.dart';

class FoodPage extends ConsumerStatefulWidget {
  const FoodPage({super.key});

  @override
  ConsumerState<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends ConsumerState<FoodPage> {
  @override
  Widget build(BuildContext context) {
    final foodContent = ref.watch(foodProvider);
    final favContent = ref.watch(favNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          'Food World',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/image5.jpg'),
            radius: 18,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.grey.shade200,
                hintText: 'Search foods...',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.search)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                  itemCount: foodContent.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: 160,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FoodContent(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 82,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            foodContent[index].image),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        foodContent[index].title,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '#${foodContent[index].price}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                        if (favContent.contains(foodContent[index]))
                          Positioned(
                            right: 5,
                            bottom: 0,
                            child: IconButton(
                              icon: const Icon(Icons.add_shopping_cart,
                                  color: Colors.black),
                              onPressed: () {},
                            ),
                          ),
                        if (!favContent.contains(foodContent[index]))
                          Positioned(
                            right: 5,
                            bottom: 0,
                            child: IconButton(
                              icon: const Icon(Icons.favorite,
                                  color: Colors.black),
                              onPressed: () {},
                            ),
                          ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
