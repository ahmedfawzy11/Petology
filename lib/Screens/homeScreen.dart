import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_web/Bloc/homeCubit/homeCubit.dart';
import 'package:petology_web/Bloc/homeCubit/homeStates.dart';
import 'package:petology_web/Models/categoryModel.dart';
import 'package:petology_web/Widgets/customRadio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Explore',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final List _isHovering = [
    false,
    false,
    false,
    false,
  ];
  List pets = [];

  CarouselController carouselController = CarouselController();

  ScrollController scrollController = ScrollController();

  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(
      context,
    ).size;
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
    return BlocProvider(
      lazy: false,
      create: (
        BuildContext context,
      ) =>
          HomeCubit()
            ..getHomeFirstSectionsData(
              context,
            )
            ..getHomeSecondSectionsData(
              context,
            )
            ..getHomePetsData(
              context,
            )
            ..getHomeFooterData(
              context,
            ),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (
          BuildContext context,
          state,
        ) {},
        builder: (
          BuildContext context,
          Object? state,
        ) {
          HomeCubit myCubit = HomeCubit.get(
            context,
          );
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: Size(
                screenSize.width,
                1000,
              ),
              child: Container(
                color: const Color.fromRGBO(
                  0,
                  0,
                  0,
                  0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Petology',
                        style: TextStyle(
                          fontFamily: "arial",
                          fontSize: 20,
                          color: Color.fromRGBO(
                            255,
                            227,
                            197,
                            1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onHover: (
                                value,
                              ) {
                                value
                                    ? _isHovering[0] = true
                                    : _isHovering[0] = false;
                              },
                              onTap: () {},
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'About us',
                                    style: TextStyle(
                                      color: _isHovering[0]
                                          ? Colors.white
                                          : Colors.white,
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
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 20,
                            ),
                            InkWell(
                              onHover: (value) {
                                value
                                    ? _isHovering[1] = true
                                    : _isHovering[1] = false;
                              },
                              onTap: () {},
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                      color: _isHovering[1]
                                          ? Colors.white
                                          : Colors.white,
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
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 20,
                            ),
                            InkWell(
                              onHover: (value) {
                                value
                                    ? _isHovering[2] = true
                                    : _isHovering[2] = false;
                              },
                              onTap: () {},
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Services',
                                    style: TextStyle(
                                      color: _isHovering[2]
                                          ? Colors.white
                                          : Colors.white,
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
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 20,
                            ),
                            InkWell(
                              onHover: (value) {
                                value
                                    ? _isHovering[3] = true
                                    : _isHovering[3] = false;
                              },
                              onTap: () {},
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Request',
                                    style: TextStyle(
                                      color: _isHovering[3]
                                          ? Colors.white
                                          : Colors.white,
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
                                  )
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
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
            ),
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                condition: myCubit.firstSectionData != null &&
                    myCubit.secondSectionData != null &&
                    myCubit.footerData != null,
                builder: (
                  context,
                ) =>
                    Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 700,
                          width: screenSize.width,
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
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                100,
                                150,
                                0,
                                0,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 450,
                                    height: 120,
                                    child: Text(
                                      myCubit
                                          .firstSectionData!.titleFirstSection,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 450,
                                    height: 350,
                                    child: Text(
                                      myCubit
                                          .firstSectionData!.bodyFirstSection,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                100,
                                0,
                                0,
                                0,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: screenSize.width / 2,
                                  ),
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      SizedBox(
                                        width: 700,
                                        height: 300,
                                        child: Image.asset(
                                          "whitepack.png",
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 75,
                                        child: Container(
                                          color: Colors.transparent,
                                          height: 75,
                                          width: 200,
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 10,
                                            borderRadius: BorderRadius.circular(
                                              250,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          30,
                                        ),
                                        child: SizedBox(
                                          width: 500,
                                          height: 500,
                                          child: Image.asset(
                                            "pop.png",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 700,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: screenSize.width / 2,
                                      ),
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          SizedBox(
                                            width: 700,
                                            height: 300,
                                            child: Image.asset(
                                              "whitepack.png",
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 75,
                                            child: Container(
                                              color: Colors.transparent,
                                              height: 75,
                                              width: 200,
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 10,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  250,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              50,
                                            ),
                                            child: SizedBox(
                                              width: 500,
                                              height: 500,
                                              child: Image.asset(
                                                "dog.png",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  100,
                                  150,
                                  0,
                                  0,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 450,
                                      height: 100,
                                      child: Text(
                                        myCubit.secondSectionData!.title,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Stack(
                                      children: [
                                        Positioned(
                                          right: 50,
                                          child: SizedBox(
                                            width: 350,
                                            height: 350,
                                            child: Image.asset(
                                              "doghand.png",
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 450,
                                          height: 350,
                                          child: Text(
                                            myCubit.secondSectionData!.body,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      height: 500,
                      width: screenSize.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Stack(
                            children: [
                              Positioned(
                                right: 50,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    "doghand.png",
                                  ),
                                ),
                              ),
                              const Text(
                                "Lets get this right ....",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "What kind of friend you looking for?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    30,
                                    0,
                                    0,
                                  ),
                                  child: SizedBox(
                                    height: 10,
                                  ),
                                ),
                                InkWell(
                                  splashColor: const Color(
                                    0xff1d162f,
                                  ),
                                  onTap: () {
                                    for (var profile in Profiles) {
                                      profile.isSelected = false;
                                    }
                                    Profiles[1].isSelected = true;
                                  },
                                  child: SizedBox(
                                    width: 180,
                                    height: 200,
                                    child: CustomRadio(
                                      Profiles[1],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 33,
                                ),
                                InkWell(
                                  splashColor: const Color(
                                    0xff1d162f,
                                  ),
                                  onTap: () {
                                    for (var profile in Profiles) {
                                      profile.isSelected = false;
                                    }
                                    Profiles[0].isSelected = true;
                                  },
                                  child: SizedBox(
                                    width: 180,
                                    height: 200,
                                    child: CustomRadio(
                                      Profiles[0],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: const Color.fromRGBO(
                        241,
                        241,
                        241,
                        1,
                      ),
                      height: 500,
                      width: screenSize.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Stack(
                            children: [
                              Positioned(
                                right: 50,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    "doghand.png",
                                  ),
                                ),
                              ),
                              const Text(
                                "Our friends who looking for a house",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    child: Card(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                          8.0,
                                        ),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CarouselSlider.builder(
                                      itemBuilder: (
                                        context,
                                        index,
                                        realIndex,
                                      ) {
                                        int first = index * 3;
                                        int second = first + 1;
                                        int third = second + 1;
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [first, second, third].map((
                                            e,
                                          ) {
                                            return petCard(e);
                                          }).toList(),
                                        );
                                      },
                                      itemCount: 3,
                                      options: CarouselOptions(
                                        autoPlay: false,
                                        aspectRatio: 3,
                                      ),
                                      carouselController: carouselController,
                                    ),
                                  ),
                                  InkWell(
                                    child: Card(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                          8.0,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 75,
                            child: const Card(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 500,
                      width: screenSize.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Stack(
                            children: [
                              Positioned(
                                right: 50,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    "doghand.png",
                                  ),
                                ),
                              ),
                              const Text(
                                "How to take care of your friends? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      width: screenSize.width,
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
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      right: 10,
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          "doghand.png",
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "For any questions",
                                      style: TextStyle(
                                        color: Color.fromRGBO(
                                          255,
                                          227,
                                          197,
                                          1,
                                        ),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/337/600',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                      ),
                                      child: Text(
                                        myCubit.footerData!.email,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(
                                            255,
                                            227,
                                            197,
                                            1,
                                          ),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/337/600',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                      ),
                                      child: Text(
                                        myCubit.footerData!.phone,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(
                                            255,
                                            227,
                                            197,
                                            1,
                                          ),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      right: 10,
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          "doghand.png",
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "For any questions",
                                      style: TextStyle(
                                        color: Color.fromRGBO(
                                          255,
                                          227,
                                          197,
                                          1,
                                        ),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/337/600',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                      ),
                                      child: Text(
                                        myCubit.footerData!.location,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(
                                            255,
                                            227,
                                            197,
                                            1,
                                          ),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/337/600',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                      ),
                                      child: Text(
                                        myCubit.footerData!.location2,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(
                                            255,
                                            227,
                                            197,
                                            1,
                                          ),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      right: 10,
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          "doghand.png",
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "For any questions",
                                      style: TextStyle(
                                        color: Color.fromRGBO(
                                          255,
                                          227,
                                          197,
                                          1,
                                        ),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/337/600',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.0,
                                      ),
                                      child: Text(
                                        'ahmedmido_fawzy@yahoo.com',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                            255,
                                            227,
                                            197,
                                            1,
                                          ),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/337/600',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.0,
                                      ),
                                      child: Text(
                                        '(+2)0123456789',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                            255,
                                            227,
                                            197,
                                            1,
                                          ),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "Image",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                fallback: (
                  context,
                ) =>
                    const Center(
                  child: Text(
                    'No Data',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget petCard(
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          border: Border.all(
            width: 2,
          ),
        ),
        height: 260,
        width: 200,
        child: Column(
          children: [
            Image.asset(
              "dog.png",
              height: 200,
            ),
            Text(
              "Pet $index",
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.yellow,
                  ),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: const Text(
                  "Read More",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(
    String categoryName,
    String imageName,
  ) {
    return SizedBox(
      height: 200,
      width: 150,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "BrownCircle.png",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 50,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    imageName,
                    width: 100,
                    height: 100,
                  ),
                  Expanded(
                    child: Text(
                      categoryName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
