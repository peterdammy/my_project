import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionNotifier extends StateNotifier<Map<int, bool>> {
  SelectionNotifier() : super({});

  void toggleSelection(int index) {
    state = {
      ...state,
      index: !(state[index] ?? false),
    };
  }
}

final selectionProvider =
    StateNotifierProvider<SelectionNotifier, Map<int, bool>>((ref) {
  return SelectionNotifier();
});
