import 'package:flutter/material.dart';
import 'package:petology_web/Models/category_model.dart';

// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  final Profile _profile;

  const CustomRadio(this._profile, {super.key});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(
        255,
        227,
        197,
        1,
      ),
      child: Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(
          5.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                widget._profile.icon,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget._profile.name,
              style: const TextStyle(
                color: Color.fromARGB(
                  73,
                  47,
                  36,
                  1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
