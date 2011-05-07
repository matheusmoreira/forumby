module ListHelper

  def list_for(resource, collection, partial = 'list')
    render :partial => "#{resource.to_s}/#{partial.to_s}", :collection => collection
  end

end
