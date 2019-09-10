import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
	
	final Color containerColor;
	final Color selectedColor;
	final int selectedIndex;
	final double iconSize;
	final Color backgroundColor;
	final bool showElevation;
	final Duration animationDuration;
	final List<CustomBottomNavBarItem> items;
	final ValueChanged<int> onItemSelected;
	
	CustomBottomNavBar(
		{Key key,
			this.containerColor,
			this.selectedColor,
			this.selectedIndex = 0,
			this.showElevation = true,
			this.iconSize = 24,
			this.backgroundColor,
			this.animationDuration = const Duration(milliseconds: 270),
			@required this.items,
			@required this.onItemSelected}) {
		assert(items != null);
		assert(items.length >= 2 && items.length <= 5);
		assert(onItemSelected != null);
	}
	
	Widget _buildItem(CustomBottomNavBarItem item, bool isSelected) {
		return AnimatedContainer(
			width: isSelected ? 130 : 50,
			height: double.maxFinite,
			duration: animationDuration,
			padding: EdgeInsets.only(left: 12),
			decoration: BoxDecoration(
				color: isSelected ? selectedColor : backgroundColor,
				borderRadius: BorderRadius.all(Radius.circular(50)),
			),
			child: ListView(
				shrinkWrap: true,
				physics: NeverScrollableScrollPhysics(),
				scrollDirection: Axis.horizontal,
				children: <Widget>[
					Row(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Padding(
								padding: const EdgeInsets.only(right: 8),
								child: IconTheme(
									data: IconThemeData(
										size: iconSize,
										color: isSelected
											? item.activeColor
											: item.inactiveColor == null
											? item.activeColor
											: item.inactiveColor),
									child: item.icon,
								),
							),
							isSelected
								? DefaultTextStyle.merge(
								style: TextStyle(
									color: item.activeColor,
									fontWeight: FontWeight.bold,
									fontSize: item.fontSize,
								),
								textAlign: TextAlign.center,
								child: item.title,
							)
								: SizedBox.shrink()
						],
					)
				],
			),
		);
	}
	
	@override
	Widget build(BuildContext context) {
		final bgColor = (containerColor == null)
			? Theme.of(context).primaryColor
			: containerColor;
		
		return Container(
			decoration: BoxDecoration(
				color: bgColor,
				boxShadow: showElevation ? [
					BoxShadow(color: Colors.black12, blurRadius: 2)
				] : null,
			),
			child: SafeArea(
				child: Container(
					width: double.infinity,
					height: 56,
					margin: EdgeInsets.symmetric(vertical: 2.0),
					padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: items.map((item) {
							var index = items.indexOf(item);
							return GestureDetector(
								onTap: () {
									onItemSelected(index);
								},
								child: _buildItem(item, selectedIndex == index),
							);
						}).toList(),
					),
				),
			),
		);
	}
}

class CustomBottomNavBarItem {
	final Icon icon;
	final Text title;
	final Color activeColor;
	final Color inactiveColor;
	final double fontSize;
	
	CustomBottomNavBarItem({
			@required this.icon,
			@required this.title,
			this.activeColor = Colors.blue,
			this.inactiveColor,
			@required this.fontSize,
		}) {
		assert(icon != null);
		assert(title != null);
	}
}