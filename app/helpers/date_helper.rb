module DateHelper
  
  def human_date(date)
    time_tag(date.to_date)
  end

  def human_date_time(date)
    date.strftime("%A %B %d, %Y")
  end  

end