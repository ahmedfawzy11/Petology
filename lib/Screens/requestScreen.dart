// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:petology_web/Widgets/footer.dart';

// ignore: must_be_immutable
class RequestScreen extends StatefulWidget {
  const RequestScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  String? dropdownvalue = '';

  TextEditingController nameTextController = TextEditingController();

  TextEditingController phoneTextController = TextEditingController();

  TextEditingController colorTextController = TextEditingController();

  TextEditingController locationTextController = TextEditingController();

  TextEditingController descriptionTextController = TextEditingController();

  var items = [
    'Pet',
    'Dog',
    'Cat',
    'Toto',
  ];

  final List _isHovering = [
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(
    BuildContext context,
  ) {
    var screenSize = MediaQuery.of(
      context,
    ).size;
    return MaterialApp(
      home: Scaffold(
        appBar: navBar(
          screenSize,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: screenSize.width,
                child: Stack(
                  children: [
                    Positioned(
                      right: 200,
                      top: 100,
                      child: Image.asset(
                        "doghand.png",
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Positioned(
                      left: 200,
                      bottom: 100,
                      child: Image.asset(
                        "doghand.png",
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(
                          50,
                        ),
                        width: 600,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Request",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.asset(
                                "loginDog.png",
                                height: 300,
                                width: 300,
                              ),
                              customTextField(
                                "Name",
                                nameTextController,
                              ),
                              customDropDown(
                                "Category",
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: customDropDown(
                                      "Year",
                                    ),
                                  ),
                                  Expanded(
                                    child: customDropDown(
                                      "Month",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: customDropDown(
                                      "Size",
                                    ),
                                  ),
                                  Expanded(
                                    child: customDropDown(
                                      "Breed",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: customDropDown(
                                      "Gender",
                                    ),
                                  ),
                                  Expanded(
                                    child: customDropDown(
                                      "Breed",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: customDropDown(
                                      "Hair Lenght",
                                    ),
                                  ),
                                  Expanded(
                                    child: customDropDown(
                                      "Care & Behavior",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: customDropDown(
                                      "House Trained",
                                    ),
                                  ),
                                  Expanded(
                                    child: customTextField(
                                      "Color",
                                      colorTextController,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  top: 20,
                                  bottom: 5,
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      "Detect your current location",
                                    ),
                                  ],
                                ),
                              ),
                              customTextField(
                                "Location",
                                locationTextController,
                                icon: const Icon(
                                  Icons.location_on,
                                ),
                                useIcon: true,
                              ),
                              customTextField(
                                "Phone number",
                                phoneTextController,
                              ),
                              SizedBox(
                                height: 100,
                                child: customTextField(
                                  "Description",
                                  descriptionTextController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Vaccinated (up to date)",
                                    ),
                                    Checkbox(
                                      value: false,
                                      onChanged: (
                                        value,
                                      ) {},
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  8.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 400,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    child: const Text(
                                      "Send",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  8.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 400,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xff492f24,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    child: const Text(
                                      "Send",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomFooter()
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField(
    String hint,
    TextEditingController controller, {
    Icon icon = const Icon(
      Icons.location_on,
    ),
    bool useIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextField(
            onChanged: (
              value,
            ) {},
            decoration: InputDecoration(
              suffixIcon: useIcon ? icon : null,
              hintStyle: const TextStyle(
                fontSize: 13,
              ),
              hintText: hint,
              border: InputBorder.none,
            ),
            controller: controller,
          ),
        ),
      ),
    );
  }

  Widget customDropDown(
    String hint,
  ) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: DropdownButton(
            underline: const SizedBox(),
            hint: Text(
              hint,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            isExpanded: true,
            onChanged: (
              String? newValue,
            ) {
              dropdownvalue = newValue;
            },
            items: items.map((
              items,
            ) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  PreferredSize navBar(
    Size screenSize,
  ) {
    return PreferredSize(
      preferredSize: Size(
        screenSize.width,
        1000,
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(
              103,
              71,
              57,
              1,
            ),
            Color.fromRGBO(
              24,
              7,
              1,
              1,
            ),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Row(
            children: [
              Image.asset(
                "Logo.png",
                height: 35,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onHover: (value) {
                        _isHovering[0] = value;
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'About us',
                            style: TextStyle(
                              color:
                                  _isHovering[0] ? Colors.white : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: const Color.fromRGBO(
                                255,
                                227,
                                197,
                                1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                      onHover: (
                        value,
                      ) {
                        _isHovering[1] = value;
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color:
                                  _isHovering[1] ? Colors.white : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: const Color.fromRGBO(
                                255,
                                227,
                                197,
                                1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                      onHover: (
                        value,
                      ) {
                        _isHovering[2] = value;
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Services',
                            style: TextStyle(
                              color:
                                  _isHovering[2] ? Colors.white : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: const Color.fromRGBO(
                                255,
                                227,
                                197,
                                1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                      onHover: (value) {
                        _isHovering[3] = value;
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Request',
                            style: TextStyle(
                              color:
                                  _isHovering[3] ? Colors.white : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: const Color.fromRGBO(
                                255,
                                227,
                                197,
                                1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 5,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(
                          225,
                          225,
                          225,
                          0.5,
                        ),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
