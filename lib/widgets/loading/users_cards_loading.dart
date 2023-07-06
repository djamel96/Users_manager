import 'package:charlie/utils/constants.dart';
import 'package:flutter/material.dart';
import 'elements/shimmer_line_item.dart';
import 'shimmer_loading.dart';

class UsersCardsLoading extends StatelessWidget {
  final double height;
  final double? width;
  const UsersCardsLoading(
      {super.key, this.height = userCardHeight, this.width});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: List.generate(
              10,
              (index) => Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: height,
                  width: width ?? double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Container(
                            width: userPictureCardSize,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              ShimmerLineItem(
                                width: double.infinity,
                                height: 20,
                              ),
                              ShimmerLineItem(
                                width: 120,
                              ),
                              ShimmerLineItem(
                                width: 200,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}
