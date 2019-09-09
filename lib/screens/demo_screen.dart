import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
	final String title;
	
	DemoScreen({
		this.title
	});
	
	@override
	Widget build(BuildContext context) {
		return Center(
			child: Text(
				title,
				style: TextStyle(
					fontSize: 24,
					fontWeight: FontWeight.bold,
				),
			),
		);
	}
}