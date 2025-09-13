import 'package:coderoof_assignment/Utils/app_colors.dart';
import 'package:coderoof_assignment/Utils/app_text_styles.dart';
import 'package:coderoof_assignment/Utils/image_assets.dart';
import 'package:coderoof_assignment/Utils/app_routes.dart';
import 'package:coderoof_assignment/Widgets/common_bottom_navbar.dart';
import 'package:coderoof_assignment/Widgets/homepage_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomepageLogic(),
      child: const _HomepageView(),
    );
  }
}

class _HomepageView extends StatelessWidget {
  const _HomepageView();

  @override
  Widget build(BuildContext context) {
    final logic = context.watch<HomepageLogic>();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text("Mixer", style: AppTextStyles.mixerHead(width)),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.subscription);
            },
            child: Image.asset(ImageAssets.flashCircle, width: width * 0.06),
          ),
          SizedBox(width: width * 0.04),
          Image.asset(ImageAssets.notification, width: width * 0.06),
          SizedBox(width: width * 0.04),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Filters Row
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.015,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.012,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.filtersBG,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageAssets.filtersIcon,
                              width: width * 0.05),
                          SizedBox(width: width * 0.02),
                          Text("Filters",
                              style: AppTextStyles.filterText(
                                  width, color: AppColors.primary)),
                        ],
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    _filterChip("Age", width, height, logic),
                    SizedBox(width: width * 0.01),
                    _filterChip("Height", width, height, logic),
                    SizedBox(width: width * 0.01),
                    _filterChip("Habits", width, height, logic),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.1),

            // 🔹 Center avatars
            Image.asset(
              ImageAssets.avatarGroup,
              width: width * 0.5,
            ),

            SizedBox(height: height * 0.03),

            // 🔹 Heading
            Text(
              logic.anyFilterSelected
                  ? "You’ve seen them all"
                  : "You’ve seen everyone nearby",
              style: AppTextStyles.seenNearby(width),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: height * 0.015),

            // 🔹 Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                "No more profiles in your area. Check back later or expand your location to see more people.",
                style: AppTextStyles.normal(width),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: height * 0.04),

            // 🔹 Adjust Location Button
            GestureDetector(
              onTap: () => logic.handleAdjustLocation(context),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.018,
                  horizontal: width * 0.18,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(39),
                ),
                child: Text(
                  "Adjust Location",
                  style: AppTextStyles.continueButtonText(width),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNavbar(),
    );
  }

  Widget _filterChip(
      String label, double width, double height, HomepageLogic logic) {
    final isSelected = logic.selectedFilters[label] ?? false;

    return GestureDetector(
      onTap: () => logic.toggleFilter(label),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.012,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.secondary
              : AppColors.filtersOptionsBG,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.filterText(
                width,
                color: isSelected ? AppColors.primary : AppColors.gray600,
              ),
            ),
            SizedBox(width: width * 0.01),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: width * 0.05,
              color: AppColors.gray600,
            ),
          ],
        ),
      ),
    );
  }
}
