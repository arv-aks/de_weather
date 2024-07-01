
import 'package:auto_route/auto_route.dart';
import 'package:de_weather/src/infrastructure/model/location/location.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Places> placesList = [
    Places(name: 'Shimla', location: Location(lat: 31.1048, long: 77.1734)),
    Places(name: 'Mumbai', location: Location(lat: 19.0760, long: 72.8777)),
    Places(name: 'Bangalore', location: Location(lat: 12.9716, long: 77.5946)),
    Places(name: 'Kolkata', location: Location(lat: 22.5726, long: 88.3639)),
    Places(name: 'Chennai', location: Location(lat: 13.0827, long: 80.2707)),
    Places(name: 'Hyderabad', location: Location(lat: 17.3850, long: 78.4867)),
    Places(name: 'Pune', location: Location(lat: 18.5204, long: 73.8567)),
    Places(name: 'Ahmedabad', location: Location(lat: 23.0225, long: 72.5714)),
    Places(name: 'Jaipur', location: Location(lat: 26.9124, long: 75.7873)),
    Places(name: 'Lucknow', location: Location(lat: 26.8467, long: 80.9462)),
  ];

  List<Places> searchResult = [];

  @override
  void initState() {
    super.initState();
    searchResult.addAll(placesList);
    searchController.addListener(() {
      onChange();
    });
  }

  onChange() {
    setState(() {
      searchResult = placesList
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
             title:  const Text('Search', style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: searchController,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    context.router.push(WeatherRoute(place: searchResult[index]));
                         
                  },
                  title: Text(searchResult[index].name),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
