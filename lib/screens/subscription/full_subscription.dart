import 'package:billable/models/subscription.dart';
import 'package:billable/screens/subscription/subscription_detail.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Fullsubscription extends StatefulWidget {
  Fullsubscription({
    Key? key,
  }) : super(key: key);

  @override
  State<Fullsubscription> createState() => _FullsubscriptionState();
}

class _FullsubscriptionState extends State<Fullsubscription>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<Fullsubscription> {
  late TabController tabController;
  int selectedIndex = 0;
  final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

  void onItemCLicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.lock_clock))],
        backgroundColor: Color(0xff0C0A40),
        title: Text(
          'Subscription',
          style: GoogleFonts.spaceGrotesk(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Icon(Icons.money), text: 'Bills'),
            Tab(icon: Icon(Icons.payment), text: 'Payments')
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [BillsSub(), PayedBilled()],
      ),
    );
  }
}

class PayedBilled extends StatelessWidget {
  const PayedBilled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BillsSub extends StatelessWidget {
  BillsSub({Key? key}) : super(key: key);
  final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

  int period(String type) {
    if (type == 'Weekly') {
      return 7;
    }
    if (type == 'Monthly') {
      return 30;
    }
    if (type == 'Daily') {
      return 1;
    }
    if (type == 'Yearly') {
      return 366;
    }
    return 0;
  }

  final f = DateFormat('yyyy-MM-dd hh:mm');

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 400,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: subscriptionBillModel.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  changeScreen(
                      context,
                      SubscriptionDetail(
                          subscriptionBillModel: subscriptionBillModel[index]));
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 51,
                              width: 51,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        subscriptionBillModel[index].img)),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        subscriptionBillModel[index].name,
                                        style: GoogleFonts.spaceGrotesk(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${subscriptionBillModel[index].type} : ${f.format(subscriptionBillModel[index].start.add(Duration(days: period(subscriptionBillModel[index].type) * subscriptionBillModel[index].interval))).split(' ')[0]}',
                                  style: GoogleFonts.spaceGrotesk(
                                    textStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${formatCurrency.format(subscriptionBillModel[index].amount / subscriptionBillModel[index].interval)}/${subscriptionBillModel[index].type}',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(color: Colors.grey)
                  ],
                ),
              );
            })));
  }
}
