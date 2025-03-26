import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/model/food_model.dart';
import 'package:my_project/provider/product_counter_provider.dart';
import 'package:my_project/screens/widgets/star_rating.dart';

class FoodContent extends ConsumerWidget {
  final FoodModel contentDetail;
  const FoodContent({
    super.key,
    required this.contentDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productCounter = ref.watch(productCounterProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 70.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20.h,
                            color: Colors.blueGrey,
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          'Top Picks',
                          style: GoogleFonts.play(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 330,
                      child: Stack(
                        children: [
                          Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black45,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(24).r,
                              image: DecorationImage(
                                  image: AssetImage(
                                    contentDetail.image,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 200,
                            left: 16,
                            right: 16,
                            child: Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(0.8),
                                    spreadRadius: 3,
                                    blurRadius: 16,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(16).r,
                                color: Colors.blueGrey,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          contentDetail.title,
                                          style: GoogleFonts.play(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        5.verticalSpace,
                                        Text(
                                          '#${contentDetail.price}',
                                          style: GoogleFonts.play(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const StarRating(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
                    child: Text(
                      contentDetail.description,
                      style: GoogleFonts.play(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (productCounter > 1) {
                                ref
                                    .read(productCounterProvider.notifier)
                                    .state--;
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16).r,
                                color: Colors.blueGrey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$productCounter",
                            style: GoogleFonts.play(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(productCounterProvider.notifier).state++;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16).r,
                                color: Colors.blueGrey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    5.horizontalSpace,
                    Row(
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16).r,
                            border: Border.all(
                              color: Colors.black54,
                              width: 1.5,
                            ),
                          ),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.blueGrey,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Buy Now',
                              style: GoogleFonts.play(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50).r,
                            border: Border.all(
                              color: Colors.blueGrey,
                            ),
                          ),
                          child: Icon(
                            Icons.more_horiz,
                            size: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   body: Column(
    //     children: [
    //       Stack(
    //         children: [
    //           Positioned(
    //             child: Container(
    //               height: MediaQuery.sizeOf(context).height * 0.5,
    //               child: Stack(
    //                 children: [
    //                   Positioned(
    //                     child: Container(
    //                       height: MediaQuery.sizeOf(context).height * 0.45,
    //                       decoration: const BoxDecoration(
    //                         image: DecorationImage(
    //                           fit: BoxFit.cover,
    //                           image: AssetImage('assets/image1.jpg'),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     top: 30, // Adjust for padding
    //                     left: 15,
    //                     child: IconButton(
    //                       icon: Icon(
    //                         Icons.arrow_back,
    //                         color: Theme.of(context).primaryColor,
    //                         size: 30,
    //                       ),
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                     ),
    //                   ),
    //                   const Positioned(
    //                     bottom: 0,
    //                     right: 15,
    //                     child: CircleAvatar(
    //                       radius: 40,
    //                       backgroundImage: AssetImage('assets/image5.jpg'),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),

    //       // Ensure the text content starts from the beginning
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 14.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start, // Align left
    //           children: extraFoodContent.map((food) {
    //             return Column(
    //               children: [
    //                 const SizedBox(height: 15), // Spacing after image
    //                 Text(
    //                   food.title,
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 24,
    //                   ),
    //                   textAlign: TextAlign.start,
    //                 ),
    //                 const SizedBox(height: 10),
    //                 Text(
    //                   food.description,
    //                 ),
    //                 const SizedBox(height: 10),
    //                 const Text(
    //                   'Price:',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w800,
    //                     fontSize: 24,
    //                   ),
    //                   textAlign: TextAlign.start,
    //                 ),
    //                 const SizedBox(height: 15),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       food.price,
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.w300,
    //                         fontSize: 24,
    //                       ),
    //                       textAlign: TextAlign.start,
    //                     ),
    //                     Container(
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                         children: [
    //                           Container(
    //                               height: 30,
    //                               width: 30,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(4),
    //                                 color: Colors.blueGrey,
    //                               ),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(4.0),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.contain,
    //                                   child: IconButton(
    //                                     icon: Icon(Icons.remove),
    //                                     onPressed: () {},
    //                                   ),
    //                                 ),
    //                               )),
    //                           const SizedBox(width: 10),
    //                           Text('1'),
    //                           const SizedBox(width: 10),
    //                           Container(
    //                               height: 30,
    //                               width: 30,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(4),
    //                                 color: Colors.blueGrey,
    //                               ),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(4.0),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.contain,
    //                                   child: IconButton(
    //                                     icon: Icon(Icons.add),
    //                                     onPressed: () {},
    //                                   ),
    //                                 ),
    //                               )),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const Spacer(),

    //                 // Buttons Row
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Container(
    //                       decoration: BoxDecoration(
    //                         border:
    //                             Border.all(color: Colors.blueGrey, width: 3),
    //                         borderRadius: BorderRadius.circular(12),
    //                         color: Colors.transparent,
    //                       ),
    //                       child: const Padding(
    //                         padding: EdgeInsets.all(10.0),
    //                         child: Center(child: Text('Cancel')),
    //                       ),
    //                     ),
    //                     const SizedBox(width: 20),
    //                     Container(
    //                       decoration: BoxDecoration(
    //                         border:
    //                             Border.all(color: Colors.blueGrey, width: 3),
    //                         borderRadius: BorderRadius.circular(12),
    //                         color: Colors.blueGrey,
    //                       ),
    //                       child: const Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.all(10.0),
    //                             child: Center(
    //                               child: Text('Add To Cart'),
    //                             ),
    //                           ),
    //                           Icon(Icons.add_shopping_cart),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const Spacer(),
    //               ],
    //             );
    //           }).toList(),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
