import 'package:flutter/material.dart';

class OnBoardModel {
  final String image;
  final String name;
  final String descr;

  OnBoardModel({
    required this.image,
    required this.name,
    required this.descr,
  });
}

List<OnBoardModel> onboardModels = [
  OnBoardModel(
      image: 'assets/board1.png',
      name: 'Automated your bill payment',
      descr:
          'Create a purchase plan for your current expenses and automate the payment for daily, weekly or monthly.'),
  OnBoardModel(
      image: 'assets/board2.png',
      name: 'Budget your Finances ',
      descr:
          'Setup a budget to automatically monitor your spending and stay on track with your goals. '),
  OnBoardModel(
      image: 'assets/board3.png',
      name: 'Flexible payment Cycles',
      descr:
          'You can fully customize and arrange the payment cycle for your subscriptions.'),
  OnBoardModel(
      image: 'assets/board3.png',
      name: 'Manage your subscription on Go..',
      descr:
          'You can easily keep a track on your subscriptions on one platform, from anywhere'),
];
