import 'package:billable/screens/budget_screen/budget_details.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:billable/utils/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/navigator.dart';
import 'create_budget.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<BudgetProvider>(
      builder: (context, state, child) {
        int index =state.index;

        int getTotalAmount() {
          return 2;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: kblue,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Budgets",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    state.getTotalSaved();
                    changeScreen(context, const CreateBudget());
                  },
                  icon: const Icon(Icons.edit_outlined))
            ],
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
                    child: const Text(
                      "set a budget,Track your progress",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )),
              Positioned(
                  top: 100,
                  child: Container(
                    width: width,
                    height: height * .8,
                    color: Colors.white,
                    child: state.budgets.isEmpty
                        ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 200,
                                ),

                                GestureDetector(onTap: ()=>changeScreen(context, const CreateBudget()),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 20),
                                    decoration: const BoxDecoration(
                                        color: kblue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: const Text(
                                      "Create a new Budget",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                        )
                        : ListView.builder(padding: const EdgeInsets.only(top: 200,left: 10,right: 10),
                        itemBuilder: (context, ind) {
                            state.index = ind;
                            final budget = state.budgets[ind];
                            double getPercent() {
                              double budgetAmount =
                                  double.parse(budget.budgetamount!);
                              double savedAmount = double.parse(budget.savedamount!);
                              double percent = (savedAmount/ budgetAmount);
                              return percent * 100;
                            }
                            double linearValue(){
                              double savedAmount =double.parse(budget.savedamount!);
                              double budgetAmount =
                              double.parse(budget.budgetamount!);
                              double value =(savedAmount/budgetAmount);
                              return value;
                            }

                            return Card(
                              child: ListTile(
                                leading: const CircleAvatar(backgroundColor: Color.fromRGBO(229, 229, 229, 1),
                                  child: Icon(
                                    Icons.money_outlined,
                                    color: kblue,
                                  ),
                                ),
                                title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(budget.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20, color: kblue,)),
                                    Text(
                                        "${budget.savedamount}  of  ${budget.budgetamount}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ))
                                  ],
                                ),
                                subtitle: LinearProgressIndicator(
                                  value: linearValue(),
                                  backgroundColor:
                                      const Color.fromRGBO(229, 229, 229, 1),
                                  color: kblue,
                                ),
                                trailing: Text("${getPercent()}%",style:  TextStyle(
                                  fontSize: 20,color: getPercent() >40 ? Colors.green : Colors.red
                                )),
                                onTap: () {
                                  changeScreen(context,  BudgetDetails(budget: budget,));
                                },
                                onLongPress: () {
                                  state.deleteBudget(budget);
                                },
                              ),
                            );
                          },itemCount: state.budgets.length,),
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
                           Text("Total", style:TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0.sp,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "NGN ${state.getTotalSaved()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.sp,
                                    height: 32.r / 24.0.r,
                                    color: Colors.green,
                                  ),
                                ),
                                TextSpan(
                                    text:
                                        "left out of NGN ${state.getTotalAmount()} "),
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
      },
    );
  }
}
