import 'package:billable/screens/budget_screen/budget_full_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/budget.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/navigator.dart';

class BudgetDetails extends StatelessWidget {
  final Budget budget;
  const BudgetDetails({Key? key,required this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    int getTotalSaved() {
      return 1;
    }

    int getTotalAmount() {
      return 2;
    }
    Widget listItem(index){
      return Card(child: ListTile(
        leading: const CircleAvatar(backgroundColor: Color.fromRGBO(229, 229, 229, 1),
          child: Icon(
            Icons.money_outlined,
            color: kblue,
          ),
        ),
        title: Text(budget.name,
            style: const TextStyle(
              fontSize: 20, color: kblue,)),
        subtitle:Text(
            "${budget.startdate}",
            style: const TextStyle(
              fontSize: 15,
            )),
        trailing: const Text("${-100.0}",style:  TextStyle(
            fontSize: 20,color: Colors.red
        )),
        onTap: () {
          changeScreen(context,  BudgetFullDetials(budget: budget,));
        },
      ),);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblue,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          budget.name,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: kblue,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 0),
                width: width,
                alignment: Alignment.topCenter,
                child: Text(
                  ' Next Due Date : ${budget.enddate}',
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )),
          Positioned(
              top: 100,
              child: Container(
                width: width,
                height: height * .8,
                color: Colors.white,
                child:  ListView.builder(padding: const EdgeInsets.only(top: 200,left: 10,right: 10),
                  itemBuilder: (context, ind) {
                  if(ind ==0){return Column(children: [
                    const Text("Today",style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,)),
                    listItem(ind)
                  ],);}
                  else {
                    return listItem(ind);
                  }
                  },itemCount: 1,),
              )),
          Positioned(
              top: 50,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: width * .9,
                height: height * .3,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          spreadRadius: 3,
                          blurRadius: 13,
                          offset: Offset(0, 0))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text("Total",style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: kblue,
                  ),),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "NGN ${getTotalSaved()} ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                height: 32.r / 24.0.r,
                                color: Colors.green,
                              ),
                            ),
                            TextSpan(
                                text:
                                "left out of NGN ${getTotalAmount()}"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
                        color: kblue,
                        minHeight: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("NGN 0.00 Spent.NGN 0.00 Left to spend")
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
