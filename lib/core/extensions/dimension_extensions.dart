extension AdaptiveDimension on num {
  /// takes either the current screen width or the height and the actual
  /// dimension you need to use and returns you the equivalent of the
  /// actualDimension for your current viewport
  ///
  /// e.g
  ///
  /// LayoutBuilder(
  ///       builder: (context, constraints) {
  ///         return Scaffold(
  ///           body: Container(
  ///             padding: EdgeInsets.symmetric(
  ///               vertical: Dimensions.call(
  ///                   height: constraints.maxHeight,
  ///                   actualDimension: 20,
  ///               ),
  ///               horizontal: Dimensions.call(
  ///                 width: constraints.maxWidth,
  ///                 actualDimension: 20,
  ///               ),
  ///             ),
  ///           ),
  ///         );
  ///       },
  ///     );
  ///
  /// the [width] is usually given when the dimension you are trying to set
  /// is a horizontal one, like a padding to the left or right, or a container
  /// width, or a radius.
  ///
  /// whereas the [height] is usually given when the dimension you are trying
  /// to set is a vertical one, like a padding to the top or bottom, or a
  /// container height, or a text fontSize.

  double adapt([double? width, double? height]) {
    assert(
      width != null || height != null,
      'Must give either the screen height or width',
    );
    assert(
      width == null || height == null,
      'Cannot give both the screen width and height, remove one of them and '
      'read the documentation for this method',
    );

    final operand = width ?? height!;
    if (operand == double.infinity) {
      throw IncorrectUseOfAdaptMethod(
          "Don't use adapt in a ListView or anything that asks for unbounded space");
    }
    final factor = operand / this;
    return operand / factor;
  }
}

class IncorrectUseOfAdaptMethod implements Exception {
  final String message;

  IncorrectUseOfAdaptMethod(this.message);

  @override
  String toString() {
    return 'IncorrectUseOfAdaptMethod: $message';
  }
}
