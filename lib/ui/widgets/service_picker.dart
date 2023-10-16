// ignore_for_file: library_private_types_in_public_api, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';

import '../../models/service.dart';
import '../../resources/colors.dart';

class ServiceWidget extends StatefulWidget {
  List<Service> services;
  final Function(Service) onServiceSelected;

  ServiceWidget({super.key, required this.services, required this.onServiceSelected});

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState(services);
}

class _ServiceWidgetState extends State<ServiceWidget> {
  final List<Service> _services;
  Service? _selectedService;

  _ServiceWidgetState(this._services);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            labelText: 'Nome do serviço:',
            labelStyle: const TextStyle(color: CPColors.primaryBlue, fontSize: 14),
            filled: true,
            fillColor: Colors.transparent, // Make it transparent so that the parent color will be visible
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            hintText: 'Select a service',
            hintStyle: TextStyle(color: CPColors.primaryBlue.withOpacity(0.5)),
          ),
          items: _services.map((Service service) {
            return DropdownMenuItem<String>(
              value: service.id,
              child: Text("${service.name} - R\$${service.price.toString()}"),
            );
          }).toList(),
          value: _selectedService?.id,
          onChanged: (newValue) {
            setState(() {
              _selectedService = _services.firstWhere((element) => element.id == newValue);
              if (_selectedService == null) { return; }
              widget.onServiceSelected(_selectedService!);
            });
          },
        ),
      ),
    );
  }
}
