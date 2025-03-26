import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/provider/star_rating_provider.dart';

class StarRating extends ConsumerWidget {
  const StarRating({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starRating = ref.watch(starratingProvider);
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          5,
          (index) {
            return IconButton(
                onPressed: () {
                  ref.read(starratingProvider.notifier).state;
                  if (index < starRating) {
                    ref.read(starratingProvider.notifier).state =
                        starRating - 1;
                  } else {
                    ref.read(starratingProvider.notifier).state = index + 1;
                  }
                },
                icon: Icon(
                  Icons.star,
                  color: index < starRating ? Colors.amber : Colors.grey,
                  size: 20.sp,
                ));
          },
        ));
  }
}
