import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/model/food_model.dart';

class FavNotifier extends Notifier<Set<FoodModel>> {
  @override
  Set<FoodModel> build() {
    return {}; // Initialize as an empty set
  }

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
