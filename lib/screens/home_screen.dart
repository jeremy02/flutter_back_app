import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_back_app/widgets/category_dropdown_menu.dart';
import 'package:flutter_back_app/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
	@override
	_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
	
	List<String> listCategories = ["Bags", "Shoes", "Jackets"];
	TabController _tabController;
	
	int _activeTabIndex = 1;
	
	@override
	void initState() {
		super.initState();
		_tabController = TabController(
			vsync: this,
			length: 6,
		);
		
		// within your initState() method
		_tabController.addListener(_setActiveTabIndex);
	}
	
	void _setActiveTabIndex() {
		setState(() {
			_activeTabIndex = _tabController.index;
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Container(
				margin: EdgeInsets.symmetric(horizontal: 16.0,),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisSize: MainAxisSize.max,
					children: <Widget>[
						SizedBox(height: 40,),
						PreferredSize(
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									Expanded(
										child: CategoryDropMenu(),
									),
									Stack(
										children: <Widget>[
											Image.asset(
												"assets/images/shopping_bag.png",
												width: 30,
												height: 22,
												fit: BoxFit.contain,
											),
											Positioned(
												top: 0,
												right: 0,
												child: Container(
													padding: EdgeInsets.all(1),
													decoration: new BoxDecoration(
														color: Colors.orange,
														borderRadius: BorderRadius.circular(8),
													),
													constraints: BoxConstraints(
														minWidth: 12,
														minHeight: 12,
													),
												),
											)
										],
									),
									SizedBox(width: 10.0,),
									Icon(
										Icons.search,
										size: 30,
										color: Colors.black,
									),
								],
							),
							preferredSize: Size(
								MediaQuery.of(context).size.width,
								60,
							),
						),
						SizedBox(height: 30,),
						TabBar(
							controller: _tabController,
							indicatorSize: TabBarIndicatorSize.label,
							isScrollable: true,
							indicatorColor: Colors.transparent,
							labelPadding: EdgeInsets.all(4.0),
							indicatorWeight: 1.0,
							indicatorPadding: EdgeInsets.all(0),
							tabs: createTabs(),
						),
					],
				),
			),
		);
	}
	
	// the tabs to show
	List<Widget> createTabs() {
		return List<Widget>.generate(listCategories.length, (int index){
			return Container(
				padding: EdgeInsets.only(right: 30.0),
				child: Column(
					mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						Text(
							listCategories[index],
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize: 26.0,
								color: _activeTabIndex == index ? Colors.blue.shade400 : Colors.grey.shade400,
							),
						),
						SizedBox(height: 8.0,),
						Container(
							width: 8.0,
							height: 8.0,
							decoration: BoxDecoration(
								color: _activeTabIndex == index ? Colors.blueAccent : Colors.transparent,
								borderRadius: BorderRadius.circular(30.0),
							),
						),
					],
				)
			);
		});
	}
	
	@override
	void dispose() {
		super.dispose();
		_tabController.dispose();
	}
}
