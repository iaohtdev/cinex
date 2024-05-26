import 'package:flutter/material.dart';

class SlidingClippedNavBar extends StatelessWidget {
  /// List of bar items shown horizontally, Minimum 2 and maximum 4 items.
  final List<BarItem> barItems;

  /// Selected index of the bar items.
  final int selectedIndex;

  /// Size of all icons (inactive items), don't make it too big or will be clipped.
  final double iconSize;

  /// FontSize of the text.
  final double? fontSize;

  /// FontWeight of the text.
  final FontWeight? fontWeight;

  /// FontStyle of the text.
  final FontStyle? fontStyle;

  /// Color of the selected item which indicate selected.
  final Color? _activeColor;

  /// Inactive color of item, which actually color icons.
  final Color? _inactiveColor;

  /// Callback when item is pressed.
  final OnButtonPressCallback onButtonPressed;

  /// background color of the bar.
  final Color backgroundColor;

  /// User when you want to set global active and inactive color.
  SlidingClippedNavBar({
    Key? key,
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    required Color activeColor,
    Color? inactiveColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.iconSize = 30,
    this.backgroundColor = Colors.white,
  })  : assert(
            !barItems.any((BarItem element) =>
                (element.activeColor != null || element.inactiveColor != null)),
            '''You don't need to assign each item active & inactive color,
            when you already assigned global active color.'''),
        _activeColor = activeColor,
        _inactiveColor = inactiveColor ?? activeColor.withOpacity(0.3),
        assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        assert(barItems.length < 5, 'Maximum menu item count is 4'),
        super(key: key);

