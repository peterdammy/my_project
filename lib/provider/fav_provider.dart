import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/model/food_model.dart';

class FavNotifier extends Notifier<Set<FoodModel>> {
  @override
  Set<FoodModel> build() {
    return {}; // Initialize as an empty set
  }

//add food to cart
  void addFood(FoodModel model) {
    if (!state.contains(model)) {
      state = {...state, model};
    }
  }

//remove food added to the cartt
  void removeFood(FoodModel model) {
    if (state.contains(model)) {
      state = state.where((a) => a.title != model.title).toSet();
    }
  }

//remove all the food in the cart once
  void clearCart() {
    state = {}; // Clear the cart by setting state to an empty set
  }
}

final favNotifierProvider = NotifierProvider<FavNotifier, Set<FoodModel>>(() {
  return FavNotifier();
});
