import 'dart:convert';

Bank bankFromJson(String str) => Bank.fromJson(json.decode(str));
String bankToJson(Bank data) => json.encode(data.toJson());
class Bank {
  Bank({
      this.cardExpire, 
      this.cardNumber, 
      this.cardType, 
      this.currency, 
      this.iban,});

  Bank.fromJson(dynamic json) {
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardExpire'] = cardExpire;
    map['cardNumber'] = cardNumber;
    map['cardType'] = cardType;
    map['currency'] = currency;
    map['iban'] = iban;
    return map;
  }

}