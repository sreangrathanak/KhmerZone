module ApplicationHelper
  def full_title title
    base_title = "KhmerZone"
    if title.blank?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
  def product_image picture, options={size:"320X150"}
    image_tag(picture ? picture.path.url : "http://placehold.it/320x150",      
    class:"pro_image_#{options[:size]}")
  end

  def user_image_profile user, options={size:"big",border:"thumbnail",id:""}
    image_tag(user.image? ? user.image.url : "profile_default.png",
    class:"user_#{options[:size]}_image img-#{options[:border]}",id:"#{options[:id]}")
  end

  def user_image_cover cover, options={size:""}
    image_tag(cover ? cover.path.url : "user_default_cover.jpg",
    class:"user_cover img-rounded user_cover_#{options[:size]}")
  end

  def link_to_add_fields(name,f,association)
    new_object=f.object.send(association).klass.new
    id=new_object.object_id
    fields=f.fields_for(association,new_object,child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to name,"#",class:"add_fields", 
      data: {id:id,fields: fields.gsub("\n","")}
  end
end
