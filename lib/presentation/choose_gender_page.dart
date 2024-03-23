import 'package:bosstracker/application/routing/routing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ChooseGanderPage extends StatefulWidget {
  const ChooseGanderPage({super.key});

  @override
  State<ChooseGanderPage> createState() => _ChooseGanderPageState();
}

class _ChooseGanderPageState extends State<ChooseGanderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChooseGenderScreen(),
      ),
    );
  }
}

class ChooseGenderScreen extends StatelessWidget {
  const ChooseGenderScreen({
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
                        'У вас сын или дочка',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Spacer(),
                      Icon(Icons.clear)
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/icons/image10.svg'),
                            const Text('Boy')
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/icons/image11.svg'),
                            const Text('Girl')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<RoutingBloc>(context)
                          .add(ChangeScreenEvent(2));
                      // context.go('/choose_name');
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
