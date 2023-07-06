import 'package:charlie/resources/images.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/elements/rounded_pucture.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x190a1646),
            offset: Offset(0, 3),
            blurRadius: 7,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0f0a1646),
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircularImage(
                defaultAsset: AppImages.menPlaceholder,
                width: 75.0,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Djamel Madani",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.male,
                          color: AppColors.appMain100,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "22 ans",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_history,
                          color: AppColors.appMain100,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "3276 Rue de L'Abbé-Migne, France",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
