// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/step_model.dart';
import '../../states/checkout_state_manager.dart';
import '../forms/customer_info_form.dart';
import '../forms/order_details_form.dart';
import '../forms/payment_method_form.dart';
import '../forms/service_selection_form.dart';
import '../widgets/cart_footer.dart';
import '../widgets/header_view.dart';
import '../widgets/step_progress_bar.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  double keyboardOffset = Platform.isIOS ? -32.0 : 32.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: 
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height 
                    + keyboardOffset 
                    - kToolbarHeight,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          HeaderView(title: Provider.of<CheckoutStateManager>(context, listen: false).headerTitle()),
                          const SizedBox(height: 32),

                          if (_shouldShowProgressBar(context))
                            StepProgressBar(
                              steps: [
                                StepModel(title: 'Informações\ndo Passeio', isEnabled: context.watch<CheckoutStateManager>().state.value == 0),
                                StepModel(title: 'Dados\ndo cliente', isEnabled: context.watch<CheckoutStateManager>().state.value == 1),
                                StepModel(title: 'Pagamento', isEnabled: context.watch<CheckoutStateManager>().state.value == 2),
                              ],
                            currentStep: context.watch<CheckoutStateManager>().state.value,
                          ),
        
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                              child: _getForm(context),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Positioned CartFooter at the bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CartFooter(
                      cartItemCount: context.watch<CheckoutStateManager>().orders.length,
                      totalAmount: context.watch<CheckoutStateManager>().totalAmount,
                      showPayButton: _shoudlShowPayButton(context), 
                      showDetailsPressed: () {
                        context.read<CheckoutStateManager>().showOrderDetails();
                      }, 
                      paymentSelectionPressed: () {
                        context.read<CheckoutStateManager>().nextState();
                      },
                    ),
                  ),
                ],
              ),
          ),
        ),
      );
  }

  bool _shoudlShowPayButton(BuildContext context) {
    return context.watch<CheckoutStateManager>().state == CheckoutStates.orderInfo;
  }

  Widget _getForm(BuildContext context) {
    switch (context.watch<CheckoutStateManager>().state) {
      case CheckoutStates.newOrder:
        return ServiceSelectionForm();
      case CheckoutStates.customerInfo:
        return const CustomerInfoForm();
      case CheckoutStates.paymentMethod:
        return const PaymentMethodForm();
      case CheckoutStates.orderInfo:
        return const OrderDetailsForm();
    }
  }
  
  bool _shouldShowProgressBar(BuildContext context) {
    return Provider.of<CheckoutStateManager>(context, listen: false).state != CheckoutStates.orderInfo;
  }
}
