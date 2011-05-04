module ListHelper

  def list_for(resource, collection, list = 'list')
    render :partial => "#{resource.to_s}/#{list}", :collection => collection
  end

end
