import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/model/profile_content_model.dart';

final List<ProfileContentModel> profileModel = [
  ProfileContentModel(
      leadingIcon: Icon(
        Icons.person,
        size: 24.w,
      ),
      title: 'Your Details'),
  ProfileContentModel(
      leadingIcon: Icon(
        Icons.wallet,
        size: 24.w,
      ),
      title: 'Payment Method'),
  ProfileContentModel(
      leadingIcon: Icon(
        Icons.food_bank,
        size: 24.w,
      ),
      title: 'Order History'),
  ProfileContentModel(
      leadingIcon: Icon(
        Icons.ballot_rounded,
        size: 24.w,
      ),
      title: 'Reward'),
  ProfileContentModel(
      leadingIcon: Icon(
        Icons.headphones,
        size: 24.w,
      ),
      title: 'Customer Support'),
  ProfileContentModel(
      leadingIcon: Icon(
        Icons.logout,
        size: 24.w,
      ),
      title: 'Logout'),
];

final profileProvider = Provider((ref) {
  return profileModel;
});
