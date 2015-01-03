module ApplicationHelper
  def full_title title
    base_title = "KhmerZone"
    if title.blank?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
end
