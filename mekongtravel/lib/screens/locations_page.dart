import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/screens/bonus/location_widget.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mekongtravel/screens/foods_page.dart';
import 'package:mekongtravel/screens/home_page.dart';

class LocationsPage extends StatefulWidget {
  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  int _selectedIndex = 1; // Đặt mặc định là index 1
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: LocationsItems(),
        ),
      ),
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
                  // Xử lý sự kiện khi Vị trí được nhấp vào
                  // Không cần thực hiện hành động vì bạn đang ở Vị trí
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FoodsPage(), // Thay thế bằng màn hình Trang chủ thực tế
                    ),
                  );
                  // Xử lý sự kiện khi Ẩm thực được nhấp vào
                } else if (index == 3) {
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
              icon: Icon(Icons.cloud),
              title: Text('Thời tiết'),
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
