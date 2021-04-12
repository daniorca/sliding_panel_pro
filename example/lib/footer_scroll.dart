import 'package:flutter/material.dart';
import 'package:sliding_panel_pro/sliding_panel_pro.dart';

class FooterAndScroll extends StatefulWidget {
  @override
  _FooterAndScrollState createState() => _FooterAndScrollState();
}

class MyListItem extends StatefulWidget {
  final String name;

  MyListItem({this.name});

  @override
  _MyListItemState createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      title: Text(
        widget.name,
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: Icon(
        Icons.check_circle,
        color: selected ? Colors.blue : null,
      ),
    );
  }
}

class _FooterAndScrollState extends State<FooterAndScroll> {
  PanelController pc;

  static final List<String> food = [
    'Pizza',
    'Sandwich',
    'Pasta',
    'Punjabi',
    'Burger',
    'Shakes',
    'Noodles'
  ];

  List<MyListItem> foodItems;

  @override
  void initState() {
    super.initState();

    foodItems = List.generate(
      food.length,
      (index) => MyListItem(
        name: food[index],
      ),
    );

    pc = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaxWidth and FooterWidget'),
      ),
      body: SlidingPanel(
        panelController: pc,
        backdropConfig: BackdropConfig(
          enabled: true,
          opacity: 0.25,
        ),
        decoration: PanelDecoration(
          margin: EdgeInsets.all(8),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        content: PanelContent(
          panelContent: foodItems,
          headerWidget: PanelHeaderWidget(
            headerContent: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Selection',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            decoration: PanelDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            options: PanelHeaderOptions(centerTitle: true),
          ),
          footerWidget: PanelFooterWidget(
            footerContent: ButtonBar(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    pc.close();
                  },
                  child: Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    pc.close();
                  },
                  child: Text('CANCEL'),
                ),
              ],
            ),
            decoration: PanelDecoration(
              backgroundColor: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          bodyContent: Center(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'This is the example of panel, having a PanelFooterWidget.\nThis also uses PanelMaxWidth.',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    child: Text("Open panel"),
                    onPressed: () {
                      pc.expand();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        isTwoStatePanel: true,
        size: PanelSize(closedHeight: 0.0, expandedHeight: 0.9),
        autoSizing: PanelAutoSizing(autoSizeExpanded: true),
        //
        maxWidth: PanelMaxWidth(landscape: 400, portrait: 350),
        // if the device comes to landscape mode, it can take maximum 400 pixels width.
        // if portrait, max it to 350.
        //
        duration: Duration(milliseconds: 750),
        parallaxSlideAmount: 0.0,
      ),
    );
  }
}