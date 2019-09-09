import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
										child: _CategoryDropMenu(),
									),
									Icon(
										Icons.shopping_basket,
										size: 30,
										color: Colors.black,
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
						SizedBox(height: 20,),
						TabBar(
							controller: _tabController,
							isScrollable: true,
							indicatorSize: TabBarIndicatorSize.label,
							indicatorColor: Colors.transparent,
							labelPadding: EdgeInsets.all(4.0),
							indicatorWeight: 1.0,
							indicatorPadding: EdgeInsets.all(0),
							tabs: List<Widget>.generate(listCategories.length, (int index){
								return Container(
									margin: EdgeInsets.only(right: 8.0),
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[
											Text(
												listCategories[index],
												style: TextStyle(
													fontWeight: FontWeight.bold,
													fontSize: 22.0,
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
							}),
						),
					],
				),
			),
		);
	}
	
	@override
	void dispose() {
		super.dispose();
		_tabController.dispose();
	}
}

class _CategoryDropMenu extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		return _CategoryDropMenuState();
	}
}

class _CategoryDropMenuState extends State<_CategoryDropMenu>{
	
	static List<String> _categories = ["Popular","Trending","New Arrivals"];
	
	String _dropdownValue = _categories[0].toString();
	
	@override
	Widget build(BuildContext context) {
		
		return PopupMenuButton(
			onSelected: (index){
				setState(() {
					_dropdownValue = index;
				});
			},
			child: Row(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					Text(
						_dropdownValue,
						style: TextStyle(
							fontSize: 24.0,
							fontWeight: FontWeight.bold,
						),
					),
					Icon(
						Icons.keyboard_arrow_down,
						color: Colors.black,
					),
				],
			),
			itemBuilder: (context) {
				return _categories.map<PopupMenuItem<String>>((String value) {
					return PopupMenuItem<String>(
						value: value,
						child: Text(
							value,
							style: TextStyle(
								color: Colors.black,
								fontWeight: FontWeight.bold,
								fontSize: 24
							),
						),
					);
				}).toList();
			}
		);
	}
}
