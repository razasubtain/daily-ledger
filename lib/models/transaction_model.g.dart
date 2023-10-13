// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 1;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      id: fields[0] as String?,
      customerId: fields[1] as String?,
      customerName: fields[2] as String?,
      amount: fields[3] as double?,
      transactionDescprition: fields[4] as String?,
      customerImage: fields[5] as String?,
      transactionProof: fields[6] as String?,
      transactionType: fields[7] as String?,
      date: fields[8] as String?,
      wallet: fields[9] as Wallet?,
    )..createdAt = fields[10] as String?;
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerId)
      ..writeByte(2)
      ..write(obj.customerName)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.transactionDescprition)
      ..writeByte(5)
      ..write(obj.customerImage)
      ..writeByte(6)
      ..write(obj.transactionProof)
      ..writeByte(7)
      ..write(obj.transactionType)
      ..writeByte(8)
      ..write(obj.date)
      ..writeByte(9)
      ..write(obj.wallet)
      ..writeByte(10)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
