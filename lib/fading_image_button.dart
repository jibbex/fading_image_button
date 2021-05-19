import 'package:flutter/material.dart';

/// Animated Flutter image button widget.
class FadingImageButton extends StatefulWidget {
  /// Function that is called on ``onTapUp`` event.
  final Function onPressed;

  /// Image of the button.
  final Image image;

  /// Overlay image. It is triggered on ``onTapDown`` event.
  final Image onPressedImage;

  /// Button width.
  final double? width;

  /// Button height.
  final double? height;

  /// Padding of the container widget. Therefore actually margin of the images.
  final EdgeInsets? padding;

  /// Duration of the fading animation.
  final Duration? duration;

  FadingImageButton({
    Key? key,
    required this.onPressed,
    required this.image,
    required this.onPressedImage,
    this.width,
    this.height,
    this.padding,
    this.duration,
  }) : super(key: key);

  @override
  _FadingImageButtonState createState() => _FadingImageButtonState();
}

class _FadingImageButtonState extends State<FadingImageButton> {
  late double _opacity;

  @override
  void initState() {
    super.initState();
    setState(() => _opacity = .0);
  }

  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(widget.image.image, context);
    precacheImage(widget.onPressedImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    double _width = widget.width ?? 128;
    double _height = widget.height ?? 128;
    Duration _duration = widget.duration ?? Duration(milliseconds: 250);
    EdgeInsets _padding = widget.padding ?? EdgeInsets.all(5);

    return GestureDetector(
      onTapDown: (details) => setState(() => _opacity = 1.0),
      onTapCancel: () => setState(() => _opacity = .0),
      onTapUp: (details) {
        Future.delayed(
          Duration(
            milliseconds: (_duration.inMilliseconds / 2).round(),
          ),
          () {
            setState(() => _opacity = .0);
            widget.onPressed();
          },
        );
      },
      child: Container(
        height: _height,
        width: _width,
        padding: _padding,
        child: Stack(
          children: <Widget>[
            widget.image,
            AnimatedOpacity(
              duration: _duration,
              opacity: _opacity,
              child: widget.onPressedImage,
            ),
          ],
        ),
      ),
    );
  }
}
