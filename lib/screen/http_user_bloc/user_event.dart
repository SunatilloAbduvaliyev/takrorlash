import '../../data/model/book_model/book_model.dart';

abstract class BookEvent{}

class GetAllBookEvent extends BookEvent{}

class DeleteBookEvent extends BookEvent{
  final String uuid;
  DeleteBookEvent({required this.uuid});
}
class UpdateBookEvent extends BookEvent{
  final BookModel updateData;
  UpdateBookEvent({required this.updateData});
}
class InsertBookEvent extends BookEvent{
  final BookModel insertData;
  InsertBookEvent({required this.insertData});
}


