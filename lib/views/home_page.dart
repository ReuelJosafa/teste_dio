import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_dio/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchAllProducts();
  }

  void addProductAlertDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return const AlertDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchAllProducts();
        },
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, widget) {
              return controller.products.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: ((context, index) {
                        final product = controller.products[index];
                        return ListTile(
                          leading: Text(product.id.toString()),
                          title: Text(product.nome ?? ''),
                          trailing: Text('R\$' +
                              product.valor!.toStringAsFixed(2).toString()),
                        );
                      }))
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
