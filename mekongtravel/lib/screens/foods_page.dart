import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/dataitems_constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mekongtravel/screens/bonus/foods_popularColumnList.dart';
import 'package:mekongtravel/screens/bonus/foods_popularRowList.dart';
import 'package:mekongtravel/screens/home_page.dart';
import 'package:mekongtravel/screens/locations_page.dart';
import 'package:mekongtravel/screens/settings.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './sign_in.dart';

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

  int _selectedIndex = 2; // Khai báo và khởi tạo mặc định
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: SingleChildScrollView(
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
                            TyperAnimatedText(
                                '65 món ăn có sẵn trên ứng dụng !!'),
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
                            color:
                                ColorPalette.primaryColor, // Change icon color
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: TextStyle(
                                  color: Colors.black), // Change text color
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
                            color:
                                ColorPalette.subColorText, // Change icon color
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          8), // Đặt giá trị BorderRadius theo ý muốn
                      child: Container(
                        width: double.infinity,
                        height: 142,
                        child: ImageSlideshow(
                          // Các thuộc tính khác của ImageSlideshow
                          initialPage: 0,
                          indicatorColor: Colors.blue,
                          indicatorBackgroundColor: Colors.grey,
                          children: [
                            Image.asset(
                              'assets/images/foods/banhtetbanner.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/foods/bunnuocleo.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/foods/hutieu.png',
                              fit: BoxFit.cover,
                            ),
                          ],
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 3000,
                          isLoop: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      'Tỉnh thành',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.text),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    FoodsPLocationList(),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Món ăn nổi bật',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.text),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    FoodsColumnList(),
                  ],
                ),
              ))),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavyBar(
          backgroundColor: Color(0xFF263238),
          selectedIndex: _selectedIndex,
          showElevation: false,
          containerHeight: 72,
          onItemSelected: (index) {
            if (index != _selectedIndex) {
              setState(() {
                _selectedIndex = index;
                // Xử lý sự kiện khi các item được nhấp vào
                if (index == 0) {
                  // Xử lý sự kiện khi Trang chủ được nhấp vào
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomePage(), // Thay thế bằng màn hình Trang chủ thực tế
                    ),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LocationsPage(), // Thay thế bằng màn hình Trang chủ thực tế
                    ),
                  );
                } else if (index == 2) {
                  // Xử lý sự kiện khi Ẩm thực được nhấp vào
                } else if (index == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Settings(), // Thay thế bằng màn hình Trang chủ thực tế
                    ),
                  );
                  // Xử lý sự kiện khi Cài đặt được nhấp vào
                }
              });
            }
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Trang chủ'),
              activeColor: ColorPalette.text,
              inactiveColor: ColorPalette.primaryColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.gps_fixed),
              title: Text('Vị trí'),
              activeColor: ColorPalette.text,
              inactiveColor: ColorPalette.primaryColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.restaurant),
              title: Text('Ẩm thực'),
              activeColor: ColorPalette.text,
              inactiveColor: ColorPalette.primaryColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Cài đặt'),
              activeColor: ColorPalette.text,
              inactiveColor: ColorPalette.primaryColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
