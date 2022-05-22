import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddfSubscription extends StatefulWidget {
  const AddfSubscription({Key? key}) : super(key: key);

  @override
  State<AddfSubscription> createState() => _AddfSubscriptionState();
}

class _AddfSubscriptionState extends State<AddfSubscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 240,
                        color: Color(0xff0c0a40),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_back_ios_outlined),
                                ),
                                Text(
                                  'Payment',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
