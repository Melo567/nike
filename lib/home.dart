import 'package:flutter/material.dart';
import 'package:nike/models/couleur.dart';
import 'package:nike/models/gender.dart';
import 'package:nike/widgets/menu.dart';
import 'package:nike/widgets/menu_color.dart';
import 'package:nike/widgets/product_card.dart';
import 'package:nike/widgets/responive_view.dart';

import 'models/filter.dart';
import 'models/price.dart';
import 'models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<Product> articles = [...products];

  List<Filter> filters = [];

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      tablet: _tabletView(context),
      desktop: _desktopView(context),
    );
  }

  ///Mobile view
  Widget _mobileView(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: drawer(),
      ),
      drawerEnableOpenDragGesture: false,
      appBar: _appBar(),
      body: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.55,
        crossAxisSpacing: 6,
        children: articles
            .map((e) => ProductCard(
                  product: e,
                ))
            .toList(),
      ),
    );
  }

  ///Mobile view
  Widget _tabletView(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBarTablet(),
      endDrawer: Drawer(
        width: 380,
        child: drawer(isTablet: true),
      ),
      body: articles.isEmpty
          ? const Center(
              child: Text("Pas d'articles"),
            )
          : GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 0.55,
              crossAxisSpacing: 10,
              children: articles
                  .map((e) => ProductCard(
                        product: e,
                      ))
                  .toList(),
            ),
    );
  }

  ///Desktop view
  Widget _desktopView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 1600,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                child: Text(
                  _textAppBarNotMobile(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1600,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: drawer(
                    isDesktop: true,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: articles.isEmpty
                    ? const Center(
                        child: Text("Pas d'articles"),
                      )
                    : GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 10,
                        children: articles
                            .map((e) => ProductCard(
                                  product: e,
                                ))
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 120,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _topTextAppbarMobile(),
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            _bottomTextAppbarMobile(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  AppBar _appBarTablet() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      centerTitle: false,
      title: Text(
        _textAppBarNotMobile(),
        style: Theme.of(context).textTheme.headline4,
      ),
      actions: [
        IconButton(
          onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget drawer({
    bool isDesktop = false,
    bool isTablet = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Menu<Gender>(
                  label: 'Sexe',
                  answers: genders,
                  initialValue: lastFilter<Gender>(filters),
                  onChange: (List<Gender> values) {
                    updateState<Gender>(values);
                    actionFilter();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.7),
                    thickness: 0.7,
                  ),
                ),
                Menu<Price>(
                  label: 'Recherche par prix',
                  answers: prices,
                  initialValue: lastFilter<Price>(filters),
                  onChange: (List<Price> values) {
                    updateState<Price>(values);
                    actionFilter();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.7),
                    thickness: 0.7,
                  ),
                ),
                MenuColor(
                  colors: colors,
                  initialValues: lastFilter<Couleur>(filters),
                  onChange: (List<Couleur> values) {
                    updateState<Couleur>(values);
                    actionFilter();
                  },
                )
              ],
            ),
          ),
          isDesktop
              ? Container()
              : Positioned(
                  top: 10,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.closeEndDrawer();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                  ),
                ),
          isDesktop
              ? Container()
              : Positioned(
                  bottom: 0,
                  child: Container(
                    width: isTablet ? 380 : MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                filters.clear();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: const StadiumBorder(),
                              side: BorderSide(
                                color: Colors.grey.withAlpha(100),
                              ),
                              elevation: 0,
                              minimumSize: const Size(180, 48),
                            ),
                            child: Text(
                              'Effacer ${deleteText(filters)}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (filters.isEmpty) {
                                reset();
                              } else {
                                actionFilter();
                              }
                              scaffoldKey.currentState!.closeEndDrawer();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const StadiumBorder(),
                                elevation: 0,
                                minimumSize: const Size(180, 48)),
                            child: const Text(
                              'Appliquer',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  String deleteText(List<Filter> filters) =>
      filters.isNotEmpty ? '(${filters.length})' : '';

  void filterWithGender(List<Filter> filters) {
    filters.retainWhere((element) => element is Gender);
    if (filters.isEmpty) {
      reset();
    } else {
      final genderFilter = filters.map((e) => (e as Gender).value).toList();
      final temps = [...products];
      temps.retainWhere(
          (element) => genderFilter.contains(element.sexe.toLowerCase()));
      setState(() {
        articles = temps;
      });
    }
  }

  void filterWithPrice(List<Filter> filters) {
    filters.retainWhere((element) => element is Price);
    if (filters.isNotEmpty) {
      final List<Product> temps = [];
      for (int index = 0; index < filters.length; index++) {
        final price = filters[index] as Price;
        for (int j = 0; j < articles.length; j++) {
          if (price.min <= articles[j].price &&
              price.max >= articles[j].price) {
            temps.add(articles[j]);
          }
        }
      }
      setState(() {
        articles = temps;
      });
    }
  }

  void filterWithColor(List<Filter> filters) {
    filters.retainWhere((element) => element is Couleur);
    if (filters.isNotEmpty) {
      articles.retainWhere((element) => containOneOrMore(
          element.colors, filters.map((e) => e as Couleur).toList()));
      setState(() {});
    }
  }

  bool containOneOrMore(List<String> colors, List<Couleur> couleurs) {
    final temps = couleurs.map((e) => e.label.toLowerCase());
    for (final temp in temps) {
      if (colors.contains(temp)) return true;
    }
    return false;
  }

  void updateState<T extends Filter>(List<T> values) {
    setState(() {
      filters.removeWhere((element) => element is T);
      filters.addAll(values);
      filters = filters.toSet().toList();
    });
  }

  List<T> lastFilter<T extends Filter>(List<Filter> filters) {
    final genders = [...filters];
    genders.retainWhere((element) => element is T);
    return genders.map((e) => e as T).toList();
  }

  void reset() {
    setState(() {
      articles = [...products];
    });
  }

  void actionFilter() {
    filterWithGender([...filters]);
    filterWithPrice([...filters]);
    filterWithColor([...filters]);
  }

  String _textAppBarNotMobile() {
    List<Couleur> colors = [];
    List<Gender> genders = [];
    List<Price> prices = [];
    for (final filter in filters) {
      if (filter is Couleur) {
        colors.add(filter);
      } else if (filter is Price) {
        prices.add(filter);
      } else if (filter is Gender) {
        genders.add(filter);
      }
    }
    final String gender = genders.length == 1 ? ' ${genders.first.label}' : '';
    final String price = prices.length == 1 ? ' ${prices.first.label}' : '';
    final String color = colors.length == 1 ? ' ${colors.first.label}' : '';
    final String number = articles.isEmpty ? '' : ' (${articles.length})';
    return 'Nouveautés$gender$price$color$number';
  }

  String _topTextAppbarMobile() {
    List<Gender> genders = [];
    for (final filter in filters) {
      if (filter is Gender) {
        genders.add(filter);
      }
    }
    final String gender = genders.length == 1 ? ' ${genders.first.label}' : '';
    return 'Nouveautés$gender';
  }

  String _bottomTextAppbarMobile() {
    List<Couleur> colors = [];
    List<Price> prices = [];
    for (final filter in filters) {
      if (filter is Couleur) {
        colors.add(filter);
      } else if (filter is Price) {
        prices.add(filter);
      }
    }
    final String price = prices.length == 1 ? ' ${prices.first.label}' : '';
    final String color = colors.length == 1 ? ' ${colors.first.label}' : '';
    final String number = articles.isEmpty ? '' : ' (${articles.length})';
    return '$price$color$number';
  }
}
