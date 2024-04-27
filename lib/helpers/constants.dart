import 'package:flutter/material.dart';

const primaryLightGreen = Color(0xffD3F4C9);
const primaryGreen = Color(0xff7AED54);
const primaryDullGreen = Color(0xff6da854);
const primaryTextGrey = Color(0xffC1C1C1);
const textFieldFillGrey = Color(0xffDDDDDD);
const textBlack = Colors.black;

const categoriesList = <String>[
  'Vegetables',
  'Fruits',
  'Milk',
  'Shoes',
  'Fish',
  'Meat',
  'Drinks',
  'Snacks',
  'Bakery',
  'Tools',
  'Electronics',
];

const offersList = <Map<String, String>>[
  {
    'title': 'Buy juices with 20% off',
    'subtitle_heading': '20% Off',
    'subtitle_detail': 'on some juice products',
    'image': 'assets/images/juices.png'
  },
];

const productsList = <Map<String, dynamic>>[
  {
    'name': 'Tomato',
    'price': 50,
    'rating': 4.5,
    'available_quantity': 15,
  },
  {
    'name': 'Potato',
    'price': 80,
    'rating': 3.2,
    'available_quantity': 20,
  },
  {
    'name': 'Peas',
    'price': 50,
    'rating': 4.0,
    'available_quantity': 35,
  },
  {
    'name': 'Onion',
    'price': 20,
    'rating': 5.0,
    'available_quantity': 5,
  },
];

List currencyList = <Map<String, dynamic>>[
  {
    'title': 'USD',
    'full_form': 'United States Dollar',
    'selected': false,
  },
  {
    'title': 'PKR',
    'full_form': 'Pakistani Rupee',
    'selected': true
  }
];