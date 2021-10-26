// ignore_for_file: prefer_const_constructors

import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  // 0: Available, 1: Selected, 2: Unavailable

  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        // Jika seat unavailable
        return kUnavailableColor;
      } else {
        if (isSelected) {
          // Jika seat selected
          return kPrimaryColor;
        } else {
          // Jika seat available
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        // Jika seat unavailable
        return kUnavailableColor;
      } else {
        // Jika seat selected / available
        return kPrimaryColor;
      }
    }

    childText() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: borderColor(),
          ),
        ),
        child: Center(
          child: childText(),
        ),
      ),
    );
  }
}
