import 'package:flutter/material.dart';
import 'package:petology_web/Widgets/footer.dart';
import 'package:petology_web/Widgets/navBar.dart';

// ignore: must_be_immutable
class HelpScreen extends StatefulWidget {
  const HelpScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  String? dropdownvalue = '';

  TextEditingController phoneTextController = TextEditingController();

  TextEditingController locationTextController = TextEditingController();

  var items = [
    'Pet',
    'Dog',
    'Cat',
    'Toto',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomNavBar(
                isTransparent: false,
              ),
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
                                "Help your friend",
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
                              customDropDown(
                                "Category",
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(
                                      8.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        color: const Color(
                                          0xff492f24,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: const [
                                              Text(
                                                "Send",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
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
                                      child: Card(
                                        color: const Color(
                                          0xffffe3c5,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: const [
                                              Text(
                                                "Call",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 15.0,
                                      top: 8,
                                    ),
                                    child: InkWell(
                                      child: Text(
                                        "Forget password ?",
                                      ),
                                    ),
                                  ),
                                ],
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
            onChanged: (value) {},
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
            items: items.map(
              (items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
