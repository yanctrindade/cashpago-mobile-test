import 'package:flutter/material.dart';

import '../../resources/images.dart';
import '../widgets/image_button.dart';

class PaymentMethodForm extends StatelessWidget {
  const PaymentMethodForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        crossAxisCount: 2, 
        childAspectRatio: 1.0, 
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          ImageButton(imageAsset: Images.pix, title: 'Pix', onPressed: () {
            // Handle button press
          }),
          ImageButton(imageAsset: Images.creditCard, title: 'Cartão', onPressed: () {
            // Handle button press
          }),
          ImageButton(imageAsset: Images.balance, title: 'Saldo', onPressed: () {
            // Handle button press
          }),
          ImageButton(imageAsset: Images.paymentLink, title: 'Link', onPressed: () {
            // Handle button press
          }),
        ],
      ),
    );
  }
}
