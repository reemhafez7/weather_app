import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300!,
      highlightColor: Colors.grey.shade200!,
      child: Container(
        color: Colors.grey.shade200,
        height: 186,
        width: (MediaQuery.of(context).size.width - 40) / 3,
      ),
    );
  }
}
