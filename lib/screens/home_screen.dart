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
		return Container(
			margin: EdgeInsets.symmetric(horizontal: 16.0,),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisSize: MainAxisSize.max,
				children: <Widget>[
					SizedBox(height: 50,),
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
												fontSize: 24.0,
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
		);
	}
	
	@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
}
