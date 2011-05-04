module FormHelper

  def edit_form_for(*args)
    render_form :edit, *args
  end

  def new_form_for(*args)
    render_form :new, *args
  end

  private

  # render_form(:verb, *resources, options = {})
  def render_form(*args)
    verb = args.shift.to_s
    options = args.extract_options!
    resources = args.map { |arg| arg.to_s.pluralize }.join '.'
    render :partial => options.fetch(:partial, 'form'),
           :locals  => { :submit => t("#{resources}.#{verb}.form.submit") }
  end

end
