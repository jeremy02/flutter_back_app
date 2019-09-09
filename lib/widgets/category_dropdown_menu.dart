import 'package:flutter/material.dart';

class CategoryDropMenu extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		return _CategoryDropMenuState();
	}
}

class _CategoryDropMenuState extends State<CategoryDropMenu>{
	
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
							fontSize: 26.0,
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
								fontSize: 22.0,
							),
						),
					);
				}).toList();
			}
		);
	}
}