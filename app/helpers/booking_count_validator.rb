class BookingCountValidator < ActiveModel::Validator
  def validate(book)
    unless book.course.spots > book.course.bookings.count
      book.errors[:course] << "has no more spots left!"
    end
  end
end
