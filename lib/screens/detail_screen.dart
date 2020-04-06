import 'package:flutter/material.dart';
import 'package:flutter_back_app/models/bag_color_model.dart';
import 'package:flutter_back_app/models/bag_model.dart';
import 'package:flutter_back_app/utils/custom_app_icons_icons.dart';

class DetailScreen extends StatefulWidget {
	final BagModel bagDetail;

    const DetailScreen({Key key, this.bagDetail}) : super(key: key);
	
	@override
	_DetailScreentate createState() => _DetailScreentate();
}

class _DetailScreentate extends State<DetailScreen> with TickerProviderStateMixin {
	
	double height;
	// the list of available colors
	List<BagColorModel> sampleBagColorsData = new List<BagColorModel>();
	
	bool isAddedToWishList = true;
	
	@override
	void initState() {
		super.initState();
//		height = MediaQuery.of(context).size.height;
	
		// create the list of colors
		sampleBagColorsData.add(BagColorModel(true, Colors.blue.shade600, 'blue'));
		sampleBagColorsData.add(BagColorModel(false, Colors.black, 'black'));
		sampleBagColorsData.add(BagColorModel(false, Colors.red.shade900, 'blue'));
		sampleBagColorsData.add(BagColorModel(false, Colors.grey.shade600, 'blue'));
	}
	
	@override
	Widget build(BuildContext context) {
		
		height = MediaQuery.of(context).size.height;
		
		return Scaffold(
			backgroundColor: Colors.white,
			body: SafeArea(
				child: Container(
				
				),
			),
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
	
	List<Widget> selectableColorsList(){
		return List<Widget>.generate(sampleBagColorsData.length, (int index) {
			
			BagColorModel objModel = sampleBagColorsData[index];
			
			return Padding(
				padding: EdgeInsets.only(right: 6),
				child: Stack(
					children: <Widget>[
						Container(
							padding: EdgeInsets.all(10.0),
							decoration: BoxDecoration(
								color: objModel.color,
								shape: BoxShape.rectangle,
								borderRadius: BorderRadius.circular(6.0),
							),
							child: Container(
								padding: EdgeInsets.all(5.0),
								decoration: BoxDecoration(
									color: objModel.isSelected ? Colors.white : Colors.transparent,
									borderRadius: BorderRadius.circular(3.0),
								),
							),
						),
						Positioned.fill(
							child: Material(
								color: Colors.transparent,
								child: new InkWell(
									onTap: () {
										setState(() {
											sampleBagColorsData.forEach((element) => element.isSelected = false);
											objModel.isSelected = true;
										});
									},
								),
							),
						),
					],
				),
			);
		});
	}
}