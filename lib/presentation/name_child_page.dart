import 'package:bosstracker/application/routing/routing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NameChildPage extends StatefulWidget {
  const NameChildPage({super.key});

  @override
  State<NameChildPage> createState() => _NameChildPageState();
}

class _NameChildPageState extends State<NameChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NameChildScreen(),
      ),
    );
  }
}

class NameChildScreen extends StatelessWidget {
  const NameChildScreen({
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
                  const Row(
                    children: [
                      Text(
                        'Как зовут ващу дочь',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Spacer(),
                      Icon(Icons.clear)
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      hintText: 'Введите имя ребёнка',
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<RoutingBloc>(context)
                          .add(ChangeScreenEvent(3));
                      //context.go('/choose_picture');
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
                            'Далее',
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
