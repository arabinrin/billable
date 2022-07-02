import 'package:billable/screens/budget_screen/budget_screen.dart';
import 'package:billable/utils/constants/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/color.dart';
import '../../utils/get_storage.dart';
import '../../widgets/date_time_field.dart';
import '../../widgets/textfield.dart';

class CreateBudget extends StatefulWidget {
  const CreateBudget({Key? key}) : super(key: key);

  @override
  State<CreateBudget> createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _budgetnameController = TextEditingController();
  final TextEditingController _startdateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String? selectedItem = "Monthly";
    List<String> dropList = [
      "Yearly",
      "Monthly",
      "Fortnightly",
      "Weekly",
      "Daily"
    ];
    return Scaffold(
        backgroundColor: kblue,
        appBar: AppBar(
          backgroundColor: kblue,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Create a Budget",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Stack(children: [
          Positioned(
              top: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 0),
                width: width,
                alignment: Alignment.topCenter,
                child: const Text(
                  "fill in details to get started",
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
              )),
          Positioned(
              top: 50,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: width * .9,
                height: height * .6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      RoundedInputField(
                        hintText: 'Budget Name',
                        controller: _budgetnameController,
                        validator: (val) {
                          return val!.isEmpty || !val.contains(' ')
                              ? "Enter Full Name"
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        items: dropList.map((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        value: selectedItem,
                        onChanged: (String? value) {
                          setState(() {
                            selectedItem = value;
                            print(value);
                          });
                        },
                        validator: (val) {
                          return val!.isEmpty || !val.contains(' ')
                              ? "choose interval"
                              : null;
                        },
                        decoration: const InputDecoration(
                          fillColor: Color.fromRGBO(238, 241, 243, 1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BasicDateField(
                        controller: _startdateController,
                        title: "Start Date",
                        validator: (val) {
                          return val!.toString().isEmpty ||
                                  !val.toString().contains(' ')
                              ? "Choose Date"
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BasicDateField(
                        controller: _endDateController,
                        title: "End Date(Optional)",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedInputField(
                        controller: _amountController,
                        hintText: "Input Amount",
                        validator: (val) {
                          return val!.isEmpty || !val.contains(' ')
                              ? "Enter Amount"
                              : null;
                        },
                      )
                    ])),
                  ),
                ),
              )),
          Positioned(
            bottom: 20,
            left: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                final isValid = formKey.currentState!.validate();
                if (isValid) return;

                double savedValue(){
                  double savedValue= double.parse(_amountController.text);
                  return savedValue=(savedValue/2);
                }

                Provider.of<BudgetProvider>(context, listen: false).addBudget(
                  _budgetnameController.text,
                  selectedItem,
                  _startdateController.text,
                  _endDateController.text,
                  _amountController.text,
                  savedValue().toString()
                );
                Provider.of<BudgetProvider>(context, listen: false).getTotalSaved();
                changeScreenReplacement(context, const BudgetScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                    color: kblue,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Text(
                  "Create",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ]));
  }

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _endDateController.dispose();
    _startdateController.dispose();
    _budgetnameController.dispose();
  }
}
