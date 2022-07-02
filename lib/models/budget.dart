class Budget {
  final String name;

  String? startdate , enddate ;
  final String interval;
  final String? budgetamount;
  final String? savedamount;

  Budget({
    required this.interval,
    required this.name,
    required this.budgetamount,
    this.startdate  ,
    this.enddate,
    this.savedamount
  });

}
