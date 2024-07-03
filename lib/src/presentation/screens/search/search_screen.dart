import 'package:auto_route/auto_route.dart';
import 'package:de_weather/src/core/constants.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:de_weather/src/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  List<Places> searchResult = [];

  @override
  void initState() {
    super.initState();
    searchResult.addAll(PlacesConstants.placesList);
    searchController.addListener(() {
      onChange();
    });

    // _focusNode.requestFocus();
  }

  onChange() {
    setState(() {
      searchResult = PlacesConstants.placesList
          .where((place) => place.name
              .toLowerCase()
              .contains(searchController.text.trim().toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchWidget(
                focusNode: _focusNode,
                hintText: "Search",
                controller: searchController,
              ),
              Expanded(
                  child: ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      context.router
                          .push(WeatherRoute(place: searchResult[index]));
                    },
                    title: Text(searchResult[index].name),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
