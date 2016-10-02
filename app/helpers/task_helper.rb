module TaskHelper
  def s_to_ico(status)
    case status
    when 'Done'
      'ok'
    when 'In Process'
      'play'
    else
      'stop'
    end
  end

  def s_to_txt(status)
    case status
    when 'Done'
      'info'
    when 'In Process'
      'success'
    else
      'warning'
    end
  end
end
