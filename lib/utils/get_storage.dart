import 'dart:collection';

import 'package:billable/models/budget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserToken with ChangeNotifier {
  GetStorage box = GetStorage();
}

class PostComment with ChangeNotifier {}

class BudgetProvider with ChangeNotifier {
  int index=0;
  double totalSaved=0;
  final List<Budget> _budgets = [];

  UnmodifiableListView<Budget> get budgets {
    return UnmodifiableListView(_budgets);
  }

  void addBudget(String name, interval,  startdate, enddate,
       budgetamount, savedamount) {
    final budgetprop = Budget(
        name: name,
        budgetamount: budgetamount,
        interval: '',
        startdate: startdate,
        enddate: enddate,
        savedamount: savedamount);
    _budgets.add(budgetprop);
    notifyListeners();
  }
  double getTotalSaved() {
    double total=0;
    for (int i=0;i< _budgets.length;i++) {

       double saved =double.parse(_budgets[i].savedamount!);
      total+= saved;
      notifyListeners();
    }
    //  int totlSaved =int.parse(state.budgets[ind].budgetamount!).
    // reduce((value, element) => value + element) as int;
  notifyListeners();
    print("this is $total");
    return total;
  }

//total amount
  double getTotalAmount() {
    double total=0;
    for (int i=0;i< _budgets.length;i++) {

      double amount =double.parse(_budgets[i].budgetamount!);
      total+= amount;
      notifyListeners();
    }
    //  int totlSaved =int.parse(state.budgets[ind].budgetamount!).
    // reduce((value, element) => value + element) as int;
    notifyListeners();
    print("this is $total");
    return total;
  }

  void deleteBudget(Budget budget){
    _budgets.remove(budget);
    notifyListeners();
  }
}
