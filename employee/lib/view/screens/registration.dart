import 'dart:convert';
import 'package:employee/view/model/CountryData.dart';
import 'package:employee/view/model/RegistrationData.dart';
import 'package:employee/view/screens/displayFormData.dart';
import 'package:employee/view/widget/CustomButton.dart';
import 'package:employee/view/widget/CustomEditText.dart';
import 'package:employee/view/widget/PasswordEditText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ExtendableList.dart';
import '../widget/DropDown.dart';
import '../widget/PhoneNumberEditText.dart';
import 'package:email_validator/email_validator.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final List<String> _countryList = ExtendableList();
  CountryData countryData = CountryData();
  final List<String> _cityList = ExtendableList();
  late String _country,_city;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void onTap() {
    if (isValid()) {
      var registrationData = RegistrationData(firstNameController.text, lastNameController.text,
          emailController.text, passwordController.text,
          phoneNumberController.text, _country, _city, addressController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayFormData(registrationData: registrationData)),
      );
    }
  }

  bool isValid() {
    if (firstNameController.text.isEmpty) {
      showSnackbar("Please enter first name");
      return false;
    }
    if (lastNameController.text.isEmpty) {
      showSnackbar("Please enter last name");
      return false;
    }
    if (emailController.text.isEmpty) {
      showSnackbar("Please enter email");
      return false;
    }
    if(!EmailValidator.validate(emailController.text)){
      showSnackbar("Please enter valid email");
      return false;
    }
    if (passwordController.text.isEmpty) {
      showSnackbar("Please enter password");
      return false;
    }
    if (phoneNumberController.text.isEmpty) {
      showSnackbar("Please enter mobile number");
      return false;
    }
    if (addressController.text.isEmpty) {
      showSnackbar("Please enter address");
      return false;
    }
    return true;
  }

  void showSnackbar(String msg) {
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    super.dispose();
  }

// Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("files/country.json");
    final data = await json.decode(response);

    countryData.fromJson(data);
    if (kDebugMode) {
      print(countryData.countries?[0].countryName);
      print(countryData.countries?[0].states?[0].stateName);
      print(countryData.countries?[0].states?[0].cities?[0]);
    }

    setState(() {
      countryData.countries?.forEach((element) {
        _countryList.add(element.countryName!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomEditText(
            hint: "Enter First Name",
            textController: firstNameController,
          ),
          CustomEditText(
            hint: "Enter Last Name",
            textController: lastNameController,
          ),
          CustomEditText(
            hint: "Enter Email",
            textController: emailController,
          ),
          PasswordEditText(
            hint: "Enter password",
            textController: passwordController,
          ),
          PhoneNumberEditText(
            hint: "Enter Mobile number",
            textController: phoneNumberController,
          ),
          DropDown(
              hint: "Select Country",
              items: _countryList,
              onChanged: (String? newValue) {
                setState(() {
                  _country = newValue!;
                  _cityList.clear();
                  countryData.countries?.forEach((element) {
                    if (element.countryName == newValue) {
                      element.states?.forEach((element) {
                        _cityList.addAll(element.cities!);
                      });
                    }
                  });
                  _cityList.sort();
                });
              }),
          DropDown(
              hint: "Select City",
              items: _cityList,
              onChanged: (String? newValue) {
                _city = newValue!;
                setState(() {
                  if (kDebugMode) {
                    print(newValue);
                  }
                });
              }),
          CustomEditText(
            hint: "Enter Address",
            textController: addressController,
          ),
          CustomButton(
            onTap: onTap,
            title: "Submit",
          )
        ],
      ),
    );
  }

}
