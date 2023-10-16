class Customer {
  String? cpf;
  String name;
  String dob;
  String phoneNumber;
  String email;

  Customer(
      {this.cpf,
      required this.name,
      required this.dob,
      required this.phoneNumber,
      required this.email});
}