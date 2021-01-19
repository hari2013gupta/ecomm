import 'package:ecomm/components/custom_surfix_icon.dart';
import 'package:ecomm/components/default_button.dart';
import 'package:ecomm/utils/my_constant.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  String mobile;
  bool remember = false;
  final List<String> errors = [];

  void addErrors({String e}) {
    if (!errors.contains(e))
      setState(() {
        errors.add(e);
      });
  }

  void removeError({String e}) {
    if (errors.contains(e))
      setState(() {
        errors.remove(e);
      });
  }

  @override
  Widget build(BuildContext context) {
    var mobileTFF = TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => mobile = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(e: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addErrors(e: kPhoneNumberNullError);
          return "";
        } else if(value.length < 10) {
        addErrors(e: kPhoneNumber10digit);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mobile No",
        hintText: "Enter your Mobile No",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
    var submitBTN = DefaultButton(
      text: "Submit",
      press: () {
        if (_formKey.currentState.validate()) {
          print("Clicked here---------");
          
          // Do what you want to do
        }
      },
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          mobileTFF,
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          submitBTN
        ],
      ),
    );
  }
}
