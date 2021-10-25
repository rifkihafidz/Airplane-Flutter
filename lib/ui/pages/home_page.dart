// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/image_profile.png'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(
                imageUrl: 'assets/image_carousel1.png',
                name: 'Lake Ciliwung',
                city: 'Tangerang',
                rating: 4.8,
              ),
              DestinationCard(
                imageUrl: 'assets/image_carousel2.png',
                name: 'White Houses',
                city: 'Spain',
                rating: 4.7,
              ),
              DestinationCard(
                imageUrl: 'assets/image_carousel3.png',
                name: 'Hill Heyo',
                city: 'Monaco',
                rating: 4.8,
              ),
              DestinationCard(
                imageUrl: 'assets/image_carousel4.png',
                name: 'Menarra',
                city: 'Japan',
                rating: 5.0,
              ),
              DestinationCard(
                imageUrl: 'assets/image_carousel5.png',
                name: 'Payung Teduh',
                city: 'Singapore',
                rating: 4.8,
                marginRight: 24,
              ),
            ],
          ),
        ),
      );
    }

    Widget newDestination() {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 30,
            left: defaultMargin,
            right: defaultMargin,
            bottom: 140,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New This Year',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 18,
                ),
              ),
              DestinationTile(
                name: 'Danau Beratan',
                city: 'Singaraja',
                imageUrl: 'assets/image_carousel6.png',
                rating: 4.5,
              ),
              DestinationTile(
                name: 'Sydney Opera',
                city: 'Australia',
                imageUrl: 'assets/image_carousel7.png',
                rating: 4.7,
              ),
              DestinationTile(
                name: 'Roma',
                city: 'Italy',
                imageUrl: 'assets/image_carousel8.png',
                rating: 4.8,
              ),
              DestinationTile(
                name: 'Payung Teduh',
                city: 'Singapore',
                imageUrl: 'assets/image_carousel9.png',
                rating: 4.5,
              ),
              DestinationTile(
                name: 'Hill Hey',
                city: 'Monaco',
                imageUrl: 'assets/image_carousel10.png',
                rating: 4.7,
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularDestinations(),
        newDestination(),
      ],
    );
  }
}
