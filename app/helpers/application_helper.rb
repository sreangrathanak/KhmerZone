module ApplicationHelper
  def full_title title
    base_title = "KhmerZone"
    if title.blank?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end

  def user_image_profile user, options={size:"big",border:"thumbnail",id:""}
    image_tag(user.image? ? user.image.url : "profile_default.png",
    class:"user_#{options[:size]}_image img-#{options[:border]}",id:"#{options[:id]}")
  end

  def user_image_cover user
    image_tag(user.cover? ? user.cover.url : "user_default_cover.jpg",
    class:"user_cover img-rounded")
  end
end
