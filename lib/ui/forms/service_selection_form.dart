// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/order.dart';
import '../../models/service.dart';
import '../../states/checkout_state_manager.dart';
import '../widgets/cp_button.dart';
import '../widgets/date_picker.dart';
import '../widgets/service_picker.dart';

class ServiceSelectionForm extends StatelessWidget {
  Service? serviceSelected;
  String? dateSelected;
  String? timeSelected;
  ServiceSelectionForm({super.key});

  //final mockServices = [Service(id: "001", name: "4x4", price: 20.00)];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DatePickerWidget(onDateSelected: (date) {
              dateSelected = date;
            }, onTimeSelected: (time) {
              timeSelected = time;
            }),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ServiceWidget(services: context.watch<CheckoutStateManager>().services, 
          onServiceSelected: (serviceSelected) {  
            this.serviceSelected = serviceSelected;
          },),
        ),
        const SizedBox(height: 30.0),
        CPButton(onPressed: () {
          if (serviceSelected == null || dateSelected == null || timeSelected == null) {
            return;
          }
          final newOrder = Order(service: serviceSelected!, date: dateSelected!, time: timeSelected!);
          Provider.of<CheckoutStateManager>(context, listen: false).setCurrentOrder(newOrder);
          Provider.of<CheckoutStateManager>(context, listen: false).nextState();
        }, buttonText: "Avançar")
      ],
    );
  }
}
