import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.2 -27,
                decoration:const BoxDecoration(color: kPrimaryColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
