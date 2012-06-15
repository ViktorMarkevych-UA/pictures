module EventHelper
  def nice_params(obj)
    case obj.eventtable_type
    when "Like"
      { :user => obj.eventtable.user.email, :url => picture_path(obj.eventtable.picture_id), :link=> "picture", :description_1 =>"appreciated the", :description_2 =>"with its id", :data => obj.eventtable.picture_id}
    when "User"
      { :user => obj.eventtable.email, :url => "", :link => "", :description_1 => obj.eventtable_body, :description_2 =>"in", :data => obj.created_at}
    when "Comment"
      {:user => obj.eventtable.user.email, :url => "", :link=> "", :description_1 => "", :description_2 =>"wrote", :data => obj.eventtable_body}
    when "Navigation"
      {:user => "", :url => "", :link=> "", :description_1 => "", :description_2 =>"", :data => obj.eventtable_body}
    else
      {}
    end
  end
end
