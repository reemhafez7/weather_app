import 'package:flutter/material.dart';


class HomeScreenAppBarTitle extends StatelessWidget {
  const HomeScreenAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/ball.png',
            height: 27,
            width: 27,
          ),
          const SizedBox(width: 8),
          const Text(
            'Pokedex',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
