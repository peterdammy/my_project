import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/provider/profilecontent_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileModel = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      backgroundImage: AssetImage(
                        'assets/image5.jpg',
                      ),
                    ),
                    30.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Peter Dammy',
                          style: GoogleFonts.play(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueGrey,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          '@odamipe',
                          style: GoogleFonts.play(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_vert,
                  size: 24,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            10.verticalSpace,
            Divider(
              thickness: 1.5.sp,
              color: Colors.blueGrey,
            ),
            14.verticalSpace,
            Container(
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
                itemCount: profileModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    child: ListTile(
                      leading: profileModel[index].leadingIcon,
                      title: Text(
                        profileModel[index].title,
                        style: GoogleFonts.play(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
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
      )),
    );
  }
}
