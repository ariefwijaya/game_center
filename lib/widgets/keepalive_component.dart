import 'package:flutter/material.dart';

class KeepAliveComponent extends StatefulWidget {
  const KeepAliveComponent({Key? key, required this.child, this.onInit})
      : super(key: key);

  final Widget child;
  final VoidCallback? onInit;

  @override
  _KeepAliveComponentState createState() => _KeepAliveComponentState();
}

class _KeepAliveComponentState extends State<KeepAliveComponent>
    with AutomaticKeepAliveClientMixin {
  bool shouldKeepAlive = true;

  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => shouldKeepAlive;
}
