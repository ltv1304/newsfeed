module ApplicationHelper
  # Возвращает имя для стиля bootstrap в зависимости от типа flash
  def get_flash_style(style)
    case style
    when 'alert'
      'danger'
    when 'notice'
      'info'
    else
      style
    end
    
  end
end
