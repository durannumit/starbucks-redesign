import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:starbucks_redesign/pages/home/stars_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    StarsScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0,
          leadingWidth: 18,
          title: Text(
            "Starbucks",
            style: Theme.of(context).textTheme.headline2,
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icon/notification_bell_icon.svg',
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icon/three_dots_icon.svg',
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                selectedFontSize: 0,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icon/u_star.svg',
                        color: _selectedIndex == 0 ? AppColors.mainGreen : AppColors.grey,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icon/u_cup.svg',
                      color: _selectedIndex == 1 ? AppColors.mainGreen : AppColors.grey,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icon/u_credit-card.svg',
                        color: _selectedIndex == 2 ? AppColors.mainGreen : AppColors.grey,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icon/u_location-point.svg',
                        color: _selectedIndex == 3 ? AppColors.mainGreen : AppColors.grey,
                      ),
                      label: ''),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
              ),
            )));
  }
}