  /// User you want to set individual item active & inactive color.
  SlidingClippedNavBar.colorful({
    Key? key,
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.iconSize = 30,
    this.backgroundColor = Colors.white,
  })  : assert(
            !barItems.any((BarItem element) =>
                (element.activeColor == null || element.inactiveColor == null)),
            'You need to assign each item active & inactive color'),
        _activeColor = null,
        _inactiveColor = null,
        assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        assert(barItems.length < 5, 'Maximum menu item count is 4'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarBody(
      buttons: barItems,
      iconSize: iconSize,
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
      backgroundColor: backgroundColor,
      onButtonPress: onButtonPressed,
      selectedIndex: selectedIndex,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}

class BarItem {
  /// ber item icon which shown when item is inactive.
  final IconData? icon;
  final Widget? customButton;

  /// active color of the item, required when use SlidingClippedNavBar.coloredItems
  final Color? activeColor;

  /// inactiveColor color of the item, required when use SlidingClippedNavBar.coloredItems
  final Color? inactiveColor;

  /// ber item text which shown when item is active.
  final String title;
  BarItem({
    required this.title,
    this.customButton,
    this.icon,
    this.activeColor,
    this.inactiveColor,
  });
}

class RippleEffect extends CustomPainter {
  final Color _color;
  final double _strokeWidth;

  RippleEffect(
    this._color,
    this._strokeWidth,
  );
  static Widget draw({
    required Color rippleColor,
    required double size,
    required double strokeWidth,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: RippleEffect(
            rippleColor,
            strokeWidth,
          ),
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.height / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SlicedCard extends CustomPainter {
  final Color _color;
  final double _heightPercent;

  SlicedCard(this._color, this._heightPercent);
  static Widget draw({
    required Color cardColor,
    required double heightFraction,
  }) =>
      CustomPaint(
        painter: SlicedCard(
          cardColor,
          heightFraction,
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.lineTo(size.width, size.height * _heightPercent);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NavBarButton extends StatefulWidget {
  final String title;
  final IconData icon;

  final Widget? customButton;
  final bool isSelected;
  final Color activeColor;
  final double size;
  final int index;
  final Color slidingCardColor;
  final Color inactiveColor;
  final int itemCount;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;
  final OnButtonPressCallback onTap;
  const NavBarButton({
    Key? key,
    required this.icon,
    this.customButton,
    required this.size,
    required this.title,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
    required this.index,
    required this.slidingCardColor,
    required this.inactiveColor,
    required this.itemCount,
    required this.fontWeight,
    required this.fontSize,
    required this.fontStyle,
  }) : super(key: key);

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    if (widget.isSelected) {
      _animationController.forward(from: 0.3);
    }
  }

  Widget _buildCard(double height, [Color? color]) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      // width: 70,
      width: deviceWidth / widget.itemCount,
      height: height,
      child: SlicedCard.draw(
          cardColor: color ?? widget.slidingCardColor,
          heightFraction: Tween<double>(begin: 0.1, end: 0.4)
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.5,
                    0.7,
                  ),
                ),
              )
              .value),
    );
  }

  @override
  void didUpdateWidget(NavBarButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected && widget.isSelected) {
      _animationController.forward();
    }
    if (oldWidget.isSelected != widget.isSelected && !widget.isSelected) {
      _animationController.reverse();
    }
  }

  TextStyle getTextStyle() => TextStyle(
        fontSize: widget.fontSize ?? 16,
        fontWeight: widget.fontWeight ?? FontWeight.bold,
        fontStyle: widget.fontStyle,
        color: widget.activeColor,
      );

  // copied from here
  //https://stackoverflow.com/a/62536187/16122873
  double textHeight(String text, TextStyle textStyle) => (TextPainter(
          text: TextSpan(text: text, style: textStyle),
          maxLines: 1,
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          textDirection: Directionality.of(context))
        ..layout())
      .size
      .height;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final Color activeColor = widget.activeColor;
    final double size = widget.size;
    final int index = widget.index;
    final Function(int) onTap = widget.onTap;
    final String title = widget.title;
    final Color inactiveColor = widget.inactiveColor;
    final Color slidingCardColor = widget.slidingCardColor;
    final double eachIconWidth = deviceWidth / widget.itemCount;

    return GestureDetector(
      onTap: () {
        onTap(index);
        if (_animationController.status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: slidingCardColor,
              width: eachIconWidth,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(
                  0,
                  -1.4,
                ),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.3,
                    1.0,
                  ),
                ),
              ),
              child: widget.customButton ??
                  Icon(
                    widget.icon,
                    size: size,
                    color: inactiveColor,
                  ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(
                  0,
                  0.8,
                ),
                end: const Offset(
                  0,
                  -0.7,
                ),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.3,
                    1.0,
                  ),
                ),
              ),
              child: _buildCard(60),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(
                  0,
                  1.4,
                ),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.3,
                    1.0,
                  ),
                ),
              ),
              child: Container(
                width: deviceWidth / widget.itemCount,
                alignment: Alignment.center,
                height: textHeight(title, getTextStyle()),
                child: Text(
                  title,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: getTextStyle(),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(
                0,
                42,
              ),
              child: _buildCard(56.0),
            ),
            Transform.translate(
              offset: const Offset(
                0,
                25,
              ),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: const Interval(
                      0.3,
                      1.0,
                    ),
                  ),
                ),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeColor,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: widget.isSelected && _animationController.value <= 0.3,
              child: RippleEffect.draw(
                size: Tween<double>(begin: 8.0, end: 56.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.0,
                          0.3,
                        ),
                      ),
                    )
                    .value,
                strokeWidth: Tween<double>(begin: 24.0, end: 0.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.1,
                          0.3,
                        ),
                      ),
                    )
                    .value,
                rippleColor: activeColor.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

typedef OnButtonPressCallback = void Function(int index);

class NavBarBody extends StatelessWidget {
  final List<BarItem> buttons;
  final int selectedIndex;
  final double iconSize;
  final Color? activeColor;
  final Color? inactiveColor;
  final OnButtonPressCallback onButtonPress;
  final Color backgroundColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;

  const NavBarBody({
    Key? key,
    required this.buttons,
    required this.selectedIndex,
    required this.iconSize,
    required this.activeColor,
    required this.inactiveColor,
    required this.onButtonPress,
    required this.backgroundColor,
    required this.fontWeight,
    required this.fontSize,
    required this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double bottomPading = MediaQuery.of(context).padding.bottom;
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 60 + bottomPading,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons.map(
          (BarItem item) {
            final int buttonIndex = buttons.indexOf(item);
            return NavBarButton(
              customButton: item.customButton,
              icon: item.icon ?? Icons.home,
              size: iconSize,
              title: item.title,
              activeColor: item.activeColor ?? activeColor!,
              inactiveColor: item.inactiveColor ?? inactiveColor!,
              index: buttonIndex,
              isSelected: buttonIndex == selectedIndex ? true : false,
              onTap: onButtonPress,
              slidingCardColor: backgroundColor,
              itemCount: buttons.length,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            );
          },
        ).toList(),
      ),
    );
  }
}
