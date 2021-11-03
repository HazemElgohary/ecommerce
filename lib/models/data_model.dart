import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;
  final String registered;

  const Data({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  factory Data.fromJson(Map<String,dynamic> json) {
    return Data(
      id: json['id'],
      isActive: json['isActive'],
      price: json['price'],
      company: json['company'],
      picture: json['picture'],
      buyer: json['buyer'],
      tags: json['tags'].cast<String>(),
      status: json['status'],
      registered: json['registered'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "isActive": isActive,
      "price": price,
      "company": company,
      "picture": picture,
      "buyer": buyer,
      "tags": tags,
      "status": status,
      "registered": registered,
    };
  }

  @override
  List<Object?> get props => [
   id,
   isActive,
   price,
   company,
   picture,
   buyer,
   tags,
   status,
   registered,
  ];
}
