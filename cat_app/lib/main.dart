import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAWdex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var src = 'https://cdn2.thecatapi.com/images/h19-vtIeX.jpg';
    const title = 'Aegean';
    const subtitle = 'Greece';
    return Scaffold(
      body: CatCard(src: src, title: title, subtitle: subtitle),
    );
  }
}

class CatCard extends StatelessWidget {
  const CatCard({
    super.key,
    required this.src,
    required this.title,
    required this.subtitle,
  });

  final String src;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () => dinamicModal(
          context,
          tittle: title,
          body: CatDesc(src: src),
        ),
        child: Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade50,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 275,
                child: Image.network(
                  src,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 75,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CatDesc extends StatelessWidget {
  CatDesc({
    super.key,
    required this.src,
  });

  final String src;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(
            width: double.infinity,
            child: Image.network(src),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: double.infinity,
              height: 200, // 👈 importante: define altura
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 228, 228),
              ),
              child: Scrollbar(
                controller: _controller,
                thickness: 6,
                radius: const Radius.circular(5),
                thumbVisibility: true,
                child: GridView.builder(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemCount: 20, // 👈 simula datos
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columnas
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3, // 👈 hace que parezcan "filas de info"
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Info $index',
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade50,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(
                10,
              ),
            ),
          ),
          child: IntrinsicHeight(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 200, 200),
                    borderRadius: BorderRadius.circular(2.5)),
              ),
              const SizedBox(height: 15),
              if (tittle != null) ...[
                Text(
                  tittle!,
                  style: const TextStyle(
                    //color: ColorPalette.textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
              ],
              body ?? const SizedBox(),
              Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: const SizedBox(height: 10),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
