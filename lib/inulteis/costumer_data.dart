class Costumer {
  final String fullName;
  final String email;

  const Costumer({this.fullName, this.email});
}

const kCostumer = const <Costumer>[
    const Costumer(
      fullName: 'Romain Hoogmoed',
      email:'romain.hoogmoed@example.com'
    ),
    const Costumer(
      fullName: 'Emilie Olsen',
      email:'emilie.olsen@example.com'
    )
];