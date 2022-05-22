import 'package:billable/models/user_cards.dart';
import 'package:billable/utils/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserToken>(context);
    final List<UserCard> card = [
      UserCard(
          cardNumber: auth.box.read('cardName'),
          cardName: auth.box.read('name'),
          expire: auth.box.read('expire'),
          cardType: Type.verve,
          cvv: auth.box.read('cvv'))
    ];

    return Container(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(

              height: 200,
              child: Container(
                height: 210,
                width: 340,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
            );
          }),
    );
  }
}
