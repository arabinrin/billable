import 'package:billable/models/subscription.dart';
import 'package:billable/models/transaction.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SubscriptionFullDetail extends StatelessWidget {
  SubscriptionFullDetail({
    Key? key,
    required this.subscriptionBillModelType,
    required this.index,
  }) : super(key: key);
  final SubscriptionBillModel subscriptionBillModelType;
  final int index;

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
        child: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
            ),
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.topCenter,
                height: 280,
                width: width,
                color: Color(0xff0C0A40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subscriptionBillModelType.name,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: width,
                height: height * .8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          // height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xff0C0A40),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Share',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      '${(subscriptionBillModelType.amount / subscriptionBillModelType.interval).toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xffAD271E),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Timestamp',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xff092853),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                     const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${f.format(subscriptionBillModelType.start.add(Duration(days: period(subscriptionBillModelType.type) * (index + 1)))).split(' ')[0]}',
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Transaction ID',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xff092853),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                     const SizedBox(
                      height: 10,
                    ),
                      Text(
                      'HVFQW2RUI3HUIAWHIUW8457',
                      style: GoogleFonts.poppins(
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
            Positioned(
              top: 160,
              right: width * .5 - 41,
              child: Container(
                height: 82,
                width: 82,
                // child: Image.asset(
                //   subscriptionBillModelType.img,
                //   height: 82,
                //   width: 82,
                // ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(subscriptionBillModelType.img),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
