import 'package:flutter/material.dart';

/// Provides data for the card view model
class CardViewModel {
  /// Set the path of the image card
  final String backdropAssetPath;

  /// Set the top section title [address if it is a location]
  final String address;

  /// Set the middle section title [capitol if it is a location]
  final String capitol;

  /// Set the middle section description
  final String description;

  final VoidCallback ontap;

  /// Provides data for the card view model
  CardViewModel({
    required this.backdropAssetPath,
    required this.ontap,
    required this.address,
    required this.capitol,
    required this.description,
  });
}
