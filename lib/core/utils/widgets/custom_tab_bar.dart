import 'package:flutter/material.dart';

import '../constants/colors/app_colors.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<Tab> tabs;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabs,
      physics: const BouncingScrollPhysics(),
      indicatorColor: AppColors.appMainColor,
      labelColor: AppColors.appMainColor,
      unselectedLabelColor: AppColors.appGrey7d7d,
      dividerColor: AppColors.appGreyDada,
      dividerHeight: 3,
      labelPadding: const EdgeInsetsDirectional.only(bottom: 5),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          width: 4,
          color: AppColors.appMainColor,
        ),
      ),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: "cairo",
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: "cairo",
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
