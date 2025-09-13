import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';
import '../Utils/image_assets.dart'; // Make sure this contains your image paths

class CommonBottomNavbar extends StatefulWidget {
  const CommonBottomNavbar({super.key});

  @override
  State<CommonBottomNavbar> createState() => _CommonBottomNavbarState();
}

class _CommonBottomNavbarState extends State<CommonBottomNavbar> {
  int _currentIndex = 0;

  // List of image paths instead of icons
  final List<String> _images = [
    ImageAssets.mixerNavBar,
    ImageAssets.mix,
    ImageAssets.events,
    ImageAssets.blindMix,
    ImageAssets.profile,
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top shadow
        Container(
          height: 6,
          width: double.infinity,
          color: AppColors.navBarShadow, // shadow color
        ),
        BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.gray600,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: width * 0.065,
          items: _images.map((imgPath) {
            int index = _images.indexOf(imgPath);
            return BottomNavigationBarItem(
              icon: Image.asset(
                imgPath,
                width: width * 0.085,
                height: width * 0.085,
                //currently not changing color due to no design in figma
              ),
              label: "",
            );
          }).toList(),
        ),
      ],
    );
  }
}
