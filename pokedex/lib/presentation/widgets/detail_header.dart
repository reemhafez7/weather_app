import 'package:flutter/material.dart';

import 'package:pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:pokedex/utils/utils.dart';

class PokemonDetailHeader extends StatelessWidget {
  final PokemonDetailEntity pokemonDetailEntity;
  const PokemonDetailHeader({
    Key? key,
    required this.pokemonDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.green[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    Text(
                      Utils.capitalize(pokemonDetailEntity.name.toString()),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      pokemonDetailEntity.speciesTypes
                          .map((t) => Utils.capitalize(t))
                          .join(', '),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Text(
                  '#${pokemonDetailEntity.id.toString()}',
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(
                'assets/icons/seconde.png',
                height: 178,
              ),
              Image.network(
                pokemonDetailEntity.imageUrl,
                height: 125,
                width: 136,
              ),
            ],
          )
        ],
      ),
    );
  }
}
