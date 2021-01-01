# fading_image_button

Animated Flutter image button widget.

## About

It fades between pressed and default state. On ``onTapUp`` event after half the animation duration,
the ``onPress`` function is triggered. Both images are cached to avoid longer initial loading time.

## Getting Started

```dart
Widget build(BuildContext context) {
    return FadingImageButton(
        onPressed: () => print(pressed),
        image: Image.asset("assets/button.png"),
        onPressedImage: Image.asset("assets/button-pressed.png"),
    );
}
```

## Properties

| property          | description                                                               | default   |
| ------------------|---------------------------------------------------------------------------|-----------|
| **onPressed**     | Function that is called on ``onTapUp`` event.                             |           |
| **image**         | Image of the button.                                                      |           |
| **onPressedImage**  | Overlay image. It is triggered on ``onTapDown`` event.                  |           |
| width             | Button width.                                                             | *128*     |
| height            | Button height.                                                            | *128*     |
| padding           | Padding of the container widget. Therefore actually margin of the images. | *all: 5*  |
| duration          | Duration of the fading animation.                                         | *250ms*   |

***Fat*** *properties are required.*
