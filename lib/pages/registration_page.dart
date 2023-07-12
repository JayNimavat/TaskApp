import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:task/pages/home_page.dart';
import 'package:task/pages/weather_homePage.dart';

class RegistartionScreen extends StatefulWidget {
  const RegistartionScreen({super.key});

  @override
  State<RegistartionScreen> createState() => _registartionScreenState();
}

class _registartionScreenState extends State<RegistartionScreen> {
  bool _obscureText = true;
  DateTime? dob;
  final _formKey = GlobalKey<FormState>();
  String _gender = "";

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  late TextEditingController firstnameController,
      lastnameController,
      emailController,
      phoneController,
      dobController,
      passwordController;
  late FocusNode firstnameField,
      lastnameField,
      phoneField,
      emailField,
      dobField,
      passwordFeild;
  void selectStartDate() async {
    debugPrint("here");
    dob = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.fromMillisecondsSinceEpoch(0),
      lastDate: DateTime.now(),
    );
    setState(() {
      if (dob != null) {
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(dob!);
        dobController.text = formatted;
      } else {
        dobController.clear();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    dobController = TextEditingController();
    passwordController = TextEditingController();
    firstnameField = FocusNode();
    lastnameField = FocusNode();
    emailField = FocusNode();
    phoneField = FocusNode();
    dobField = FocusNode();
    passwordFeild = FocusNode();

    // late GlobalKey<FormState> _formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Registration Page",
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              // autovalidateMode: _autoValidate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          controller: firstnameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: "Frist Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          // focusNode: firstnameField,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a First Name';
                            }
                            // Add more validation rules as needed
                            return null; // Return null to indicate no validation errors
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          controller: lastnameController,
                          textInputAction: TextInputAction.next,
                          inputFormatters: const [
                            // LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            labelText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          focusNode: lastnameField,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Last Name';
                            }
                            // Add more validation rules as needed
                            return null; // Return null to indicate no validation errors
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      //  keyboardType: TextInputType.number,
                      inputFormatters: const [
                        // LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        labelText: "E - mail",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      focusNode: emailField,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Email is Required !";
                        } else if (value!.isNotEmpty) {
                          if (value ==
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$') {
                            return "please enter valid format of email";
                          }
                          return null;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //  alignment: Alignment.topRight,
                    child: TextFormField(
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // FilteringTextInputFormatter.digitsOnly,
                        // LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        labelText: "Phone",
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      focusNode: phoneField,
                      validator: (value) {
                        String patttern = r'(^[0-9]*$)';
                        RegExp regExp = RegExp(patttern);
                        if (value!.length == 0) {
                          return "Mobile is Required !";
                        } else if (value.length != 10) {
                          return "Mobile number must 10 digits !";
                        } else if (!regExp.hasMatch(value)) {
                          return "Mobile Number must be digits !";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      obscureText: _obscureText,
                      controller: passwordController,
                      focusNode: passwordFeild,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        // Add more validation rules as needed
                        return null; // Return null to indicate no validation errors
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: dobController,
                    textInputAction: TextInputAction.next,
                    onTap: selectStartDate,
                    // readOnly: true,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      prefixIcon: const Icon(Icons.calendar_month),
                      labelText: "Birthday",
                      hintText: "DD-MM-YYYY",
                    ),
                    focusNode: dobField,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return "Date of Birth is Required !";
                      }
                      /*if (value?.isEmpty == true) {
                                    return AppLocalizations.of(context).valEnterUserName;
                                  }*/
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Gender",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: RadioListTile(
                          title: const Text('Male'),
                          value: 'Male',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: RadioListTile(
                          title: const Text('Female'),
                          value: 'Female',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xff4D80FF),
                          Color(0xff4FB7FF),
                          // Colors.green,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => HomePage()),
                            ),
                          );
                        } else {
                          setState(() {
                            _autoValidate = AutovalidateMode.always;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 0.9, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child:
                          const Text("Submit", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
