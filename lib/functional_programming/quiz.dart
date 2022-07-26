import 'dart:math';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {

  print("===========Q1==========");
  print("1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오");

  var q1 = ( transactions.where((e) => e.year == 2011).toList()
    ..sort((a, b) => a.value.compareTo(b.value)))
      .forEach((e)  { print(e.trader.name); }  );


  print("===========Q2==========");
  print("2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오");

  // Method 1
  print(transactions.map((element) => element.trader.city).toSet().toList());
  // Method 2
  transactions.map((e) => e.trader.city).toSet().forEach(print);


  print("===========Q3==========");
  print("3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오");

  // Method 1 :
  ( transactions
      .where((e) => e.trader.city == "Cambridge")
      .map((e) => e.trader.name)
  // .toSet()
      .toList()
    ..sort((a, b) => a.compareTo(b))
  ).forEach(print);

  // Method 2 :
  // ( transactions.where((e) => e.trader.city == "Cambridge").toList()
  //   ..sort((a, b) => a.trader.name.compareTo(b.trader.name)))
  //     .forEach((e) {
  //       print(e.trader.name); }
  // );


  print("===========Q4==========");
  print("4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오");
  print(transactions.map((e) => e.trader.name).toList()..sort());


  print("===========Q5==========");
  print("5. 밀라노에 거래자가 있는가?");
  print(transactions.any((e) => e.trader.city == "Milan"));


  print("===========Q6==========");
  print("6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오");

  // Method 1 :
  for(var i =0 ; i <transactions.length;i++){
    if (transactions[i].trader.city == "Cambridge"){
      print( transactions[i].trader.name + " , "
          + transactions[i].trader.city
          // + transactions[i].year + " , "
          // + transactions[i].value
      //  Error: A value of type 'int' can't be assigned to a variable of type 'String'.

      );
    }
  }

  // Method 2 :
  // (transactions.where((e) => e.trader.city == "Cambridge"))
  //     .forEach((e) {
  //       print( '${e.trader.name}/ ${e.trader.city}/ ${e.year}/ ${e.value}'); }
  // );


  print("===========Q7==========");
  print("7. 전체 트랜잭션 중 최대값은 얼마인가?");

  // Method 1 :
  print(transactions.map((e) => e.value).reduce((v, e) => max(v,e)));

  // Method 2 :
  // int temp_max = 0;
  // for(var i =0 ; i <transactions.length;i++){
  //   if (temp_max <  transactions[i].value){
  //     temp_max = transactions[i].value;
  //   }
  // }
  // print(temp_max);


  print("===========Q8==========");
  print("8. 전체 트랜잭션 중 최소값은 얼마인가?");

  // Method 1 :
  print(transactions.map((e) => e.value).reduce(min));

  // Method 2 :
  // int temp_min = 999999;
  // for(var i =0 ; i <transactions.length;i++){
  //   if (temp_min >  transactions[i].value){
  //     temp_min = transactions[i].value;
  //   }
  // }
  // print(temp_min);


  // // 예시 : 최고 값 찾기
  // final items = [2,3,4,5,6];

  // //  방법 1:
  // print(items.reduce((e,v) => max(e,v)));
  //
  // // 방법 2:
  // final result = items.reduce(max);
  // print(result);

}


