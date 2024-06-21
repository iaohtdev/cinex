import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerMovie extends StatelessWidget {
  const ShimmerMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppConstants.height10,
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 3,
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 15),
                child: AppShimmer(
                  height: 100,
                  width: 130,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
