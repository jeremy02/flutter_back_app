
import 'package:flutter/material.dart';

class ProductWidgetAnimation{
	
	ProductWidgetAnimation(this.controller)
		: bgColorTween = ColorTween(begin: Colors.white, end: Colors.blue.shade900).animate(
				CurvedAnimation(
					parent: controller,
					curve: Interval(
						0.125, 0.250,
						curve: Curves.ease,
					),
				),
			),
			textColorTween = ColorTween(begin: Colors.black, end: Colors.white).animate(
				CurvedAnimation(
					parent: controller,
					curve: Interval(
						0.375,0.500,
						curve: Curves.fastOutSlowIn,
					),
				),
			);
	
	final AnimationController controller;
	final Animation<Color> bgColorTween;
	final Animation<Color> textColorTween;
	
}