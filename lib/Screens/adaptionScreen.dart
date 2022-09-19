import 'package:flutter/material.dart';
import 'package:petology_web/Models/categoryModel.dart';
import 'package:petology_web/Widgets/footer.dart';
import 'package:petology_web/Widgets/navBar.dart';

// ignore: must_be_immutable
class AdaptionScreen extends StatefulWidget {
  const AdaptionScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<AdaptionScreen> createState() => _AdaptionScreenState();
}

class _AdaptionScreenState extends State<AdaptionScreen> {
  String? dropdownvalue = '';

  var items = [
    'Pet',
    'Dog',
    'Cat',
    'Toto',
  ];

  List<Widget> pets = [];

  @override
  Widget build(
    BuildContext context,
  ) {
    var screenSize = MediaQuery.of(
      context,
    ).size;
    pets = [
      petCard(),
      petCard(),
      petCard(),
      petCard(),
      petCard(),
    ];

    // ignore: non_constant_identifier_names
    List<Profile> Profiles = [];
    Profiles.add(
      Profile(
        "Dogs",
        "ic_cat.png",
        false,
      ),
    );
    Profiles.add(
      Profile(
        "Cats",
        "ic_dog.png",
        false,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomNavBar(
              isTransparent: false,
            ),
            Stack(
              children: [
                Positioned(
                  left: 100,
                  top: 200,
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "doghand.png",
                  ),
                ),
                Positioned(
                  right: 100,
                  top: 350,
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "doghand.png",
                  ),
                ),
                Positioned(
                  top: 500,
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "doghand.png",
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 100,
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "doghand.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            filterSection(
                              "Breed",
                              screenSize.width / 7,
                            ),
                            filterSection(
                              "Age",
                              screenSize.width / 7,
                            ),
                            filterSection(
                              "Size",
                              screenSize.width / 7,
                            ),
                            filterSection(
                              "Good With",
                              screenSize.width / 7,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            filterSection(
                              "Gender",
                              screenSize.width / 7,
                            ),
                            filterSection(
                              "Color",
                              screenSize.width / 7,
                            ),
                            filterSection(
                              "Hair Lenght",
                              screenSize.width / 7,
                            ),
                            filterSection(
                              "Care & Behavior",
                              screenSize.width / 7,
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 450,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: pets.length >= 3 ? 3 : pets.length,
                              itemBuilder: (
                                context,
                                index,
                              ) {
                                return petCard();
                              },
                            ),
                          ),
                          Container(
                            height: pets.length - 3 > 0 ? 450 : 0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  pets.length - 3 > 0 ? pets.length - 3 : 0,
                              itemBuilder: (
                                context,
                                index,
                              ) {
                                return petCard();
                              },
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(
                          20.0,
                        ),
                        child: InkWell(
                          child: Text(
                            "Show More...",
                            style: TextStyle(
                              color: Color(
                                0xff492f24,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomFooter()
          ],
        ),
      ),
    );
  }

  Widget petCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 20,
      ),
      width: 300,
      decoration: BoxDecoration(
        color: const Color(
          0xffeaeaea,
        ),
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              "dog.png",
            ),
          ),
          const Text(
            "Name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(
                  0xff492f24,
                ),
                borderRadius: BorderRadius.circular(
                  25,
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
          const Text(
            "By User",
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget filterSection(
    String name,
    double width,
  ) {
    return Container(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            customDropDown()
          ],
        ),
      ),
    );
  }

  Widget customDropDown() {
    return Card(
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
    );
  }
}
