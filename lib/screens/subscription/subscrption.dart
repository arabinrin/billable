import 'package:billable/models/transaction.dart';
import 'package:billable/screens/subscription/full_subscription.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/utils/get_storage.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_on_outlined))
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
            Container(
              height: 200,
              child: Container(
                height: 190,
                width: 325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xff42307D),
                      Color(0xff7F56D9),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Debit.',
                            style: GoogleFonts.spaceGrotesk(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Text(
                            'Kuda Bank',
                            style: GoogleFonts.spaceGrotesk(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        '${auth.box.read('cardName').toString().substring(0, 4)} ${auth.box.read('cardName').toString().substring(4, 8)} ${auth.box.read('cardName').toString().substring(8, 12)} ${auth.box.read('cardName').toString().substring(12, 16)} ',
                        style: GoogleFonts.spaceGrotesk(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Card Holder',
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${auth.box.read('name')}',
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'Expiry',
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${auth.box.read('expire').toString().substring(0, 2)}/${auth.box.read('expire').toString().substring(2, 4)}',
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: 28,
                            width: 35,
                            child: Image.asset(
                              'assets/images/mastercard.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                changeScreen(context, Fullsubscription());
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              height: 50,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            color:
                                index == tab ? Color(0xff0C0A40) : Colors.white,
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: subscriptionModel.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                         
                        },
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
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
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
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  formatCurrency
                                      .format(subscriptionModel[index].amount),
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
                    })))
          ]),
        ),
      ),
    );
  }
}
