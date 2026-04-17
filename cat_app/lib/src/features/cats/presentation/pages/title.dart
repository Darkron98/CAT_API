import 'package:cat_app/src/core/utils/style/colors.dart';
import 'package:flutter/material.dart';

/// ------------------------------------------------------------
/// Widget: TitleView
/// ------------------------------------------------------------
/// Descripcion:
/// Cuerpo de pagina de titulo
///
/// Responsabilidad:
/// - Renderizar cuerpo de pagina de titulo
///
/// Retorna:
/// Widget visual tipo portada
///
/// Dependencias:
/// - standalone
/// ------------------------------------------------------------
class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.popAndPushNamed(context, 'home'),
      child: SafeArea(
        child: Scaffold(
          key: const Key('Title'),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: const [
                    Icon(
                      Icons.pets,
                      size: 150,
                      color: Color(0xFF2196F3),
                    ),
                    Text(
                      'PAW dex',
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.textColor),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Tap to continue',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
