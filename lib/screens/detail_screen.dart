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
												topContainer(),
												SizedBox(height: 20,),
												Container(
													width: double.infinity,
													decoration: BoxDecoration(
														color: Colors.grey.shade100,
													),
													padding: EdgeInsets.all(16.0),
													child: Column(
														crossAxisAlignment: CrossAxisAlignment.start,
														children: <Widget>[
															Text(
																"Bags",
																style: TextStyle(
																	fontSize: 12,
																	color: Theme.of(context).primaryColor,
																	fontWeight: FontWeight.bold,
																),
															),
															SizedBox(height: 16,),
															Row(
																mainAxisAlignment: MainAxisAlignment.spaceBetween,
																crossAxisAlignment: CrossAxisAlignment.start,
																children: <Widget>[
																	Text(
																		"Blue Pouch-Teenage\nBackPack",
																		style: TextStyle(
																			letterSpacing: 1.0,
																			fontSize: 22,
																			fontWeight: FontWeight.bold,
																		),
																	),
																	Material(
																		color: Colors.transparent,
																		child: InkWell(
																			splashColor: Colors.blue.withOpacity(0.2),
																			onTap: (){
																			
																			},
																			child: Icon(
																				Icons.star,
																				color: Theme.of(context).primaryColor,
																			),
																		),
																	),
																],
															),
															SizedBox(height: 20,),
															Text(
																"\$128",
																style: TextStyle(
																	letterSpacing: 1.0,
																	fontSize: 22,
																	color: Colors.blue.shade600,
																	fontWeight: FontWeight.bold,
																),
															),
															SizedBox(height: 20,),
															Row(
																children: <Widget>[
																	Stack(
																		children: <Widget>[
																			Container(
																				padding: EdgeInsets.all(8.0),
																				decoration: BoxDecoration(
																					color: Colors.blueAccent,
																					shape: BoxShape.rectangle,
																					borderRadius: BorderRadius.circular(8.0),
																				),
																				child: Container(
																					padding: EdgeInsets.all(8.0),
																					decoration: BoxDecoration(
																						color: Colors.white,
																						borderRadius: BorderRadius.circular(4.0),
																					),
																				),
																			),
																			Positioned.fill(
																				child: Material(
																					color: Colors.transparent,
																					child: new InkWell(
																						onTap: () => null,
																					),
																				),
																			),
																		],
																	),
																],
															),
															SizedBox(height: 20,),
															bottomButtons(),
														],
													),
												),
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
	
	Widget topContainer() {
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
	
	Widget bottomButtons() {
		return Row(
			children: <Widget>[
				Expanded(
					child: FlatButton(
						color: Colors.blue.shade600,
						textColor: Colors.white,
						padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
						child: Text(
							'Add to Cart'.toUpperCase(),
							textAlign: TextAlign.center,
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize: 12.0,
							),
						),
						onPressed: () {}, //
						shape: RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(10.0),
						),
					),
				),
				SizedBox(width: 16.0,),
				Expanded(
					child: OutlineButton(
						padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
						textColor: Colors.blue.shade600,
						child: Text(
							'Buy Now'.toUpperCase(),
							textAlign: TextAlign.center,
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize: 12.0,
							),
						),
						onPressed: () {}, //callback when button is clicked
						borderSide: BorderSide(
							color: Colors.blue.shade600, //Color of the border
							style: BorderStyle.solid, //Style of the border
							width: 2.0, //width of the border
						),
						shape: RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(10.0),
						),
					),
				),
			],
		);
	}
}