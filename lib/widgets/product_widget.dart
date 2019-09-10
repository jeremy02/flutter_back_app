
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget{
	@override
	ProductWidgetState createState() => ProductWidgetState();
}

class ProductWidgetState extends State<ProductWidget> with SingleTickerProviderStateMixin{
	
	double height;
	AnimationController _animationController;
	Animation _bgColorTween;
	Animation _textColorTween;
	CurvedAnimation curvedAnimation;
	
	@override
	void initState() {
		_animationController =
			AnimationController(vsync: this, duration: Duration(milliseconds: 1300))
				..addStatusListener((AnimationStatus status) {
					if (status == AnimationStatus.completed){
						print('completed');
						_animationController.reverse();
					}
				});
		
		// changes the background of the card
		_bgColorTween = ColorTween(begin: Colors.white, end: Colors.blue.shade900)
			.animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
		
		// changes the text of the card
		_textColorTween = ColorTween(begin: Colors.black, end: Colors.white)
			.animate(CurvedAnimation(parent: _animationController, curve: Interval(
			0.350,
			0.750,
			curve: Curves.ease,
		)));
		
		super.initState();
	}
	
	@override
	void dispose() {
		super.dispose();
		_animationController.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		
		height = MediaQuery.of(context).size.height;
		
		return AnimatedBuilder(
			animation: _bgColorTween,
			builder: (BuildContext context, Widget child){
				return Material(
					borderRadius: BorderRadius.all(
						Radius.circular(10.0),
					),
					
					child: ClipRRect(
						borderRadius: BorderRadius.all(Radius.circular(10.0)),
						child: Material( // needed
							color: _bgColorTween.value,
							child: InkWell(
								splashColor: Colors.blue.shade900,
								onTap: (){
//									if (_animationController.status == AnimationStatus.completed) {
//										_animationController.reverse();
//									} else {
//										_animationController.forward();
//									}
									
									_animationController.forward();
								},
								child: Container(
									padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
									decoration: BoxDecoration(
										borderRadius: BorderRadius.all(
											Radius.circular(10.0),
										),
										border: Border.all(
											color: Colors.grey.shade300,
											width: 0.5,
										),
									),
									child: Column(
										mainAxisSize: MainAxisSize.max,
										crossAxisAlignment: CrossAxisAlignment.center,
										children: <Widget>[
											Center(
												child: Hero(tag: "bagType",
													child: Image.asset(
														"assets/images/red_bag.png",
														fit: BoxFit.cover,
														height: height / 5,
													)
												),
											),
											SizedBox(height: 4.0,),
											Expanded(
												child: Column(
													mainAxisSize: MainAxisSize.max,
													mainAxisAlignment: MainAxisAlignment.center,
													children: <Widget>[
														Text(
															"Blue Pouch",
															style: TextStyle(
																fontWeight: FontWeight.bold,
																fontSize: 22,
																color: _textColorTween.value,
															),
															textAlign: TextAlign.center,
														),
														SizedBox(height: 4.0,),
														Text(
															"\$99",
															style: TextStyle(
																fontWeight: FontWeight.w600,
																fontSize: 16,
																color: Colors.blue.shade300,
															),
															textAlign: TextAlign.center,
														),
													],
												),
											),
										],
									),
								),
							)
						),
					),
				);
			},
		);
	}
}