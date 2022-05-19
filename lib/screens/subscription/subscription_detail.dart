import 'package:billable/models/subscription.dart';
import 'package:billable/screens/subscription/subscription_full_detail.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SubscriptionDetail extends StatelessWidget {
  SubscriptionDetail({Key? key, required this.subscriptionBillModel})
      : super(key: key);
  final SubscriptionBillModel subscriptionBillModel;

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * .2,
                color: Color(0xff0C0A40),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            subscriptionBillModel.name,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.note_add,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    Text(
                      '${subscriptionBillModel.type} Subscription',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' Next Due Date : ${f.format(subscriptionBillModel.start.add(Duration(days: period(subscriptionBillModel.type) * (subscriptionBillModel.done + 1)))).split(' ')[0]}',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                color: Color(0xffE3F7FF),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Today',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * .8,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, index) =>
                        const Divider(
                          height: 5,
                        ),
                    itemCount: subscriptionBillModel.done,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (() {
                          changeScreen(
                              context,
                              SubscriptionFullDetail(
                                index: index,
                                subscriptionBillModelType: subscriptionBillModel,
                              ));
                        }),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
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
                                              subscriptionBillModel.img)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              subscriptionBillModel.name,
                                              style: GoogleFonts.spaceGrotesk(
                                                textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '${f.format(subscriptionBillModel.start.add(Duration(days: period(subscriptionBillModel.type) * (index + 1)))).split(' ')[0]}',
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
                              Text(
                                '-${(subscriptionBillModel.amount / subscriptionBillModel.interval).toStringAsFixed(2)}',
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
