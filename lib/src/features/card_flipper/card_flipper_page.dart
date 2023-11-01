// Copyright (c) 2021 Ali Missaoui

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:

//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
//     * Neither the name of the copyright holder nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import 'package:electrical_project/src/features/card_flipper/presentation/bottombar.dart';
import 'package:electrical_project/src/features/card_flipper/presentation/card_flipper.dart';
import 'package:flutter/material.dart';

import 'domain/card_data_model.dart';

class CardFlipperScreen extends StatefulWidget {
  ///Set App Name
  final double topSpace;

  /// Set Cards to display as Card View Models
  final List<CardViewModel> cardsToDispaly;

  /// Set the back button widget
  final Widget? backWidget;

  /// Set the optional widget
  final Widget? optionalActionWidget;

  /// Handle click back widget
  final VoidCallback? onTapBackBtn;

  /// Handle click optional widget
  final VoidCallback? onTapOptionalActionWidget;

  /// Set top section title style
  final TextStyle? topSectionTitleStyle;

  /// Set middle section title style
  final TextStyle? middleSectionTitleStyle;

  /// Set middle section decription style
  final TextStyle? middleSectionDescriptionStyle;

  /// Set main button widget
  final Widget? mainBtnWidget;

  /// Set on tap function on the main button
  final VoidCallback? onTapFunction;

  //Set background color
  final Color? backgroundColor;

  const CardFlipperScreen(
      {Key? key,
      this.topSpace = 20.0,
      required this.cardsToDispaly,
      this.backWidget,
      this.optionalActionWidget,
      this.onTapBackBtn,
      this.onTapOptionalActionWidget,
      this.topSectionTitleStyle,
      this.middleSectionTitleStyle,
      this.middleSectionDescriptionStyle,
      this.mainBtnWidget,
      this.onTapFunction,
      this.backgroundColor})
      : super(key: key);

  @override
  State<CardFlipperScreen> createState() => _CardFlipperScreenState();
}

class _CardFlipperScreenState extends State<CardFlipperScreen> {
  double scrollPercent = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: widget.topSpace,
          ),
          Expanded(
            child: CardFlipperWidget(
              topSectionTitleStyle: widget.topSectionTitleStyle,
              middleSectionTitleStyle: widget.middleSectionTitleStyle,
              middleSectionDescriptionStyle:
                  widget.middleSectionDescriptionStyle,
              mainBtnWidget: widget.mainBtnWidget,
              onTapFunction: widget.onTapFunction,
              cards: widget.cardsToDispaly,
              onScroll: (double scrollPercent) {
                setState(() {
                  this.scrollPercent = scrollPercent;
                });
              },
            ),
          ),
          BottomBar(
            backWidget: widget.backWidget,
            optionalActionWidget: widget.optionalActionWidget,
            onTapBackBtn: widget.onTapBackBtn,
            onTapOptionalActionWidget: widget.onTapOptionalActionWidget,
            scrollPercent: scrollPercent,
            cardCount: widget.cardsToDispaly.length,
          ),
        ],
      ),
    );
  }
}
