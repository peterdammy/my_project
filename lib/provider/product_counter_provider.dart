import 'package:flutter_riverpod/flutter_riverpod.dart';

final productCounterProvider = StateProvider<int>(
  (ref) => 1,
);
