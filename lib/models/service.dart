import 'package:cashpago_test/models/responses/service_response_item.dart';

enum ServiceType { watercraft, car4x4, fourWheeler, undefined }

class Service {
  String id;
  String name;
  double price;
  ServiceType type;

  Service(
      {required this.id,
      required this.name,
      required this.price,
      required this.type});

  factory Service.fromServiceResponse(ServiceResponseItem responseItem) {
    return Service(
        id: responseItem.id,
        name: responseItem.nome,
        price: responseItem.valor,
        type: mapStringToServiceType(responseItem.nomeTipo));
  }

  static ServiceType mapStringToServiceType(String typeString) {
    switch (typeString.toLowerCase()) {
      case "4x4":
        return ServiceType.car4x4;
      case "embarcação":
        return ServiceType.watercraft;
      case "quadriciclo":
        return ServiceType.fourWheeler;
      default:
        return ServiceType.undefined;
    }
  }
}
