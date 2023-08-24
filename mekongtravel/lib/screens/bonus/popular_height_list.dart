import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/dataitems_constants.dart';

class PopularHList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true, // Để ngăn nó cố định và không cuộn theo
            physics:
                NeverScrollableScrollPhysics(), // Để ngăn cuộn của GridView
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 14,
              childAspectRatio: 311 / 130,
            ),
            itemCount: HPOPULAR_DATA.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(bottom: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Image.asset(
                        HPOPULAR_DATA[index]["image"] ?? '',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                HPOPULAR_DATA[index]["name"] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: ColorPalette.text,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                HPOPULAR_DATA[index]["distance"] ?? '',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorPalette.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.7),
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Row(
                            children: [
                              Text(
                                HPOPULAR_DATA[index]["star"] ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
