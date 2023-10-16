// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/customer.dart';
import '../../resources/formatters.dart';
import '../../states/checkout_state_manager.dart';
import '../widgets/cp_button.dart';
import '../widgets/cp_textfield.dart'; // Needed for TextInputFormatter

class CustomerInfoForm extends StatefulWidget {
  const CustomerInfoForm({super.key});

  @override
  _CustomerInfoFormState createState() => _CustomerInfoFormState();
}

class _CustomerInfoFormState extends State<CustomerInfoForm> {
  final fullNameController = TextEditingController();
  final cpfController = TextEditingController();
  final dobController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final FocusNode _focusNodeCpf = FocusNode();

  bool isSemCpfChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Column(
            children: [
              CPTextField(
                controller: cpfController,
                title: "CPF",
                focusNode: _focusNodeCpf,
                enabled: !isSemCpfChecked,
                keyboardType: Platform.isIOS ? TextInputType.text : TextInputType.number,
                formatters: CPFormatters.getCPFFormatters(),
                onSubmittedCallback: (input) {
                  _focusNodeCpf.unfocus(); // Close the keyboard
                  handleOnSubmittedCallbackForCPFSearch(input);
                },
              ),
              const SizedBox(height: 0),
              buildNoCPFCheckbox(),
              const SizedBox(height: 0),
              CPTextField(
                controller: fullNameController,
                title: "Nome",
              ),
              const SizedBox(height: 16),
              CPTextField(
                controller: dobController,
                keyboardType: TextInputType.number,
                title: "Nascimento",
                formatters: CPFormatters.getDobFormatters(),
              ),
              const SizedBox(height: 16),
              CPTextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                title: "Celular",
                formatters: CPFormatters.getPhoneFormatters(),
              ),
              const SizedBox(height: 16),
              CPTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                title: "Email",
              ),
              const SizedBox(height: 16),
              CPButton(
                onPressed: () {
                  //TODO validate fields
                  final newOrder =
                      context.read<CheckoutStateManager>().currentOrder;
                  newOrder.customer = Customer(
                      cpf: isSemCpfChecked ? "" : cpfController.text,
                      name: fullNameController.text,
                      dob: dobController.text,
                      phoneNumber: phoneNumberController.text,
                      email: emailController.text);
                  context.read<CheckoutStateManager>().addNewOrder(newOrder);
                  context.read<CheckoutStateManager>().nextState();
                },
                buttonText: "Adicionar",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNoCPFCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: isSemCpfChecked,
          onChanged: (value) {
            setState(() {
              isSemCpfChecked = value!;
            });
          },
        ),
        const Align(
          alignment: Alignment.centerLeft, // Adjust the alignment as needed
          child: Text(
            "Não possui CPF",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    cpfController.dispose();
    dobController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }
  
  void handleOnSubmittedCallbackForCPFSearch(String input) async {
    debugPrint("CPF submitted callBack: $input");
    var cpfData = await context.read<CheckoutStateManager>().searchCPF(input);
    debugPrint(cpfData.toString());

    setState(() {
      fullNameController.text = cpfData.data.nome;
      dobController.text = cpfData.data.datNascimento;
    });
  }
}
