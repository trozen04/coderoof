import 'package:coderoof_assignment/Utils/image_assets.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int selectedPlan = 0; // 0 = Mixer, 1 = VIP

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Theme colors depend on selected plan
    final bool isVip = selectedPlan == 1;
    final Color accentColor = isVip ? AppColors.gold : AppColors.primary;
    final Gradient buttonGradient = LinearGradient(
      colors: isVip
          ? [AppColors.goldGradientStart2, AppColors.goldGradientStart1]
          : [AppColors.pinkGradientEnd, AppColors.pinkGradientStart],
      stops: const [1.0, 1.0],
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mixer", style: AppTextStyles.mixerHead(width)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: width * 0.05, color: AppColors.gray400,)
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              Text("Level Up Your Mixer Experience", style: AppTextStyles.heading(width).copyWith(color: accentColor)),

              SizedBox(height: height * 0.05),

              Text("Select a plan", style: AppTextStyles.normal(width)),

              SizedBox(height: height * 0.02),

              // Plans
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedPlan = 0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: height * 0.2), // 🔹 equal height
                        child: Container(
                          padding: EdgeInsets.all(width * 0.04),
                          decoration: BoxDecoration(
                            color: AppColors.boxColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: selectedPlan == 0 ? AppColors.mixerBorder.withOpacity(0.31) : AppColors.grey,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Mixer", style: AppTextStyles.subHeading(width)),
                                      Image.asset(ImageAssets.mixerIcon, width: width * 0.1 ,)
                                    ],
                                  ),
                                  SizedBox(height: height * 0.005),
                                  Text("\$24.99", style: AppTextStyles.planPrice(width)),
                                ],
                              ),

                              Text(
                                "All of the below",
                                style: AppTextStyles.planDetails(width),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedPlan = 1),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: height * 0.2), // 🔹 equal height
                        child: Container(
                          padding: EdgeInsets.all(width * 0.04),
                          decoration: BoxDecoration(
                            color: selectedPlan == 1 ? AppColors.mixerVipDetailsBG : AppColors.boxColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: selectedPlan == 1 ? AppColors.mixerVipDetails : AppColors.grey,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Mixer VIP", style: AppTextStyles.subHeading(width)),
                                      Image.asset(ImageAssets.mixerIconVip, width: width * 0.1 ,)
                                    ],
                                  ),
                                  SizedBox(height: height * 0.005),
                                  Text("\$99.99", style: AppTextStyles.planPrice(width, isVip: true)),
                                ],
                              ),
                              Text(
                                "Mixer + VIP seating,\nfood & beverages",
                                textAlign: TextAlign.start,
                                style: AppTextStyles.planDetails(width),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.07),

            // Features Box
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Main container
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isVip ? AppColors.mixerVipDetails : AppColors.mixerDetails,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.03),
                      _feature("Unlimited Likes", width, height, accentColor),
                      _feature("See who liked you", width, height, accentColor),
                      _feature("Find people with wide range", width, height, accentColor),
                      _feature("Access to events", width, height, accentColor),
                      if (isVip)
                        _feature("VIP seating, food & beverages",
                            width, height, accentColor),
                    ],
                  ),
                ),

                // Top pill label
                Positioned(
                  top: -height * 0.015,
                  left: width * 0.2,
                  right: width * 0.2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isVip ? AppColors.mixerVipDetails : AppColors.mixerDetails,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Included with Mixer VIP",
                      style: AppTextStyles.includedText(width),
                    ),
                  ),
                ),
              ],
            ),


            Spacer(),

              // Continue button
              GestureDetector(
                onTap: () {
                  // Handle action
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.07),
                    gradient: buttonGradient,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageAssets.mixerIconWhite, width: width * 0.07),
                      SizedBox(width: width * 0.02),
                      Text(
                        "Continue – ${isVip ? "\$99.99" : "\$24.99"} total",
                        style: AppTextStyles.continueButtonText(width),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.015),

              Center(
                child: Text(
                  "By continuing, you agree to be charged, with auto-renewal until canceled\nin App Store settings, under Mixer’s Terms.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.descriptionText(width),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _feature(String text, double width, double height, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: Row(
        children: [
          Icon(Icons.check, color: color, size: width * 0.045),
          SizedBox(width: width * 0.02),
          Text(text, style: AppTextStyles.planDetails(width)),
        ],
      ),
    );
  }
}
