import 'package:flutter/material.dart';
import 'package:flutter_back_app/models/bag_model.dart';
import 'package:flutter_back_app/screens/demo_screen.dart';
import 'package:flutter_back_app/screens/detail_screen.dart';
import 'package:flutter_back_app/screens/home_screen.dart';
import 'package:flutter_back_app/utils/custom_app_icons_icons.dart';
import 'package:flutter_back_app/widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
	@override
	_MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
	
	int currentIndex = 0;
	
	PageController pageController = PageController(
		initialPage: 0,
		keepPage: true,
	);
	
	@override
	void initState() {
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: PageView(
				controller: pageController,
				onPageChanged:(index)=> setState(() {
					currentIndex = index;
				}),
				children: <Widget>[
					HomeScreen(),
					DemoScreen(title: "Messages",),
					DetailScreen(
						bagDetail: bagsList[0]
					),
					DemoScreen(title: "Profile",),
				],
				pageSnapping: true,
				scrollDirection: Axis.horizontal,
			),
			bottomNavigationBar: CustomBottomNavBar(
				containerColor: Colors.blue.shade600,
				selectedColor: Colors.white.withOpacity(0.25),
				selectedIndex: currentIndex,
				showElevation: true,
				onItemSelected: (index) => setState(() {
					currentIndex = index;
					pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
				}),
				items: [
					CustomBottomNavBarItem(
						icon: Icon(CustomAppIcons.home),
						title: Text('Home'),
						activeColor: Colors.black.withOpacity(0.5),
						fontSize : 16,
					),
					CustomBottomNavBarItem(
						icon: Icon(CustomAppIcons.chat_bubble_outline),
						title: Text('Messages'),
						activeColor: Colors.black.withOpacity(0.5),
						fontSize : 16,
					),
					CustomBottomNavBarItem(
						icon: Icon(CustomAppIcons.heart_empty),
						title: Text('Wish List'),
						activeColor: Colors.black.withOpacity(0.5),
						fontSize : 16,
					),
					CustomBottomNavBarItem(
						icon: Icon(Icons.person),
						title: Text('Profile'),
						activeColor: Colors.black.withOpacity(0.5),
						fontSize : 16,
					),
				],
			),
		);
	}
	
	@override
	void dispose() {
		super.dispose();
		pageController.dispose();
	}
}
