import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import '../../../data/const/export.dart';

import 'nav_bar_style.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final controller = Get.put(BottomNavController());

  // List items = [
  //   BottomBarItem(iconData: Icons.dashboard),
  //   BottomBarItem(iconData: Icons.schedule_outlined),
  //   BottomBarItem(iconData: Icons.location_on_rounded),
  //   BottomBarItem(iconData: Icons.account_circle),
  // ];
  // final List<Widget> bottomBarPages = [
  //   DashboardScreenView(),
  //   ScheduleScreenView(),
  //   const MapScreenView(),
  //   ProfileScreenView(),
  // ];
  List items = [
    BottomNavyBarItem(
        icon: const Icon(Icons.dashboard),
        title: const Text("Dashboard", style: bottomNavBarTextStyle)),
    BottomNavyBarItem(
        icon: const Icon(Icons.schedule_outlined),
        title: const Text("Schedule", style: bottomNavBarTextStyle)),
    BottomNavyBarItem(
        icon: const Icon(Icons.location_on_rounded),
        title: const Text("Location", style: bottomNavBarTextStyle)),
    BottomNavyBarItem(
        icon: const Icon(Icons.account_circle),
        title: const Text("Account", style: bottomNavBarTextStyle))
  ];
  final List<Widget> bottomBarPages = [
    DashboardScreenView(),
    ScheduleScreenView(),
    const MapScreenView(),
    ProfileScreenView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavController>(
          builder: (_) => bottomBarPages[controller.selectedIndex]),
      extendBody: true,
      bottomNavigationBar: GetBuilder<BottomNavController>(
        builder: (_) => BottomNavyBar(
            // color: const Color.fromARGB(255, 0, 80, 138)
            backgroundColor: AppColor.kWhiteColor,
            selectedIndex: controller.selectedIndex,
            items: List.generate(items.length, (index) => items[index]),
            onItemSelected: (index) {
              controller.selectIndex(index);
              // print(index.toString() + "aa");
            }),
      ),
    );
  }
}
