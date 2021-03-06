
import 'package:flutter/material.dart';
import 'package:flutter_back_app/models/bag_model.dart';
import 'package:flutter_back_app/screens/detail_screen.dart';
import 'package:flutter_back_app/utils/product_widget_animation.dart';

class ProductWidget extends StatefulWidget{
	
	final BagModel bagsObject;
	
	ProductWidget({Key key, this.bagsObject}) : super(key:key);
	
	@override
	ProductWidgetState createState() => ProductWidgetState();
}

class ProductWidgetState extends State<ProductWidget> with SingleTickerProviderStateMixin{
	
	double height;
	AnimationController _animationController;
	ProductWidgetAnimation animation;
	
	@override
	void initState() {
		_animationController =
		AnimationController(vsync: this, duration: Duration(milliseconds: 300))
			..addStatusListener((AnimationStatus status) {
				if (status == AnimationStatus.completed) {
					_animationController.reverse();
					
					// go to the details page
					Future.delayed(const Duration(milliseconds: 300), () {
						setState(() {
							Navigator.push(context,
								MaterialPageRoute(builder: (context) =>
									DetailScreen(bagDetail: widget.bagsObject)
								));
						});
					});
				}
			});
		
		animation = ProductWidgetAnimation(_animationController);
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
			animation: animation.controller,
			builder: (BuildContext context, Widget child){
				return Material(
					borderRadius: BorderRadius.all(
						Radius.circular(10.0),
					),
					
					child: ClipRRect(
						borderRadius: BorderRadius.all(Radius.circular(10.0)),
						child: Material( // needed
							color: animation.bgColorTween.value,
							child: InkWell(
								splashColor: Colors.blue.shade900,
								onTap: (){
									if (_animationController.status == AnimationStatus.completed) {
										_animationController.reverse();
									} else {
										_animationController.forward();
									}
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
												child: Hero(
													tag: widget.bagsObject.bagImage,
													child: Image.asset(
														widget.bagsObject.bagImage,
														fit: BoxFit.cover,
														height: height / 5,
													),
												),
											),
											SizedBox(height: 4.0,),
											Expanded(
												child: Column(
													mainAxisSize: MainAxisSize.max,
													mainAxisAlignment: MainAxisAlignment.center,
													children: <Widget>[
														Text(
															widget.bagsObject.bagName,
															style: TextStyle(
																fontWeight: FontWeight.bold,
																fontSize: 22,
																color: animation.textColorTween.value,
															),
															textAlign: TextAlign.center,
														),
														SizedBox(height: 4.0,),
														Text(
															"\$${widget.bagsObject.bagPrice}",
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
							),
						),
					),
				);
			},
		);
	}
}