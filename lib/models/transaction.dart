import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubscriptionModel {
  String type;
  double amount;
  String name;
  String img;
  DateTime date;

  SubscriptionModel(
      {required this.type,
      required this.amount,
      required this.name,
      required this.img,
      required this.date});
}

List<SubscriptionModel> subscriptionModel = [
  SubscriptionModel(
      type: 'Netflix',
      amount: 18120,
      name: "PizzaHut",
      img: 'assets/netflix.png',
      date: DateTime.now()),
  SubscriptionModel(
      type: 'Monthly',
      amount: 2030,
      name: "Amazon",
      img: 'assets/amazon.png',
      date: DateTime.now()),
  SubscriptionModel(
      type: 'Monthly',
      amount: 1625,
      name: "BoomPlay",
      img: 'assets/music.png',
      date: DateTime.now()),
  SubscriptionModel(
      type: 'Monthly',
      amount: 8125,
      name: "Spotify",
      img: 'assets/SPORTIFY.png',
      date: DateTime.now()),
  SubscriptionModel(
      type: 'Weekly',
      amount: 300,
      name: "Cable",
      img: 'assets/cable.png',
      date: DateTime.now()),
       SubscriptionModel(
      type: 'Weekly',
      amount: 750,
      name: "nternet",
      img: 'assets/internet.png',
      date: DateTime.now()),
];
