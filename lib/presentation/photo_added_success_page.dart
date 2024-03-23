import 'package:bosstracker/application/routing/routing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PhotoAddedSuccessPage extends StatefulWidget {
  const PhotoAddedSuccessPage({super.key});

  @override
  State<PhotoAddedSuccessPage> createState() => _PhotoAddedSuccessPageState();
}

class _PhotoAddedSuccessPageState extends State<PhotoAddedSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PhotoAddedSuccessScreen(),
      ),
    );
  }
}

class PhotoAddedSuccessScreen extends StatelessWidget {
  const PhotoAddedSuccessScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/icons/logo-1.png'),
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
                  const SizedBox(height: 30),
                  const SizedBox(
                    height: 93,
                    width: 93,
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Загрузите фото ребёнка',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<RoutingBloc>(context)
                          .add(ChangeScreenEvent(5));
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFF0000),
                          borderRadius: BorderRadius.circular(36)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Готово',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
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
