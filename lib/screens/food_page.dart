import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/provider/fav_provider.dart';
import 'package:my_project/provider/food_provider.dart';

import 'package:my_project/screens/widgets/content_container.dart';
import 'package:my_project/screens/widgets/search_textfield.dart';

class FoodPage extends ConsumerStatefulWidget {
  const FoodPage({super.key});

  @override
  ConsumerState<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends ConsumerState<FoodPage> {
  @override
  Widget build(BuildContext context) {
    final allFoodContent = ref.watch(foodProvider);
    final favContent = ref.watch(favNotifierProvider).toSet();
    final foodContentController = PageController(
      viewportFraction: 0.9,
      initialPage: 0,
    );

    return SafeArea(
      child: Scaffold(
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
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: foodContentController,
                  itemCount: allFoodContent.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                  allFoodContent[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.blueGrey,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Center(
                                    child: Text(
                                      allFoodContent[index].title,
                                      softWrap: false,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (favContent.contains(allFoodContent[index]))
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(favNotifierProvider.notifier)
                                        .removeFood(allFoodContent[index]);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.task_alt,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              if (!favContent.contains(allFoodContent[index]))
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(favNotifierProvider.notifier)
                                        .removeFood(allFoodContent[index]);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.add,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Expanded(child: ContentContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
