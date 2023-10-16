// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/checkout_state_manager.dart';
import '../widgets/cp_button.dart';

class OrderItemWidget extends StatelessWidget {
  final String itemText;
  final VoidCallback onDelete;

  const OrderItemWidget({
    super.key,
    required this.itemText,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
      title: Text(
        itemText,
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
      ),
    );
  }
}

class OrderDetailsForm extends StatefulWidget {
  const OrderDetailsForm({super.key});

  @override
  _OrderDetailsFormState createState() => _OrderDetailsFormState();
}

class _OrderDetailsFormState extends State<OrderDetailsForm> {
  
  @override
  Widget build(BuildContext context) {
    final orderItems = context.watch<CheckoutStateManager>().orders;
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true, // Ensure the ListView doesn't take more space than needed
          itemCount: orderItems.length,
          itemBuilder: (context, index) {
            return OrderItemWidget(
              itemText: orderItems[index].toString(),
              onDelete: () {
                setState(() {
                  context.read<CheckoutStateManager>().removeOrder(orderItems[index]);
                });
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
                color: Colors.black,
                thickness: 0.3);
          },
        ),
        CPButton(onPressed: () {
          context.read<CheckoutStateManager>().previousState();
        }, buttonText: "Adicionar")
      ],
    );
  }
}
