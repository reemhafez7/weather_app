import 'package:flutter/material.dart';


class HomeScreenAppBarTitle extends StatelessWidget {
  const HomeScreenAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/pokeballIcon',
          height: 24,
          width: 24,
        ),
        const SizedBox(width: 8),
        const Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}