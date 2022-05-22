import 'package:billable/models/transaction.dart';
import 'package:billable/screens/subscription/full_subscription.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/utils/get_storage.dart';
import 'package:billable/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);
  List<String> category = ['All', 'Upcoming', 'Paid'];

  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserToken>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi, ${auth.box.read('name').toString().split(' ')[0]}',
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xffBACFFF), width: 5),
                          ),
                          child:const Center(
                            child:  Icon(
                                  Icons.notifications_on_outlined,
                                  size: 20,
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Keep track of your subscriptions efficiently',
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CreditCard(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      changeScreen(context, Fullsubscription());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Subscription',
                            style: GoogleFonts.spaceGrotesk(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            'See All',
                            style: GoogleFonts.spaceGrotesk(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                tab = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 100,
                              height: 45,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                  color: index == tab
                                      ? Color(0xff0C0A40)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  category[index],
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: index == tab
                                            ? Colors.white
                                            : Colors.grey.shade500,
                                        fontSize: 16.sp,
                                        fontWeight: index == tab
                                            ? FontWeight.w500
                                            : FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: subscriptionModel.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              subscriptionModel[index].img)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            subscriptionModel[index].name,
                                            style: GoogleFonts.spaceGrotesk(
                                              textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          subscriptionModel[index].type,
                                          style: GoogleFonts.spaceGrotesk(
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    formatCurrency.format(
                                        subscriptionModel[index].amount),
                                    style: GoogleFonts.spaceGrotesk(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
