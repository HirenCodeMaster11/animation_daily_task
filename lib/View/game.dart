import 'dart:math';
import 'package:flutter/material.dart';

class FruitGameHome extends StatefulWidget {
  @override
  _FruitGameHomeState createState() => _FruitGameHomeState();
}

class _FruitGameHomeState extends State<FruitGameHome> {
  final Map<String, bool> fruitDropped = {
    'apple': false,
    'banana': false,
    'orange': false,
  };

  late List<String> fruits;
  late List<String> baskets;

  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _shufflePositions();
  }

  void _shufflePositions() {
    fruits = fruitDropped.keys.toList()..shuffle(random);
    baskets = fruitDropped.keys.toList()..shuffle(random);
  }

  void _onFruitDropped(String fruit) {
    setState(() {
      fruitDropped[fruit] = true;
      _shufflePositions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Drag-and-Drop Game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Fruits Row
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: fruits
                  .where((fruit) => !fruitDropped[fruit]!)
                  .map(
                    (fruit) => Draggable<String>(
                  data: fruit,
                  feedback: FruitIcon(
                    fruitName: fruit,
                    isDragging: true,
                  ),
                  childWhenDragging: Opacity(
                    opacity: 0.5,
                    child: FruitIcon(fruitName: fruit),
                  ),
                  child: FruitIcon(fruitName: fruit),
                ),
              )
                  .toList(),
            ),
          ),
          // Baskets Row
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: baskets.map(
                    (basket) {
                  return DragTarget<String>(
                    onAccept: (data) {
                      if (data == basket) {
                        _onFruitDropped(data);
                      }
                    },
                    builder: (context, candidateData, rejectedData) {
                      return BasketWidget(
                        fruitName: basket,
                        isDropped: fruitDropped[basket]!,
                        hasFruit: candidateData.isNotEmpty,
                      );
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FruitIcon extends StatelessWidget {
  final String fruitName;
  final bool isDragging;

  const FruitIcon({Key? key, required this.fruitName, this.isDragging = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fruitImages = {
      'apple':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/1200px-Red_Apple.jpg',
      'banana':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Banana-Single.jpg/1200px-Banana-Single.jpg',
      'orange':
      'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg',
    };

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDragging ? Colors.greenAccent : Colors.green,
      ),
      child: Image.network(
        fruitImages[fruitName]!,
        height: 70,
        width: 70,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BasketWidget extends StatelessWidget {
  final String fruitName;
  final bool isDropped;
  final bool hasFruit;

  const BasketWidget({
    Key? key,
    required this.fruitName,
    required this.isDropped,
    required this.hasFruit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basketColors = {
      'apple': Colors.red[300],
      'banana': Colors.yellow[300],
      'orange': Colors.orange[300],
    };

    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: basketColors[fruitName],
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: isDropped
          ? Icon(Icons.check, color: Colors.green, size: 50)
          : hasFruit
          ? Icon(Icons.question_mark, size: 50, color: Colors.white)
          : Text(
        'Drop $fruitName Here',
        style: TextStyle(color: Colors.white, fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
