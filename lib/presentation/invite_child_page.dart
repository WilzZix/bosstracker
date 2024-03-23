import 'package:bosstracker/application/routing/routing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class InviteChildPage extends StatefulWidget {
  const InviteChildPage({super.key});

  @override
  State<InviteChildPage> createState() => _InviteChildPageState();
}

class _InviteChildPageState extends State<InviteChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: InviteChildScreen(),
        ),
      ),
    );
  }
}

class InviteChildScreen extends StatelessWidget {
  const InviteChildScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/logo-1.svg',
          height: 34,
        ),
        const SizedBox(height: 30),
        SvgPicture.asset('assets/icons/invite_child_image.svg'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Войдите с телефона ребёнка в приложения Boss Traacker и введите код чтобы связать с родителем',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 63,
          width: 178,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: const Color(0xFFFF0000),
              )),
          child: const Center(
            child: Text(
              'FDA42A',
              style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          height: 132.5,
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<RoutingBloc>(context)
                .add(ChangeScreenEvent(6));
            //  context.go('/success_page');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 51,
              width: 343,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFDE69),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Пригласить ребёнка',
                  style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Техподдержка 99 634 06 57',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF575757),
          ),
        )
      ],
    );
  }
}
