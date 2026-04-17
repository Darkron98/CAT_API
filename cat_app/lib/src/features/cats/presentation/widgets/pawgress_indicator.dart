import 'package:flutter/material.dart';

/// ------------------------------------------------------------
/// Widget: PawgressIndicator
/// ------------------------------------------------------------
/// Descripcion:
/// Indicador de progreso animado personalizado
///
/// Responsabilidad:
/// - Renderizar animacion personalizada
///
/// Retorna:
/// Widget visual animado tipo indicador de progreso
///
/// Dependencias:
/// - standalone
/// ------------------------------------------------------------
class PawgressIndicator extends StatefulWidget {
  const PawgressIndicator({super.key});

  @override
  State<PawgressIndicator> createState() => _PawgressIndicatorState();
}

class _PawgressIndicatorState extends State<PawgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> paw1;
  late Animation<double> paw2;
  late Animation<double> paw3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    paw1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    paw2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
      ),
    );

    paw3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _paw(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: const Icon(
          Icons.pets,
          size: 30,
          color: Colors.black54,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              _paw(paw1),
            ],
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _paw(paw2),
              const SizedBox(),
            ],
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              _paw(paw3),
            ],
          ),
        ],
      ),
    );
  }
}
