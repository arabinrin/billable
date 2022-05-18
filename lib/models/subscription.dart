class SubscriptionBillModel {
  double amount;
  String type;
  String name;
  String img;
  DateTime start;
  int interval;
  int done;
  // DateTime ends;

  SubscriptionBillModel({
    required this.amount,
    required this.type,
    required this.name,
    required this.img,
    required this.start,
    required this.interval,
    this.done = 0,
    // required this.ends,
  });
}

List<SubscriptionBillModel> subscriptionBillModel = [
  SubscriptionBillModel(
    type: 'Monthly',
    name: 'Music',
    amount: 8125,
    img: 'assets/SPORTIFY.png',
    start: DateTime.now(),
    interval: 4,
    done: 1,

    // ends: DateTime.now().add(const Duration(days: 150)),
  ),
  SubscriptionBillModel(
    type: 'Weekly',
    name: 'Cable TV',
    amount: 300,
    img: 'assets/cable.png',
    start: DateTime.now(),
    interval: 12,
    done: 2,

    // ends: DateTime.now().add(const Duration(days: 50)),
  ),
  SubscriptionBillModel(
    type: 'Weekly',
    name: 'Internet',
    amount: 750,
    img: 'assets/internet.png',
    start: DateTime.now(),
    interval: 13,
    done: 2
  ),
  SubscriptionBillModel(
    type: 'Daily',
    name: 'Water',
    amount: 750,
    img: 'assets/water.png',
    start: DateTime.now(),
    interval: 50,
  ),
];
