import 'package:flutter/material.dart';

class SeatSelectionWidget extends StatefulWidget {
  const SeatSelectionWidget({super.key});

  @override
  SeatSelectionWidgetState createState() => SeatSelectionWidgetState();
}

class SeatSelectionWidgetState extends State<SeatSelectionWidget> {
  List<Seat> seats = List.generate(36, (index) => Seat());

  void toggleSeatSelection(int index) {
    setState(() {
      seats[index].isSelected = !seats[index].isSelected;
    });
  }

  int getSelectedSeatsCount() {
    return seats.where((seat) => seat.isSelected).length;
  }

  double getTotalPrice() {
    return seats
        .where((seat) => seat.isSelected)
        .fold(0.0, (sum, seat) => sum + seat.price);
  }

  @override
  void initState() {
    super.initState();

    // Example: Mark some seats as reserved
    seats[5].isReserved = true;
    seats[10].isReserved = true;
    seats[15].isReserved = true;
  }

  @override
  Widget build(BuildContext context) {
    int selectedSeatsCount = getSelectedSeatsCount();
    double totalPrice = getTotalPrice();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            childAspectRatio: 1.2,
          ),
          itemCount: seats.length,
          itemBuilder: (context, index) {
            return SeatWidget(
              isSelected: seats[index].isSelected,
              isReserved: seats[index].isReserved,
              isAvailable: seats[index].isAvailable,
              onTap: () => toggleSeatSelection(index),
            );
          },
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BookingInfoWidget(
                  color: Color.fromARGB(255, 129, 199, 132),
                  label: 'Available',
              ),
              BookingInfoWidget(color: Colors.red, label: 'Reserved'),
              BookingInfoWidget(color: Colors.white, label: 'Selected'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  children: [
                    TextSpan(
                      text:
                      '\n$selectedSeatsCount seat${selectedSeatsCount == 1 ? '' : 's'}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                ),
                child: const Text(
                  'BOOK NOW',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class BookingInfoWidget extends StatelessWidget {
  final Color color;
  final String label;

  const BookingInfoWidget({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}

// model

class Seat {
  bool isAvailable;
  bool isSelected;
  bool isReserved;
  double price; // Add price attribute

  Seat({
    this.isAvailable = true,
    this.isSelected = false,
    this.isReserved = false,
    this.price = 29.99, // Default price for each seat
  });
}

// seat

class SeatWidget extends StatelessWidget {
  final bool isSelected;
  final bool isReserved;
  final bool isAvailable;
  final VoidCallback onTap;

  const SeatWidget({
    super.key,
    required this.isSelected,
    required this.isReserved,
    required this.isAvailable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    if (isSelected) {
      seatColor = Colors.white;
    } else if (isReserved) {
      seatColor = Colors.red;
    } else if (isAvailable) {
      seatColor = Colors.green[300]!;
    } else {
      seatColor = Colors.grey;
    }

    return GestureDetector(
        onTap: isAvailable && !isReserved ? onTap : null,
        child: Icon(
          Icons.chair,
          color: seatColor,
          size: 30,
        ));
  }
}
