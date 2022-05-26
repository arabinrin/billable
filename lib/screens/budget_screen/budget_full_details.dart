import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/budget.dart';

class BudgetFullDetials extends StatelessWidget {
  final Budget budget;

  const BudgetFullDetials({Key? key, required this.budget}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.topCenter,
                height: 280,
                width: width,
                color: const Color(0xff0C0A40),
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
                      budget.name,
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            color: const Color(0xff0C0A40),
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
                      '100,00',
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
                      '${budget.startdate}',
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
                  child: const Icon(Icons.money_outlined),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromRGBO(229, 229, 229, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                ),),
          ],
        ),
      ),
    );
  }
}
