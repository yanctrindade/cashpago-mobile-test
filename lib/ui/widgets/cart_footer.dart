import 'package:cashpago_test/ui/widgets/cp_button.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../resources/strings.dart';

enum CartButtonType {
  showDetails,
  payment,
}

class CartFooter extends StatelessWidget {
  final int cartItemCount; // Number of items in the cart
  final double totalAmount; // Total amount in BRL
  final bool showPayButton; // Whether to show the pay button
  final VoidCallback? showDetailsPressed;
  final VoidCallback? paymentSelectionPressed;

  const CartFooter({
    Key? key,
    this.cartItemCount = 0,
    this.totalAmount = 0.0,
    this.showPayButton = false, 
    this.showDetailsPressed, 
    this.paymentSelectionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CPColors.primaryGreen,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLeftButton(context), 
          buildMiddleButton(context, showPayButton ? CartButtonType.payment : CartButtonType.showDetails), 
          buildRightButton()],
      ),
    );
  }

  Widget buildLeftButton(BuildContext context) {
    return Stack(
      children: [
        const Text("S",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 32,
              color: Colors.white,
            )),
        Positioned(
          left: 4,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              '$cartItemCount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMiddleButton(BuildContext context, CartButtonType type) {
    switch (type) {
      case CartButtonType.showDetails:
        return OutlinedButton(
          onPressed: () {
            showDetailsPressed?.call();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide.none,
          ),
          child: const Text(
            Strings.middleButtonCartTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      case CartButtonType.payment:
        return CPButton(onPressed: () {
          paymentSelectionPressed?.call();
        }, buttonText: "Pagar", 
        backgroundColor: Colors.blueAccent,);
    }
  }

  Widget buildRightButton() {
    return Text(
      'R\$ ${totalAmount.toStringAsFixed(2)}',
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
