require 'form_helper'
require 'list_helper'

module ApplicationHelper

  include FormHelper
  include ListHelper

  def link_button_to(body, url, html_options = {})
    html_options.merge!(:class => 'button') { |key, old, new| "#{old} #{new}" }
    link_to body, url, html_options
  end

end
