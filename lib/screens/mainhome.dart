import 'dart:async';
import 'package:billable/screens/budget_screen/budget_screen.dart';
import 'package:flutter/cupertino.dart';


import 'package:billable/screens/Home.dart';
import 'package:billable/screens/subscription/subscrption.dart';
import 'package:billable/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainHome extends StatefulWidget {
  static const String route = '/user_home_screen';

  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<MainHome> {
 PersistentTabController? tabController;
  int selectedIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  void onItemCLicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    tabController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        
        iconSize: 30,
        icon: Icon(Icons.dashboard),
        // SvgPicture.asset(
        //   'assets/dashboard.svg',
        //   color: Colors.black,
        //   height: 35.h,
        //   width: 35.w,
        //   fit:BoxFit.contain ,
        // ),
        title: ("Dashboard"),
        activeColorPrimary: kprimarycolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:Icon(Icons.subscriptions),
        //  SvgPicture.asset(
        //   'assets/subscription.svg',
        //   color: Colors.black,
        //   height: 30.h,
        //   width: 30.w,
        // ),
        title: ("Subscription"),
        activeColorPrimary: kprimarycolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.flag),
        // SvgPicture.asset(
        //   'assets/budget.svg',
        //   color: Colors.black,
        //   height: 35.h,
        //   width: 35.w,
        // ),
        title: ("Budget"),
        activeColorPrimary: kprimarycolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:Icon(Icons.person),
        //  SvgPicture.asset(
        //   'assets/user.svg',
        //   color: Colors.black,
        //   height: 30.h,
        //   width: 30.w,
        // ),
        title: ("Account"),
        activeColorPrimary: kprimarycolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> screens = [
    HomePage(),
   const Subscription(),
    const BudgetScreen(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PersistentTabView(
      context,
      controller: tabController,
      screens: screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.

      //   body: TabBarView(
      //     physics: const NeverScrollableScrollPhysics(),
      //     controller: tabController,
      //     children: [
      //       HomePage(),
      //       Subscription(),
      //       HomePage(),
      //       HomePage(),
      //     ],
      //   ),
      //   bottomNavigationBar: CurvedNavigationBar(
      //     key: _bottomNavigationKey,
      //     index: selectedIndex,
      //     height: 60,
      //     items: <Widget>[
      //       SvgPicture.asset(
      //         'assets/dashboard.svg',
      //         color: Colors.black,
      //         height: 30.h,
      //         width: 30.w,
      //       ),
      //       SvgPicture.asset(
      //         'assets/subscription.svg',
      //         color: Colors.black,
      //         height: 30.h,
      //         width: 30.w,
      //       ),
      //       SvgPicture.asset(
      //         'assets/budget.svg',
      //         color: Colors.black,
      //         height: 30.h,
      //         width: 30.w,
      //       ),
      //       SvgPicture.asset(
      //         'assets/user.svg',
      //         color: Colors.black,
      //         height: 30.h,
      //         width: 30.w,
      //       ),
      //     ],
      //     color: Colors.white,
      //     buttonBackgroundColor: kwhite,
      //     backgroundColor: Color(0xffBACFFF).withOpacity(.5),
      //     animationCurve: Curves.easeInOut,
      //     animationDuration: Duration(milliseconds: 300),
      //     onTap: onItemCLicked,
      //     letIndexChange: (index) => true,
      //   ),
    );
  }
}
