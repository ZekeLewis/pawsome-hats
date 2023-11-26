module ApplicationHelper
  def active_class(path)
    if request.path == path
      'active'
    else
      ''
    end
  end

  BOOTSTRAP_ALERT_CLASS = {
    'success' => 'alert-success',
    'error'   => 'alert-danger',
    'notice'  => 'alert-info',
    'alert'   => 'alert-danger',
    'warn'    => 'alert-warning'
  }.freeze

  def flash_class(level)
    BOOTSTRAP_ALERT_CLASS[level]
  end


  def active_class(path)
    if request.path == path
      return 'active'
    else
      return ''
    end
  end
 

end
