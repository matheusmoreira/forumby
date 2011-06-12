module ApplicationHelper

  # Form Helpers

  def edit_form_for(*args)
    render_form :edit, *args
  end

  def new_form_for(*args)
    render_form :new, *args
  end

  # render_form(:verb, *resources, options = {})
  def render_form(*args)
    verb = args.shift.to_s
    options = args.extract_options!
    resources = args.map { |arg| arg.to_s.pluralize }.join '.'
    render :partial => options.fetch(:partial, 'form'),
           :locals  => { :submit => t("#{resources}.#{verb}.form.submit") }
  end

  # List Helpers

  def list_for(resource, collection, partial = 'list')
    render :partial => "#{resource.to_s}/#{partial.to_s}", :collection => collection
  end

  # Link Helpers

  def link_with_title_to(body, url, title, html_options = {})
    html_options.merge!(:title => title) if not title.blank?
    link_to body, url, html_options
  end

  def link_button_to(body, url, html_options = {})
    html_options.merge!(:class => 'button') { |key, old, new| "#{old} #{new}" }
    link_to body, url, html_options
  end

end
