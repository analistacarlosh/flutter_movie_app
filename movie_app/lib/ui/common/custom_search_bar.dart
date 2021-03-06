import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    Key key,
    @required this.title,
    @required this.onTap,
    @required this.onClose,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final Function onClose;

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool searchMode = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(flex: 5, child: searchTitle()),
          Flexible(
            flex: 1,
            child: IconButton(
              icon: icon(),
              onPressed: () {
                if (searchMode) {
                  widget.onClose();
                }
                setState(() => searchMode = !searchMode);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget icon() {
    if (!searchMode) {
      return Icon(Icons.search);
    }
    return Icon(Icons.close);
  }

  Widget searchTitle() {
    if (!searchMode) {
      return Container(
        child: Text(widget.title,
            key: const Key('custom_search_bar_title'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            )),
      );
    }

    return TextField(
      key: const Key('custom_search_bar_text'),
      textInputAction: TextInputAction.done,
      style: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        hintText: 'Type to search for movies',
        hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
      onChanged: (value) {
        if (value.length >= 3) widget.onTap(value);
      },
    );
  }
}
