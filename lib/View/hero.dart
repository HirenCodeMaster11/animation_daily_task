import 'package:animation_daily_task/View/hero2.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Animals',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: animalName.length,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HeroAnimation2(index: index),));
                  },
                  child: Hero(
                    tag: index,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(animalPhoto[index],
                          ),),
                      ),
                    ),
                  ),
                ),
                subtitle: Text(animalDescription[index],overflow: TextOverflow.ellipsis,maxLines: 3,style: TextStyle(color: Colors.grey.shade400),),
                title: Text(animalName[index],style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1.2,color: Colors.white),),
              ),
            ),
      ),
    );
  }
}

List<dynamic> animalName = [
  "Lion",
  "Elephant",
  "Tiger",
  "Giraffe",
  "Monkey",
  "Zebra",
  "Fox",
  "Panda",
  "Peacock",
  "Parrot"
];

List<dynamic> animalPhoto = [
  'https://cdn.britannica.com/29/150929-050-547070A1/lion-Kenya-Masai-Mara-National-Reserve.jpg',
  'https://i.natgeofe.com/k/e7ba8001-23ac-457f-aedb-abd5f2fdda62/moms5_4x3.png',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqEgzMgLd6EF_Ou_4KBrGiu-V71ybGpJNA9Q&s',
  'https://cdn.britannica.com/55/75855-004-7CB8C9F0/giraffe-Kenya.jpg',
  'https://shop.wwf.ca/cdn/shop/files/Macaque.jpg?crop=center&height=1200&v=1694022235&width=1200',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Equus_quagga_burchellii_-_Etosha%2C_2014.jpg/1200px-Equus_quagga_burchellii_-_Etosha%2C_2014.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOJHgZRtno3BK-NtzSZRdxikRnw5N1deYXaw&s',
  'https://i.natgeofe.com/k/6f2282df-1c6a-474a-9216-ed97b3dce858/Panda-Bamboo_Panda-Quiz_KIDS_1021.jpg?wp=1&w=1084.125&h=721.875',
  'https://www.talking-birds.co.uk/wp-content/uploads/2022/07/The-Ultimate-Guide-To-Peacocks-1.jpg',
  'https://i0.wp.com/species360.org/wp-content/uploads/2022/04/1.jpg?fit=940%2C788&ssl=1',
];

List<String> animalDescription = [
  "Lions are large carnivores and the only cats that live in social groups called prides. Known as the 'king of the jungle,' they are found primarily in Africa. They are known for their powerful roars and magnificent manes.",
  "Elephants are the largest land animals, with long trunks and large ears. They are herbivores and play vital roles in ecosystems by helping to shape the environment. African elephants are larger, while Asian elephants are slightly smaller.",
  "Tigers are the largest species of big cat, recognized by their orange coats and black stripes. They are solitary hunters and are found primarily in Asia. Tigers are endangered due to habitat loss and poaching.",
  "Giraffes are the tallest land mammals, known for their long necks and legs. They are herbivores, feeding mainly on tree leaves. Native to sub-Saharan Africa, they are characterized by their unique coat patterns.",
  "Monkeys are intelligent primates, found in a wide range of habitats across the world. They are social animals and live in groups, often known as troops. Their diet is omnivorous, consisting of fruits, leaves, and small animals.",
  "Zebras are herbivores, closely related to horses, and are known for their black and white stripes. These animals are found in Africa and often form small family groups. Their stripes help them blend into the grasslands to avoid predators.",
  "Foxes are small carnivorous mammals, characterized by their sharp ears and bushy tails. They are found in a variety of habitats and are known for their intelligence and adaptability. Foxes are omnivorous, feeding on a wide range of food sources.",
  "Pandas are large bears native to China, mostly eating bamboo. They are known for their distinctive black-and-white fur and are symbolically important in Chinese culture. Pandas are endangered due to habitat loss.",
  "Peacocks are known for their extravagant tail feathers, which they fan out to attract mates. Native to South Asia, they are often considered symbols of beauty and grace. Peacocks are omnivores, eating seeds, insects, and small plants.",
  "Parrots are colorful, intelligent birds, known for their ability to mimic sounds. They are found in tropical and subtropical regions and are highly social animals. Many species are endangered due to habitat loss and the pet trade."
];
