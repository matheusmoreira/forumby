module ListHelper

  def list_for(resource, collection)
    render :partial => "#{resource.to_s}/list", :collection => collection
  end

end
