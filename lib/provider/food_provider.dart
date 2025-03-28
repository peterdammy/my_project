import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/model/food_model.dart';

final List<FoodModel> allFoodContent = [
  FoodModel(
      id: '1',
      title: 'Rice and Chicken Stew',
      description:
          'Lorem ipsum dolor sit amet,consectetur adipiscing elit, whwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwbdbb  vvjvjfvfjvfjvbfvjbvvndldfnlfnflnfjbfbvljfbvfjbv  vfvbvjvbvbvjvbvjbvkjvbvskjvbskjvskjvvlbv fvkbvfjvbfkjkvbvfkjvbkvkvl fkvfjvbfvjvfbkjfvfkvj kvfkjbvjkvkvbvk vkv fkv fkv vjbvkjvbsjvfsbjv fsv ',
      price: '3000.00',
      image: 'assets/image1.jpg'),
  FoodModel(
      id: '2',
      title: 'Egg Roll',
      description:
          'Lorem ipsum dolor sit amet,consectetur adipiscing elit, whwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwbdbb  vvjvjfvfjvfjvbfvjbvvndldfnlfnflnfjbfbvljfbvfjbv  vfvbvjvbvbvjvbvjbvkjvbvskjvbskjvskjvvlbv fvkbvfjvbfkjkvbvfkjvbkvkvl fkvfjvbfvjvfbkjfvfkvj kvfkjbvjkvkvbvk vkv fkv fkv vjbvkjvbsjvfsbjv fsv ',
      price: '1400.00',
      image: 'assets/image2.jpg'),
  FoodModel(
      id: '3',
      title: 'Spaghetti Bolognese',
      description:
          'Lorem ipsum dolor sit amet,consectetur adipiscing elit, whwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwbdbb  vvjvjfvfjvfjvbfvjbvvndldfnlfnflnfjbfbvljfbvfjbv  vfvbvjvbvbvjvbvjbvkjvbvskjvbskjvskjvvlbv fvkbvfjvbfkjkvbvfkjvbkvkvl fkvfjvbfvjvfbkjfvfkvj kvfkjbvjkvkvbvk vkv fkv fkv vjbvkjvbsjvfsbjv fsv ',
      price: '2800.00',
      image: 'assets/image3.jpg'),
  FoodModel(
      id: '4',
      title: 'Traditional Rice',
      description:
          'Lorem ipsum dolor sit amet,consectetur adipiscing elit, whwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwhwbdbb  vvjvjfvfjvfjvbfvjbvvndldfnlfnflnfjbfbvljfbvfjbv  vfvbvjvbvbvjvbvjbvkjvbvskjvbskjvskjvvlbv fvkbvfjvbfkjkvbvfkjvbkvkvl fkvfjvbfvjvfbkjfvfkvj kvfkjbvjkvkvbvk vkv fkv fkv vjbvkjvbsjvfsbjv fsv ',
      price: '3300.00',
      image: 'assets/image4.jpg'),
];

final foodProvider = Provider((ref) {
  return allFoodContent;
});
