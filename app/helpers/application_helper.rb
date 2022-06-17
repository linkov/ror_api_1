module ApplicationHelper
  def local_time(time, opts={})
    if opts[:only_time]
      time.strftime("%H:%M:%S") rescue ''
    elsif opts[:only_date]
      time.strftime("%b %d, %Y") rescue ''
    else
      time.strftime("%B %d, %Y %H:%M:%S") rescue ''
    end
  end
end
