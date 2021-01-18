import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneymanager/core/models/category.dart';

class CategoryIconService {
  //* FIRST : EXPENSE LIST
  final expenseList = {
    Category(0, "Food", FontAwesomeIcons.pizzaSlice, Colors.white),
    Category(1, "Bills", FontAwesomeIcons.moneyBill, Colors.white),
    Category(2, "Transportaion", FontAwesomeIcons.bus, Colors.white),
    Category(3, "Home", FontAwesomeIcons.home, Colors.white),
    Category(4, "Entertainment", FontAwesomeIcons.gamepad, Colors.white),
    Category(5, "Shopping", FontAwesomeIcons.shoppingBag, Colors.white),
    Category(6, "Clothing", FontAwesomeIcons.tshirt, Colors.white),
    Category(7, "Insurance", FontAwesomeIcons.hammer, Colors.white),
    Category(8, "Telephone", FontAwesomeIcons.phone, Colors.white),
    Category(9, "Health", FontAwesomeIcons.briefcaseMedical, Colors.white),
    Category(10, "Sport", FontAwesomeIcons.footballBall, Colors.white),
    Category(11, "Beauty", FontAwesomeIcons.marker, Colors.white),
    Category(12, "Education", FontAwesomeIcons.book, Colors.white),
    Category(13, "Gift", FontAwesomeIcons.gift, Colors.white),
    Category(14, "Pet", FontAwesomeIcons.dog, Colors.white),
  };
  //* SECOND : INCOME LIST
  final incomeList = {
    Category(0, "Salary", FontAwesomeIcons.wallet, Colors.white),
    Category(1, "Awards", FontAwesomeIcons.moneyCheck, Colors.white),
    Category(2, "Grants", FontAwesomeIcons.gifts, Colors.white),
    Category(3, "Rental", FontAwesomeIcons.houseUser, Colors.white),
    Category(4, "Investment", FontAwesomeIcons.piggyBank, Colors.white),
    Category(5, "Lottery", FontAwesomeIcons.dice, Colors.white),
  };
}
