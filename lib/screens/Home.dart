import 'package:billable/screens/subscription/full_subscription.dart';
import 'package:billable/screens/subscription/subscrption.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/utils/get_storage.dart';
import 'package:billable/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;
  final Subscription subs = Subscription();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = Provider.of<UserToken>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                          child: Center(
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
                ],
              ),
            ),
            CreditCard(),
            SizedBox(
              height: 50.h,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: EdgeInsets.all(15.0.r),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      changeScreen(context, Fullsubscription());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 22),
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.r),
                    height: 170.h,
                    decoration: BoxDecoration(
                      color: Color(0xff8349C6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                'Create your first Subscription Bills',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              width: 200.w,
                              child: Text(
                                'Create a recurring subscription payment for your bills, as well as manage your bills',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 80.h,
                          width: 80.w,
                          child: Image.asset(
                            'assets/hand.png',
                            width: 75.w,
                            height: 85.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 20.h),
                            Center(
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: kwhite,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kprimarycolor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payments history',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          maxLines: 2,
                        ),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Analytics',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffBACFFF).withOpacity(.5),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () => setState(() {
                              tab = index;
                            }),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 100,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: index == tab
                                          ? kwhite
                                          : Color(0xffBACFFF).withOpacity(0),
                                      border: Border.all(
                                          color: index == tab
                                              ? Colors.black
                                              : Color(0xffBACFFF)
                                                  .withOpacity(.0),
                                          width: .8),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      analysis[index],
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: index == tab
                                                ? Colors.black
                                                : Colors.grey.shade500,
                                            fontSize: 14,
                                            fontWeight: index == tab
                                                ? FontWeight.w500
                                                : FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                    height: 45, width: 1, color: Colors.grey),
                              ],
                            ),
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 155,
                    color: Color(0xffE5E5E5).withOpacity(.6),
                    child: charts[tab],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 140,
                    width: width,
                    child: Image.asset(
                      'assets/abeg.png',
                      width: 355,
                      fit: BoxFit.fill,
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

  List<String> analysis = ['All', 'This month', 'Year'];
  List<Widget> charts = [ChatDay(), ChatMonth(), ChatYear()];
}

class ChatDay extends StatelessWidget {
  const ChatDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              barWidth: 2.w,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Color(0xffBACFFF).withOpacity(.5),
              ),
              isCurved: true,
              show: true,
              color: kprimarycolor,
              spots: [
                FlSpot(0, 2.4),
                FlSpot(2.6, 2.7),
                FlSpot(4, 3.2),
                FlSpot(5, 3),
                FlSpot(6, 3.6),
                FlSpot(7, 4.4),
                FlSpot(9, 4.6),
                FlSpot(11, 5.7),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatYear extends StatelessWidget {
  const ChatYear({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              barWidth: 2.w,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Color(0xffBACFFF).withOpacity(.5),
              ),
              isCurved: true,
              show: true,
              color: kprimarycolor,
              spots: [
                FlSpot(0, 5.4),
                FlSpot(2.3, 5.7),
                FlSpot(3, 3.2),
                FlSpot(3.5, 5),
                FlSpot(4, 3.6),
                FlSpot(4.5, 4.4),
                FlSpot(9, 4.6),
                FlSpot(11, 5.7),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMonth extends StatelessWidget {
  const ChatMonth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              barWidth: 2.w,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Color(0xffBACFFF).withOpacity(.5),
              ),
              isCurved: true,
              show: true,
              color: kprimarycolor,
              spots: [
                FlSpot(0, 1.4),
                FlSpot(2.6, 2),
                FlSpot(4, 1.8),
                FlSpot(5, 3),
                FlSpot(6, 3.6),
                FlSpot(7, 4.0),
                FlSpot(9, 4.3),
                FlSpot(11, 5.7),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
