import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:digi_app/models/wallet_model.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? customerId;
  @HiveField(2)
  String? customerName;
  @HiveField(3)
  double? amount;
  @HiveField(4)
  String? transactionDescprition;
  @HiveField(5)
  String? customerImage;
  @HiveField(6)
  String? transactionProof;
  @HiveField(7)
  String? transactionType;
  @HiveField(8)
  String? date;
  @HiveField(9)
  Wallet? wallet;
  @HiveField(10)
  String? createdAt;
  Transaction({
    this.id,
    this.customerId,
    this.customerName,
    this.amount,
    this.transactionDescprition,
    this.customerImage,
    this.transactionProof,
    this.transactionType,
    this.date,
    this.wallet,
    this.createdAt,
  });

  Transaction copyWith({
    String? id,
    String? customerId,
    String? customerName,
    double? amount,
    String? transactionDescprition,
    String? customerImage,
    String? transactionProof,
    String? transactionType,
    String? date,
    Wallet? wallet,
    String? createdAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      amount: amount ?? this.amount,
      transactionDescprition:
          transactionDescprition ?? this.transactionDescprition,
      customerImage: customerImage ?? this.customerImage,
      transactionProof: transactionProof ?? this.transactionProof,
      transactionType: transactionType ?? this.transactionType,
      date: date ?? this.date,
      wallet: wallet ?? this.wallet,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'customerName': customerName,
      'amount': amount,
      'transactionDescprition': transactionDescprition,
      'customerImage': customerImage,
      'transactionProof': transactionProof,
      'transactionType': transactionType,
      'date': date,
      'wallet': wallet?.toMap(),
      'createdAt': createdAt,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      customerId: map['customerId'],
      customerName: map['customerName'],
      amount: map['amount']?.toDouble(),
      transactionDescprition: map['transactionDescprition'],
      customerImage: map['customerImage'],
      transactionProof: map['transactionProof'],
      transactionType: map['transactionType'],
      date: map['date'],
      wallet: map['wallet'] != null ? Wallet.fromMap(map['wallet']) : null,
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transaction(id: $id, customerId: $customerId, customerName: $customerName, amount: $amount, transactionDescprition: $transactionDescprition, customerImage: $customerImage, transactionProof: $transactionProof, transactionType: $transactionType, date: $date, wallet: $wallet, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.id == id &&
        other.customerId == customerId &&
        other.customerName == customerName &&
        other.amount == amount &&
        other.transactionDescprition == transactionDescprition &&
        other.customerImage == customerImage &&
        other.transactionProof == transactionProof &&
        other.transactionType == transactionType &&
        other.date == date &&
        other.wallet == wallet &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        customerId.hashCode ^
        customerName.hashCode ^
        amount.hashCode ^
        transactionDescprition.hashCode ^
        customerImage.hashCode ^
        transactionProof.hashCode ^
        transactionType.hashCode ^
        date.hashCode ^
        wallet.hashCode ^
        createdAt.hashCode;
  }
}
