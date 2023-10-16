import 'package:cashpago_test/network/api_service.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';
import '../models/service.dart';
import '../models/responses/cpf_response.dart';

enum CheckoutStates { newOrder, customerInfo, orderInfo, paymentMethod}

extension CheckoutStatesExtension on CheckoutStates {
  int get value {
    switch (this) {
      case CheckoutStates.newOrder:
        return 0;
      case CheckoutStates.customerInfo:
        return 1;
      case CheckoutStates.paymentMethod:
      case CheckoutStates.orderInfo:
        return 2;
    }
  }
}

class CheckoutStateManager extends ChangeNotifier {

  var state = CheckoutStates.newOrder; //initial state is newOrder

  final _services = List<Service>.empty(growable: true);
  final _orders = List<Order>.empty(growable: true);
  late Order _currentOrder;
  var _totalAmount = 0.0;

  List<Service> get services => _services;
  List<Order> get orders => _orders;
  Order get currentOrder => _currentOrder;
  double get totalAmount => _totalAmount;

  //TODO: Inject this dependency
  ApiService apiService = ApiServiceImp();

  CheckoutStateManager() {
    getServices();
  }

  void addNewOrder(Order order) {
    orders.add(order);
    updateTotalAmount();
    notifyListeners();
  }

  void removeOrder(Order order) {
    orders.remove(order);
    updateTotalAmount();
    notifyListeners();
  }

  void setCurrentOrder(Order order) {
    _currentOrder = order;
    notifyListeners();
  }

  void updateTotalAmount() {
    _totalAmount = orders.fold(0, (previousValue, element) => previousValue + element.service.price);
    notifyListeners();
  }

  String headerTitle() {
    switch (state) {  
      case CheckoutStates.orderInfo:
        return 'Resumo';
      default:
        return 'Nova venda\n4x4';
    }
  }

  void nextState() {
    switch (state) {
      case CheckoutStates.newOrder:
        state = CheckoutStates.customerInfo;
        break;
      case CheckoutStates.customerInfo:
        state = CheckoutStates.paymentMethod;
        break;
      case CheckoutStates.paymentMethod:
        //TODO: Order Finished
        break;
      case CheckoutStates.orderInfo:
        state = CheckoutStates.paymentMethod;
        break;
    }
    notifyListeners();
  }

  void previousState() {
    switch (state) {
      case CheckoutStates.newOrder:
        //TODO: back to home
        break;
      case CheckoutStates.customerInfo:
        state = CheckoutStates.newOrder;
        break;
      case CheckoutStates.orderInfo:
        state = CheckoutStates.newOrder;
        break;
      case CheckoutStates.paymentMethod:
        state = CheckoutStates.orderInfo;
        break;
    }
    notifyListeners();
  }

  void showOrderDetails() {
    state = CheckoutStates.orderInfo;
    notifyListeners();
  }

  void getServices({ServiceType type = ServiceType.fourWheeler}) {
    apiService.getServices().then((services) {
      List<Service> filteredServices = filterServicesByType(services, ServiceType.car4x4);
      List<Service> uniqueServices = removeDuplicateServices(filteredServices);
      _services.addAll(uniqueServices);
      notifyListeners();
    });
  }

  List<Service> filterServicesByType(
      List<Service> services, ServiceType targetType) {
    return services.where((service) => service.type == targetType).toList();
  }

  List<Service> removeDuplicateServices(List<Service> services) {
    final Map<String, Service> serviceMap = {}; // Use a map to track seen IDs
    final List<Service> uniqueServices = [];

    for (final service in services) {
      if (!serviceMap.containsKey(service.id)) {
        // If the ID is not in the map, add it to the map and the unique list
        serviceMap[service.id] = service;
        uniqueServices.add(service);
      }
    }

    return uniqueServices;
  }

  Future<CPFResponse> searchCPF(String cpf) async {
    final cpfData = await apiService.cpfSearch(cpf);
    return cpfData;
  }
}