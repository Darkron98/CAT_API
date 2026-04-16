import 'package:flutter/material.dart';

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
