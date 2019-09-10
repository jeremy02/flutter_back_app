
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget{
	
	double height;
	
	@override
	Widget build(BuildContext context) {
		
		height = MediaQuery.of(context).size.height;
		
		return GestureDetector(
			onTap: (){
			
			},
			child: Material(
				borderRadius: BorderRadius.all(
					Radius.circular(10.0),
				),
				
				child: ClipRRect(
					borderRadius: BorderRadius.all(Radius.circular(10.0)),
					child: Material( // needed
						color: Colors.white,
						child: InkWell(
							splashColor: Colors.blue.shade900,
							onTap: (){
							
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
															color: Colors.black,
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
			),
		);
	}
}