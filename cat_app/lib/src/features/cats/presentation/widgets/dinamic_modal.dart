import 'package:flutter/material.dart';

/// ------------------------------------------------------------
/// Metodo: dinamicModal
/// ------------------------------------------------------------
/// Descripción:
/// Metodo que abre un botton sheet adaptable a su contenido
///
/// Parametros:
/// - body: Cuerpo del bottom sheet (Widget)
/// - tittle: Titulo del bottom sheet (String)
///
/// Proceso:
/// - Llama showModalBottomSheet
/// ------------------------------------------------------------
void dinamicModal(
  BuildContext context, {
  Widget? body,
  String? tittle,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    elevation: 0,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ModalContent(
      body: body,
      tittle: tittle,
    ),
  );
}

/// ------------------------------------------------------------
/// Widget: ModalContent
/// ------------------------------------------------------------
/// Descripcion:
/// estructura adaptada para ser renderizada en bottom sheets
///
/// Responsabilidad:
/// - Renderizar cuerpo dinamicamente en un bottom sheet
///
/// Parametros:
/// - body: Cuerpo del bottom sheet (Widget)
/// - tittle: titulo del bottom sheet (String)
///
/// Retorna:
/// Widget estructural
///
/// Dependencias:
/// - standalone
/// ------------------------------------------------------------
class ModalContent extends StatefulWidget {
  const ModalContent({
    super.key,
    this.body,
    this.tittle,
  });

  final Widget? body;
  final String? tittle;
  @override
  State<ModalContent> createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  Widget? body;
  String? tittle;

  @override
  void initState() {
    super.initState();
    body = super.widget.body;
    tittle = super.widget.tittle;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 200, 200),
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                const SizedBox(height: 15),
                if (widget.tittle != null) ...[
                  Text(
                    widget.tittle!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: widget.body ?? const SizedBox(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
