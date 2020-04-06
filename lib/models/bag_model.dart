import 'package:flutter/material.dart';

class BagModel {
	String bagName;
	String bagImage;
	String bagImageSmall;
	String bagPrice;
	Color bagColor;
	
	BagModel(this.bagName, this.bagImage, this.bagImageSmall, this.bagPrice, this.bagColor);
}

List<BagModel> bagsList = []
	..add(BagModel(
		"Blue Pouch",
		"assets/images/blue_pouch.png",
		"assets/images/blue_pouch_small.png",
		"129",
		Colors.blue,
	))
	..add(BagModel(
		"Red Bosta",
		"assets/images/red_bosta.png",
		"assets/images/red_bosta_small.png",
		"99",
		Colors.blue,
	))..add(BagModel(
		"Orange Slot",
		"assets/images/orange_slot.png",
		"assets/images/orange_slot_small.png",
		"159",
		Colors.orange,
	))
	..add(BagModel(
		"Grey Ash",
		"assets/images/grey_ash.png",
		"assets/images/grey_ash_small.png",
		"112",
		Colors.grey,
	))
	..add(BagModel(
		"Womens Recon",
		"assets/images/womens_recons.png",
		"assets/images/womens_recons_small.png",
		"139",
		Colors.blueGrey,
	))
	..add(BagModel(
		"Travel Duffel",
		"assets/images/travel_duffel.png",
		"assets/images/travel_duffel_small.png",
		"167",
		Colors.green,
	));