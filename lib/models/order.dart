import 'customer.dart';
import 'service.dart';

class Order {
  Service service;
  String date;
  String time;
  Customer? customer;
  String? paymentMethod;

  Order(
      {required this.service,
      required this.date,
      required this.time,
      this.customer,
      this.paymentMethod});

  @override
  String toString() {
    return '${service.name} - $date - $time - ${customer?.name} - R\$${service.price}';
  }
}