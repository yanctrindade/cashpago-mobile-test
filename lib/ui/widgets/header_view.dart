import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/images.dart';
import '../../states/checkout_state_manager.dart';

class HeaderView extends StatelessWidget {
  final String title;

  const HeaderView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
            Images.headerBg,
            width: double.infinity,
            height: 170,
            fit: BoxFit.fill,
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 32.0, 0, 0),
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 22.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Aller')
              ),
            ),
          ),
          Positioned(
          top: 8,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.read<CheckoutStateManager>().previousState();
            },
          ),
        ),
        Positioned(
          bottom: -24,
          right: 0,
          child: Image.asset(
            Images.headerCairuLogo,
            width: 140,
            height: 180,
          ),
        ),
      ],
    );
  }
}