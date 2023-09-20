import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/dataitems_constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FoodsPage extends StatefulWidget {
  const FoodsPage({super.key});

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _isSearching = false;
      FocusScope.of(context).unfocus(); // Hide the keyboard
    });
  }

  int _selectedIndex = 0; // Khai báo và khởi tạo mặc định
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Món ăn yêu thích",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.text),
            ),
            Text(
              "của bạn là gì nhỉ ?",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.text),
            ),
            SizedBox(
              height: 4,
            ),
            //,
            SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.subColorText),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('65 món ăn'),
                    TyperAnimatedText('65 món ăn có sẵn trên'),
                    TyperAnimatedText('65 món ăn có sẵn trên ứng dụng !!'),
                  ],
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50, // Set the desired height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: ColorPalette.text,
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.search,
                    size: 30,
                    color: ColorPalette.primaryColor, // Change icon color
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style:
                          TextStyle(color: Colors.black), // Change text color
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm ...',
                        hintStyle: TextStyle(
                            color: ColorPalette
                                .subColorText), // Change hint text color
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: _clearSearch, // Use the clear function
                    color: ColorPalette.subColorText, // Change icon color
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
