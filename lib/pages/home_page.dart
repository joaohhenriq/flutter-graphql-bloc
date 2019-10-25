import 'package:flutter/material.dart';
import 'package:flutter_graphql_bloc/bloc/location_bloc.dart';
import 'package:flutter_graphql_bloc/models/location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationBloc _locationBloc;
  Widget _futureWidget = Container();

  @override
  void didChangeDependencies() {
    _locationBloc = LocationBloc();
    _futureWidget = _buildFutureWidget();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Locations"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: _futureWidget,
      ),
    );
  }

  Widget _buildFutureWidget() {
    return FutureBuilder<List<LocationModel>>(
      future: _locationBloc.getLocations(2),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error : ${snapshot.error}'));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              LocationModel location = snapshot.data[index];
              return ListTile(
                title: Text(location.name),
              );
            },
          );
        }
      },
    );
  }
}
