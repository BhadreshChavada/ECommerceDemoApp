import 'package:employee/view/model/RegistrationData.dart';
import 'package:employee/view/screens/ProductList.dart';
import 'package:employee/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';

class DisplayFormData extends StatefulWidget {
  RegistrationData registrationData;

  DisplayFormData({super.key, required this.registrationData});

  @override
  State<DisplayFormData> createState() =>
      _DisplayFormDataState(registrationData);
}

class _DisplayFormDataState extends State<DisplayFormData> {
  RegistrationData registrationData;

  _DisplayFormDataState(this.registrationData);


  void onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Thanks For Registration \nYour details are :",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Row(
                  children: [
                    const Text("First name : "),
                    Text(registrationData.firstName)
                  ],
                ),
                Row(
                  children: [
                    const Text("Last name : "),
                    Text(registrationData.lastName)
                  ],
                ),
                Row(
                  children: [
                    const Text("Email : "),
                    Text(registrationData.email)
                  ],
                ),
                Row(
                  children: [
                    const Text("Mobile number : "),
                    Text(registrationData.mobileNumber)
                  ],
                ),
                Row(
                  children: [
                    const Text("Address : "),
                    Text(registrationData.address)
                  ],
                ),
                Row(
                  children: [
                    const Text("City : "),
                    Text(registrationData.city)
                  ],
                ),
                Row(
                  children: [
                    const Text("Country : "),
                    Text(registrationData.country)
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      child: CustomButton(
                        onTap: onTap, title: "Browse the Products",),
                    )

                  ],
                )
              ],
            ),
          ),
        ));
  }
}
