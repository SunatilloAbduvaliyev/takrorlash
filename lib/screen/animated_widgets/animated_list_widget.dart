import 'package:flutter/material.dart';
class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}
class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final List<String> _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  void _addItem() {
    _items.insert(0, "items ${_items.length + 1}");
    _key.currentState!.insertItem(
      0, // Element ro'yxatning 0-indeksiga qo'shiladi
      duration: const Duration(
        seconds: 1, // Animatsiya davomiyligi 1 soniya
      ),
    );
  }

  void _removeItem(int index) {
    // Elementni o'chirish funksiyasi
    _key.currentState!.removeItem(
      index, // Qaysi indeksdagi element o'chirilishi belgilanadi
          (_, animation) {
        // Animatsiya uchun funksiya
        return SizeTransition(
          sizeFactor: animation, // Element o'chirilishi animatsiyasi
          child: const Card(
            margin: EdgeInsets.all(10), // Kartaning chet bo'sh joylari
            color: Colors.red, // Kartaning rangi qizil
            child: ListTile(
              title: Text(
                'Delete', // O'chirilgan element matni
                style: TextStyle(
                  color: Colors.red, // Matnning rangi qizil
                  fontSize: 20, // Matnning o'lchami 20
                ),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300), // O'chirilish animatsiyasi davomiyligi 300 millisekund
    );
    _items.removeAt(index); // Element ro'yxatdan o'chiriladi
  }

  @override
  Widget build(BuildContext context) {
    // Widgetning interfeysi quriladi
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20, // Ustun boshida bo'sh joy
          ),
          ElevatedButton(
            onPressed: _addItem, // Tugma bosilganda element qo'shiladi
            child: const Text("Item qo'shish"), // Tugma ichidagi matn
          ),
          Expanded(
            // Ustunning qolgan joyini egallaydi
            child: AnimatedList(
              key: _key, // AnimatedList holatini boshqaruvchi kalit
              initialItemCount: 0, // Boshlang'ich elementlar soni
              padding: const EdgeInsets.all(10), // Ro'yxat chet bo'sh joylari
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                // Ro'yxat elementlari qanday ko'rinishini aniqlaydi
                return SizeTransition(
                  sizeFactor: animation, // Qo'shilish animatsiyasi
                  key: UniqueKey(), // Har bir element uchun unikal kalit
                  child: Card(
                    margin: const EdgeInsets.all(10), // Kartaning chet bo'sh joylari
                    color: Colors.orangeAccent, // Kartaning rangi
                    child: ListTile(
                      title: Text(
                        _items[index], // Ro'yxat elementi matni
                        style: const TextStyle(
                          fontSize: 20, // Matn o'lchami
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _removeItem(index); // Tugma bosilganda element o'chiriladi
                        },
                        icon: const Icon(
                          Icons.delete, // Tugma ikonkasi
                          size: 24, // Ikonka o'lchami
                          color: Colors.red, // Ikonka rangi
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
