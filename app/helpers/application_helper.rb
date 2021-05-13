module ApplicationHelper
  def fa_icon(icon, text = "")
    "<i class='fas fa-#{icon}'></i> #{text}".html_safe
  end
end
