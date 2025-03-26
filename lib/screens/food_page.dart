import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_project/provider/fav_provider.dart';
import 'package:my_project/provider/food_provider.dart';

import 'package:my_project/screens/food_content.dart';

import 'package:my_project/screens/widgets/search_textfield.dart';

class FoodPage extends ConsumerStatefulWidget {
  const FoodPage({super.key});

  @override
  ConsumerState<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends ConsumerState<FoodPage> {
  @override
  Widget build(BuildContext context) {
    final allFoodContent = ref.watch(foodProvider);
    final favContent = ref.watch(favNotifierProvider).toSet();

    final homepageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome To Food World',
                  style: GoogleFonts.play(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey,
                  ),
                ),
                5.verticalSpace,
                Text(
                  'Peter Dammy',
                  style: GoogleFonts.play(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.circle_notifications_outlined,
                size: 30.h,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 1.5.sp,
                  color: Colors.blueGrey,
                ),
                6.verticalSpace,
                const SearchTextfield(),
                6.verticalSpace,
                Divider(
                  thickness: 1.5.sp,
                  color: Colors.blueGrey,
                ),
                10.verticalSpace,
                Text(
                  "This Week Top Picks",
                  style: GoogleFonts.play(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                    color: Colors.blueGrey,
                  ),
                ),
                10.verticalSpace,
                SizedBox(
                  height: 280.h,
                  child: PageView.builder(
                      controller: homepageController,
                      itemCount: allFoodContent.length,
                      padEnds: false,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0).w,
                          child: GestureDetector(
                            onTap: () {
                              final contentDetail =
                                  ref.read(foodProvider)[index];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodContent(
                                            contentDetail: contentDetail,
                                          )));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(12).r,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          allFoodContent[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                8.verticalSpace,
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      allFoodContent[index].title,
                                      style: GoogleFonts.play(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                      Colors.blueGrey,
                                    )),
                                  ),
                                ),
                                8.verticalSpace,
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Colors.blueGrey,
                                      ),
                                    ),
                                    child: Text(
                                      allFoodContent[index].price,
                                      style: GoogleFonts.play(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                6.verticalSpace,
                Divider(
                  thickness: 1.5.sp,
                  color: Colors.blueGrey,
                ),
                Text(
                  "Our Regulars'",
                  style: GoogleFonts.play(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                10.verticalSpace,
                Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16).r,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1.5.sp,
                      color: Colors.blueGrey,
                    ),
                    itemCount: allFoodContent.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20.r,
                            backgroundImage: AssetImage(
                              allFoodContent[index].image,
                            ),
                          ),
                          title: Text(
                            allFoodContent[index].title,
                            style: GoogleFonts.play(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: Colors.grey,
                            ),
                          ),
                          subtitle: Text(
                            allFoodContent[index].title,
                            style: GoogleFonts.play(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
