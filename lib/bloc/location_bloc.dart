import 'package:flutter_graphql_bloc/models/location.dart';
import 'package:flutter_graphql_bloc/services/location_service.dart';

class LocationBloc {
  final locationsService = LocationService();

  Future<List<LocationModel>> getLocations(int page) async{
    return await locationsService.getLocations(page);
  }

}