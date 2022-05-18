import 'package:billable/screens/mainhome.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/constants/input_formatters.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:billable/utils/constants/payment_card.dart';
import 'package:billable/utils/get_storage.dart';
import 'package:billable/widgets/button.dart';
import 'package:billable/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController expire = TextEditingController();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _paymentCard = PaymentCard();
  var _autoValidateMode = AutovalidateMode.disabled;
  var _formKey = new GlobalKey<FormState>();

  bool valid = false;
  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    cardNumber.addListener(_getCardTypeFrmNumber);
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserToken>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Link a Debit Card or Credit Card to you Account',
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                        color: Color(0xff667085),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 230,
                  width: size.width,
                  child: Image.asset(
                    'assets/card.png',
                    width: 355,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Step 5 of 5 ',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xff667085),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            Positioned(
                                child: Container(
                              height: 5,
                              width: MediaQuery.of(context).size.width * .9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                // boxShadow: const [
                                //   BoxShadow(
                                //     color: Color(0xffF5FCFF),
                                //     spreadRadius: 2,
                                //     blurRadius: 2,
                                //     offset:
                                //         Offset(0, 1), // changes position of shadow
                                //   ),
                                // ],
                              ),
                            )),
                            Positioned(
                                child: Container(
                              height: 5,
                              width: MediaQuery.of(context).size.width * .9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kprimarycolor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Enter your card details below',
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'CARD NUMBER',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                RoundedInputField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(19),
                    CardNumberInputFormatter()
                  ],
                  icon: CardUtils.getCardIcon(_paymentCard.type),
                  // icon2: Icons.card_giftcard,
                  textInputType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  obscure: false,
                  onSaved: (String? value) {
                    print('onSaved = $value');
                    print('Num controller has = ${cardNumber.text}');
                    _paymentCard.number = CardUtils.getCleanedNumber(value!);
                  },
                  controller: cardNumber,
                  hintText: '0000 - 0000 - 0000 - 0000',
                  validator: CardUtils.validateCardNum,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'CARD EXPIRY DATE',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 160,
                          child: RoundedInputField(
                            icon: Image.asset(
                              'assets/images/calender.png',
                              width: 40.0,
                              color: Colors.grey[600],
                            ),
                            // textInputType: const TextInputType.numberWithOptions(
                            //     signed: true, decimal: true),
                            controller: expire,
                            hintText: 'MM/YY',
                            validator: CardUtils.validateDate,
                            textInputType: TextInputType.number,
                            onSaved: (value) {
                              List<int> expiryDate =
                                  CardUtils.getExpiryDate(value!);
                              _paymentCard.month = expiryDate[0];
                              _paymentCard.year = expiryDate[1];
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'CVV',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 160,
                          child: RoundedInputField(
                            icon: Image.asset(
                              'assets/images/card_cvv.png',
                              width: 40.0,
                              color: Colors.grey[600],
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              new LengthLimitingTextInputFormatter(4),
                            ],
                            textInputType: TextInputType.number,
                            obscure: true,
                            controller: cvv,
                            hintText: 'xxx',
                            validator: CardUtils.validateCVV,
                            onSaved: (value) {
                              _paymentCard.cvv = int.parse(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _autoValidateMode = AutovalidateMode
                              .always; // Start validating on every change.
                        });
                        _showInSnackBar(
                            'Please fix the errors in red before submitting.');
                      } else {
                        _formKey.currentState!.save();
                        // Encrypt and send send payment details to payment gateway
                        _showInSnackBar('Payment card is valid');
                        auth.box.write('cardName', cardNumber.text);
                        auth.box.write('expire', expire.text);
                        auth.box.write('cvv', cvv.text);

                        changeScreenReplacement(context, MainHome());
                      }
                    },
                    child: Button(
                      title: 'Next',
                      icon: Icons.check_circle_rounded,
                      color: kblue,
                      textcolor: kwhite,
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    cardNumber.removeListener(_getCardTypeFrmNumber);
    cardNumber.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(cardNumber.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }
}
