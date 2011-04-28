module FormHelper

  def edit_form_for(*args)
    render_form :edit, *args
  end

  def new_form_for(*args)
    render_form :new, *args
  end

  private

  def render_form(verb, resource, partial = 'form')
    verb, resource = verb.to_s, resource.to_s.pluralize
    render :partial => partial, :locals  => { :submit => t("#{resource}.#{verb}.form.submit") }
  end

end
