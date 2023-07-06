import 'package:flutter/material.dart';

class UserCardLoading extends StatelessWidget {
  final double height;
  final double? width;

  const UserCardLoading({Key? key, this.height = 120, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
      child: SizedBox(
          height: height,
          width: width ?? double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Container(
                    width: 70,
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
                    children: const [],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
