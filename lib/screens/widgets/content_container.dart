import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/provider/fav_provider.dart';
import 'package:my_project/provider/food_provider.dart';
import 'package:my_project/screens/food_content.dart';

class ContentContainer extends ConsumerStatefulWidget {
  const ContentContainer({super.key});

  @override
  ConsumerState<ContentContainer> createState() => _ContentContainerState();
}

class _ContentContainerState extends ConsumerState<ContentContainer> {
  @override
  Widget build(BuildContext context) {
    final favContent = ref.watch(favNotifierProvider).toSet();
    final allFoodContent = ref.watch(foodProvider);
    return GridView.builder(
        itemCount: allFoodContent.length,
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
                              builder: (context) => const FoodContent(),
                            ),
                          );
                        },
                        child: Container(
                          height: 82,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(allFoodContent[index].image),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              allFoodContent[index].title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '#${allFoodContent[index].price}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              if (favContent.contains(allFoodContent[index]))
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.redAccent),
                    onPressed: () {},
                  ),
                ),
              if (!favContent.contains(allFoodContent[index]))
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.grey),
                    onPressed: () {
                      ref
                          .read(favNotifierProvider.notifier)
                          .addFood(allFoodContent[index]);
                    },
                  ),
                ),
            ],
          );
        });
  }
}
