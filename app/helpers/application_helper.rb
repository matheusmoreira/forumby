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

  def link_with_title_to(body, url, title = nil, html_options = {})
    html_options = html_options.merge(:title => title) if not title.blank?
    link_to body, url, html_options
  end

  def link_button_to(body, url, html_options = {})
    html_options = html_options.merge(:class => 'button') do |key, old, new|
      "#{old} #{new}"
    end
    link_to body, url, html_options
  end

  def member_link_for(member, html_options = {})
    link_to member.name, member_path(member), html_options.merge(:class => 'name')
  end

  def category_link_for(category, html_options = {})
    link_with_title_to category.name, category_path(category),
                       category.description, html_options.merge(:class => 'name')
  end

  def forum_link_for(forum, html_options = {})
    link_with_title_to forum.name, forum_path(forum), forum.description,
                       html_options.merge(:class => 'name')
  end

  def topic_link_for(topic)
    link_to topic.title, topic_path(topic), :class => 'title'
  end

end
