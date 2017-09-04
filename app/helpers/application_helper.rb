module ApplicationHelper
  def date_words(start_date)
    if start_date.today?
      "Today"
    elsif start_date.to_date == Date.tomorrow
      "Tomorrow"
    elsif start_date < (DateTime.now + 7.day)
      days = start_date.day - DateTime.now.day
      if days == -1
        "Yesterday"
      elsif days < 0
        "#{-days} days ago"
      else
        "#{days} days"
      end
    end
  end
end
