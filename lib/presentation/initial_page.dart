import 'package:bosstracker/application/routing/routing_bloc.dart';
import 'package:bosstracker/application/routing/routing_bloc.dart';
import 'package:bosstracker/presentation/choose_gender_page.dart';
import 'package:bosstracker/presentation/choose_picture_page.dart';
import 'package:bosstracker/presentation/invite_child_page.dart';
import 'package:bosstracker/presentation/name_child_page.dart';
import 'package:bosstracker/presentation/photo_added_success_page.dart';
import 'package:bosstracker/presentation/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  LatLng? _currentPosition;
  bool _isLoading = true;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  List<Widget> screens = [
    const InitialScreen(),
    const ChooseGenderScreen(),
    const NameChildScreen(),
    const ChoosePhotoScreen(),
    const PhotoAddedSuccessScreen(),
    const InviteChildScreen(),
    const SuccessScreen()
  ];

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(20, 20)),
            "assets/icons/custom_marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  getLocation() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        icon: markerIcon,
        position: LatLng(lat, long),
      ),
    );
    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: markers,
                  initialCameraPosition: CameraPosition(
                    target: _currentPosition!,
                    zoom: 16.0,
                  ),
                ),
          BlocBuilder<RoutingBloc, RoutingState>(builder: (context, state) {
            if (state is RouteChangedState) {
              return SafeArea(
                child: screens[state.screenIndex],
              );
            }
            return SafeArea(
              child: screens[0],
            );
          }),
        ],
      ),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/icons/Group92.svg'),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFD857),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Image.asset('assets/icons/28203270_7291761.png'),
                  const SizedBox(height: 30),
                  const Text(
                    'Если вы беспокоитесь о своих детях, то добавьте прямо сейчас',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<RoutingBloc>(context)
                          .add(ChangeScreenEvent(1));
                      // context.go('/choose_gender');
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFF0000),
                          borderRadius: BorderRadius.circular(36)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Добавить ребёнка',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 16),
                          SvgPicture.asset('assets/icons/add_child_icon.svg'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 46)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
