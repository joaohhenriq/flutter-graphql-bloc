import 'package:flutter_graphql_bloc/models/location.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config.dart';

class LocationService {

  Future<List<LocationModel>> getLocations(int page) async {
    List<LocationModel> location = [];

    QueryResult result = await Config.client.query(
        QueryOptions(
          document:
          """
            query{
              locations(page: $page){
                info {
                  count
                  pages
                }
                results {
                  id
                  name
                }
              }
            }
          """,
        )
    );

    List list = result.data["locations"]["results"] as List;
    location = list.map<LocationModel>((location) => LocationModel.fromJson(location)).toList();

    return location;
  }
}