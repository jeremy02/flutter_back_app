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
		"assets/images/blue_pouch.jpg",
		"assets/images/blue_pouch_small.jpg",
		"129",
		Colors.blue,
	))
	..add(BagModel(
		"Red Bosta",
		"assets/images/red_bosta.jpg",
		"assets/images/red_bosta_small.jpg",
		"99",
		Colors.blue,
	))..add(BagModel(
		"Orange Slot",
		"assets/images/orange_slot.jpg",
		"assets/images/orange_slot_small.jpg",
		"159",
		Colors.orange,
	))
	..add(BagModel(
		"Grey Ash",
		"assets/images/grey_ash.jpg",
		"assets/images/grey_ash_small.jpg",
		"112",
		Colors.grey,
	))
	..add(BagModel(
		"Womens Recon",
		"assets/images/womens_recons.jpg",
		"assets/images/womens_recons_small.jpg",
		"139",
		Colors.grey,
	))
	..add(BagModel(
		"Travel Duffel",
		"assets/images/travel_duffel.jpg",
		"assets/images/travel_duffel_small.jpg",
		"167",
		Colors.green,
	));