import 'package:leyli_travel_mozz/core/enum/seat_status.dart';
import 'package:leyli_travel_mozz/models/seat/seat_model.dart';

List<SeatModel> kSeats = [
  ...List.generate(6, (index) => SeatModel(status: SeatStatus.paid,),),
  ...List.generate(15, (index) => SeatModel(status: SeatStatus.selected,),),
  ...List.generate(15, (index) => SeatModel(status: SeatStatus.unselected,),),
  ...List.generate(15, (index) => SeatModel(status: SeatStatus.occupied,),),
];
