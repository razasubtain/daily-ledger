import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:digi_app/models/transaction_model.dart';
import 'package:hive/hive.dart';
part 'customer_model.g.dart';

@HiveType(typeId: 0)
class Customer {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? customerName;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  String? city;
  @HiveField(5)
  String? businessName;
  @HiveField(6)
  String? ledgerNo;
  @HiveField(7)
  List<Transaction>? transactionList;
  Customer({
    this.id,
    this.customerName,
    this.image,
    this.phoneNumber,
    this.city,
    this.businessName,
    this.ledgerNo,
    this.transactionList,
  }) {
    transactionList = [];
  }

  Customer copyWith({
    String? id,
    String? customerName,
    String? image,
    String? phoneNumber,
    String? city,
    String? businessName,
    String? ledgerNo,
    List<Transaction>? transactionList,
  }) {
    return Customer(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      businessName: businessName ?? this.businessName,
      ledgerNo: ledgerNo ?? this.ledgerNo,
      transactionList: transactionList ?? this.transactionList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerName': customerName,
      'image': image,
      'phoneNumber': phoneNumber,
      'city': city,
      'businessName': businessName,
      'ledgerNo': ledgerNo,
      'transactionList': transactionList?.map((x) => x.toMap()).toList(),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      customerName: map['customerName'],
      image: map['image'],
      phoneNumber: map['phoneNumber'],
      city: map['city'],
      businessName: map['businessName'],
      ledgerNo: map['ledgerNo'],
      transactionList: map['transactionList'] != null
          ? List<Transaction>.from(
              map['transactionList']?.map((x) => Transaction.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(id: $id, customerName: $customerName, image: $image, phoneNumber: $phoneNumber, city: $city, businessName: $businessName, ledgerNo: $ledgerNo, transactionList: $transactionList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.id == id &&
        other.customerName == customerName &&
        other.image == image &&
        other.phoneNumber == phoneNumber &&
        other.city == city &&
        other.businessName == businessName &&
        other.ledgerNo == ledgerNo &&
        listEquals(other.transactionList, transactionList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        customerName.hashCode ^
        image.hashCode ^
        phoneNumber.hashCode ^
        city.hashCode ^
        businessName.hashCode ^
        ledgerNo.hashCode ^
        transactionList.hashCode;
  }
}
