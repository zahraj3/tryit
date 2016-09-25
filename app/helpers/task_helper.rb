module TaskHelper
  def status_to_class(status)
    case status
    when 'Done'
      'ok'
    when 'In process'
      'play'
    else
      'stop'
    end
  end
end
