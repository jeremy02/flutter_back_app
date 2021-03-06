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
				child: Stack(
					children: <Widget>[
						SingleChildScrollView(
							child: Column(
								mainAxisSize: MainAxisSize.min,
								children: <Widget>[
									topContainer(),
									SizedBox(height: 20,),
									Container(
										width: double.infinity,
										padding: EdgeInsets.all(16.0),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											mainAxisSize: MainAxisSize.min,
											children: <Widget>[
												Text(
													"Bags",
													style: TextStyle(
														fontSize: 14,
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
															"${widget.bagDetail.bagName}-Teenage\nBackPack",
															style: TextStyle(
																fontSize: 24,
																fontWeight: FontWeight.w900,
															),
														),
														Material(
															color: Colors.transparent,
															child: InkWell(
																splashColor: Colors.blue.withOpacity(0.2),
																onTap: (){
																	setState(() {
																		isAddedToWishList = !isAddedToWishList;
																	});
																},
																child: Icon(
																	isAddedToWishList ? CustomAppIcons.heart : CustomAppIcons.heart_empty,
																	size: 24,
																	color: widget.bagDetail.bagColor,
																),
															),
														),
													],
												),
												SizedBox(height: 20,),
												Text(
													"\$${widget.bagDetail.bagPrice}",
													style: TextStyle(
														fontSize: 24,
														color: widget.bagDetail.bagColor,
														fontWeight: FontWeight.w900,
													),
												),
												SizedBox(height: 20,),
												Row(
													children: selectableColorsList(),
												),
												SizedBox(height: 20,),
												bottomButtons(),
											],
										),
									),
								],
							),
						),
						PreferredSize(
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									Material(
										color: Colors.transparent,
										type: MaterialType.transparency,
										child: IconButton(
											icon: Icon(
												Icons.arrow_back,
												color: Colors.black,
											),
											onPressed: (){Navigator.of(context).pop();},
										),
									),
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
							preferredSize: Size(
								MediaQuery.of(context).size.width,
								60,
							),
						),
					],
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
								tag: widget.bagDetail.bagImage,
								child: Image.asset(
									widget.bagDetail.bagImage,
									fit: BoxFit.cover,
									height: height * 0.44,
								),
							),
						),
					),
					Positioned(
						top: (MediaQuery.of(context).size.height * 0.45)*0.40,
						right: 0,
						child: Padding(
							padding: EdgeInsets.only(top: 16),
							child: Image.asset(
								widget.bagDetail.bagImageSmall,
								fit: BoxFit.contain,
								height: height * 0.15,
								width: height * 0.10,
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