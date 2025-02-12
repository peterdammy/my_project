import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/model/food_model.dart';

class FavNotifier extends Notifier<Set<FoodModel>> {
  //initial content

  @override
  Set<FoodModel> build() {
    return {
      FoodModel(
          id: '4',
          title: 'Tradditional Rice',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
          price: '3300.00',
          image: 'assets/image4.jpg'),
    };
  }
}

final favNotifierProvider = NotifierProvider<FavNotifier, Set<FoodModel>>(() {
  return FavNotifier();
});
