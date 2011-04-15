module FormHelper

  def render_edit_form_for(resource)
    render_form :edit, resource
  end

  def render_new_form_for(resource)
    render_form :new, resource
  end

  private

  def render_form(verb, resource, partial = 'form')
    render :partial => partial,
           :locals  => { :submit => t("#{resource.to_s}.#{verb.to_s}.form.submit") }
  end

end
