
module FormHelper

  def render_edit_form_for(*args)
    render_form :edit, *args
  end

  def render_new_form_for(*args)
    render_form :new, *args
  end

  private

  def render_form(verb, resource, partial = 'form')
    render :partial => partial,
           :locals  => { :submit => t("#{resource.to_s.pluralize}.#{verb.to_s}.form.submit") }
  end

end
