import 'dart:convert';

import 'package:hive/hive.dart';
part 'wallet_model.g.dart';

@HiveType(typeId: 2)
class Wallet {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? walletName;
  @HiveField(2)
  String? walletNumber;
  Wallet({
    this.id,
    this.walletName,
    this.walletNumber,
  });

  Wallet copyWith({
    String? id,
    String? walletName,
    String? walletNumber,
  }) {
    return Wallet(
      id: id ?? this.id,
      walletName: walletName ?? this.walletName,
      walletNumber: walletNumber ?? this.walletNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'walletName': walletName,
      'walletNumber': walletNumber,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map['id'],
      walletName: map['walletName'],
      walletNumber: map['walletNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source));

  @override
  String toString() =>
      'Wallet(id: $id, walletName: $walletName, walletNumber: $walletNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wallet &&
        other.id == id &&
        other.walletName == walletName &&
        other.walletNumber == walletNumber;
  }

  @override
  int get hashCode => id.hashCode ^ walletName.hashCode ^ walletNumber.hashCode;
}
