// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(destination.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    }

    Widget content() {
      return SafeArea(
        // Kalo gapake SafeArea, kasih margin top 30
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          child: Column(
            children: [
              // Emblem
              Container(
                width: 108,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/emblem_detail.png'),
                  ),
                ),
              ),
              // Title
              Container(
                margin: EdgeInsets.only(top: 256),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.name,
                            style: whiteTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 24,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            destination.city,
                            style: whiteTextStyle.copyWith(
                              fontWeight: light,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(right: 2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icon_star.png'),
                            ),
                          ),
                        ),
                        Text(
                          destination.rating.toString(),
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Description
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // About
                    Text(
                      'About',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: blackTextStyle.copyWith(
                        fontWeight: regular,
                        // Line height, satuan dari figma / 10, ex: Figma:20, Dart:2
                        height: 2,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Photos
                    Text(
                      'Photos',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        PhotoItem(imageUrl: 'assets/image_detail1.png'),
                        PhotoItem(imageUrl: 'assets/image_detail2.png'),
                        PhotoItem(imageUrl: 'assets/image_detail3.png'),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Interests
                    Text(
                      'Interests',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        InterestItem(title: 'Kids Park'),
                        InterestItem(title: 'Honor Bridge'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InterestItem(title: 'City Museum'),
                        InterestItem(title: 'Central Mall'),
                      ],
                    ),
                  ],
                ),
              ),

              // Price & Book Button
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Row(
                  children: [
                    // Price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(destination.price),
                            style: blackTextStyle.copyWith(
                                fontWeight: medium, fontSize: 18),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'per orang',
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          )
                        ],
                      ),
                    ),

                    // Book Button
                    CustomButton(
                      title: 'Book Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseSeatPage(destination),
                          ),
                        );
                      },
                      width: 170,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
