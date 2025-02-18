import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/model/food_model.dart';

class FavNotifier extends Notifier<Set<FoodModel>> {
  //initial content

  @override
  Set<FoodModel> build() {
    return {
      // allFoodContent.firstWhere((food) => food.title == 'Traditional Rice'),
      // allFoodContent.firstWhere((food) => food.title == 'Spaghetti Bolognese')
    };
  }

//update state

  void addFood(FoodModel model) {
    if (!state.contains(model)) {
      state = {...state, model};
    }
  }

  void removeFood(FoodModel model) {
    if (state.contains(model)) {
      state = state.where((a) => a.title != model.title).toSet();
    }
  }
}

final favNotifierProvider = NotifierProvider<FavNotifier, Set<FoodModel>>(() {
  return FavNotifier();
});
