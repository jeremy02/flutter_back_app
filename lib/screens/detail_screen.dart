import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
	@override
	_DetailScreentate createState() => _DetailScreentate();
}

class _DetailScreentate extends State<DetailScreen> with TickerProviderStateMixin {
	
	double height;
	
	@override
	void initState() {
		super.initState();
//		height = MediaQuery.of(context).size.height;
	}
	
	@override
	Widget build(BuildContext context) {
		
		height = MediaQuery.of(context).size.height;
		
		return Stack(
			children: <Widget>[
				Hero(
					tag: "_bagTypeBackground1",
					child: Container(
						decoration: BoxDecoration(
							color: Colors.white,
							borderRadius: BorderRadius.circular(0.0),
						),
					),
				),
				Scaffold(
					body: SafeArea(
						child: Stack(
							children: <Widget>[
								AppBar(
									backgroundColor: Colors.white,
									leading: Material(
										color: Colors.transparent,
										type: MaterialType.transparency,
										child: IconButton(
											icon: Icon(
												Icons.arrow_back,
												color: Colors.black,
											),
											onPressed: () {
												Navigator.of(context).pop();
											},
										),
									),
									primary: false,
									actions: <Widget>[
										Material(
											color: Colors.transparent,
											type: MaterialType.transparency,
											child: IconButton(
												icon: Icon(
													Icons.more_horiz,
													color: Colors.black,
												),
												onPressed: () {
													null;
												},
											),
										),
									],
								),
								Align(
									alignment: Alignment.topCenter,
									child: SingleChildScrollView(
										child: Column(
											children: <Widget>[
												topPart(),
											],
										),
									),
								),
							],
						),
					),
				)
			],
		);
	}
	
	Widget topPart (){
		return Container(
			height: height * 0.45,
			decoration: BoxDecoration(
				color: Colors.transparent,
			),
			child: Stack(
				children: <Widget>[
					Align(
						alignment: Alignment.topCenter,
						child: Padding(
							padding: EdgeInsets.only(top: 16),
							child: Hero(
								tag: "_bagTypeImage1",
								child: Image.asset(
									"assets/images/red_bag.png",
									fit: BoxFit.cover,
									height: height * 0.44,
								),
							),
						),
					),
					Positioned(
						top: (MediaQuery.of(context).size.height * 0.45)*0.30,
						right: 0,
						child: Padding(
							padding: EdgeInsets.only(top: 16),
							child: Image.asset(
								"assets/images/red_bag.png",
								fit: BoxFit.cover,
								height: height * 0.1,
								width: height * 0.08,
							),
						),
					),
					Align(
						alignment: Alignment.bottomCenter,
						child: Container(
							height: 2,
							decoration: BoxDecoration(
								boxShadow: <BoxShadow>[
									BoxShadow(
										color: Colors.black54,
										blurRadius: 15.0,
										offset: Offset(0.0, 0.75)
									)
								],
								color: Colors.transparent
							),
						),
					),
				],
			),
		);
	}
}