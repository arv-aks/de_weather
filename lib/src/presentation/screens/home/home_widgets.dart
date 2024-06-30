import 'package:de_weather/src/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeUtils{

 static Future<void> showLocationServiceDialog(
      BuildContext context, bool mounted) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Constants.locationDisabled),
          content: Text(Constants.pleaseEnableLocation),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(Constants.openSettings),
            ),
          ],
        );
      },
    );
  }

   static void permissionDialog(
      BuildContext context,
      GlobalKey<State<StatefulWidget>> permissionDialogKey,
      bool mounted,
      bool isGettingUserPosition,
      bool? showDataFromSavedCities) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          key: permissionDialogKey,
          title: Text(Constants.locationServicesDisabled),
          content: Text(Constants.locationEnable),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();

                getPosition(context, mounted, permissionDialogKey,
                    isGettingUserPosition, showDataFromSavedCities);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(Constants.okay),
                  ),
                  GestureDetector(
                    onTap: () {
                      // exit(0);
                    },
                    child: Text(Constants.cancel),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
  
 static Future<void> getPosition(
      BuildContext context,
      bool mounted,
      GlobalKey<State<StatefulWidget>> permissionDialogKey,
      bool isGettingUserPosition,
      bool? showDataFromSavedCities) async {
    try {
      await getUserPosition(
          isGettingUserPosition, context, mounted, showDataFromSavedCities);
    } catch (e) {
      if (mounted) {
        permissionDialog(context, permissionDialogKey, mounted,
            isGettingUserPosition, showDataFromSavedCities);
      }
    }
  }
  
  static Future<void> getUserPosition(
      bool isGettingUserPosition,
      BuildContext context,
      bool isMounted,
      bool? showDataFromSavedCities) async {
    if (isGettingUserPosition) {
      return;
    }
    isGettingUserPosition = true;
    try {
      if (!await Geolocator.isLocationServiceEnabled()) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) return;

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
  

      if (isMounted) {
        if (showDataFromSavedCities == false) {
          // final weatherCityBloc = BlocProvider.of<WeatherCn>(context);
          // weatherCityBloc.add(GetCurrentCityWeatherInfo(place.locality!));
        }
      }
    } finally {
      isGettingUserPosition = false;
    }
  }
}