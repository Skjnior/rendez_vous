import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/date_symbol_data_local.dart';

class PriseRendezVous extends StatefulWidget {
  const PriseRendezVous({Key? key}) : super(key: key);

  @override
  State<PriseRendezVous> createState() => _PriseRendezVousState();
}

class _PriseRendezVousState extends State<PriseRendezVous> {
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    initializeDateFormatting('fr_FR', null);

    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    DateTime first = now;
    DateTime tomorrow = now.add(const Duration(days: 1));
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back),
              ),
              title: const Text('Reservation rendez-vous'),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                      child: buildCardDocteur(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 0.5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  flex: 6,
                  child: BookingCalendar(
                    bookingService: mockBookingService,
                    convertStreamResultToDateTimeRanges:
                        convertStreamResultMock,
                    getBookingStream: getBookingStreamMock,
                    uploadBooking: uploadBookingMock,
                    pauseSlots: generatePauseSlots(),
                    // pauseSlotText: 'LUNCH',
                    hideBreakTime: false,
                    loadingWidget: const Text('Fetching data...'),
                    uploadingWidget: const CircularProgressIndicator(),
                    locale: 'fr_FR',
                    startingDayOfWeek: StartingDayOfWeek.tuesday,
                    wholeDayIsBookedWidget:
                        const Text('Sorry, for this day everything is booked'),
                    //disabledDates: [DateTime(2023, 1, 20)],
                    //disabledDays: [6, 7],
                  ),
                )
              ],
            )));
  }

  Widget buildRond(
      {double dim = 40,
      double border = 30,
      required dynamic icon,
      Color couleur = Colors.black,
      double opac = 0.1}) {
    return Container(
      height: dim,
      width: dim,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        color: couleur.withOpacity(opac),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon],
      ),
    );
  }

  Widget buildCardDocteur() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/cellou.jpg'))),
                  ),
                ),
                Positioned(
                  height: 120,
                  width: 141,
                  child: Icon(
                    Icons.verified,
                    color: Colors.blue.shade700,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Jane Cooper",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Dentiste",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 17),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        "New York",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.trending_up),
                      Text(
                        "20+",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
