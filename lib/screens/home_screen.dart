import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_back_app/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
	@override
	_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	
	int currentIndex = 0;
	
	@override
	void initState() {
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white,
			body: Container(
				decoration: BoxDecoration(
					color: Colors.pinkAccent,
				),
			),
			bottomNavigationBar: CustomBottomNavBar(
				containerColor: Colors.blue.shade600,
				selectedColor: Colors.white.withOpacity(0.25),
				selectedIndex: currentIndex,
				showElevation: true,
				onItemSelected: (index) => setState(() {
					currentIndex = index;
				}),
				items: [
					CustomBottomNavBarItem(
						icon: Icon(Icons.home),
						title: Text('Home'),
						activeColor: Colors.black.withOpacity(0.5),
					),
					CustomBottomNavBarItem(
						icon: Icon(Icons.message),
						title: Text('Messages'),
						activeColor: Colors.black.withOpacity(0.5),
					),
					CustomBottomNavBarItem(
						icon: Icon(Icons.thumb_up),
						title: Text('Wish List'),
						activeColor: Colors.black.withOpacity(0.5),
					),
					CustomBottomNavBarItem(
						icon: Icon(Icons.person),
						title: Text('Profile'),
						activeColor: Colors.black.withOpacity(0.5),
					),
				],
			),
		);
	}
}
