module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def flash_noty_script_tag
    unless flash.empty?
      noties = flash.map do |name, message|
        if message.is_a?(String) || message.is_a?(ActiveModel::Errors)
          type = ( name == :notice ? "success" : "error" )
          timeout = ( name == :notice ? 4000 : 30000 )
          text = ( message.is_a?(ActiveModel::Errors) ? "It's an error object" : message )

          "noty({ layout: 'top', type: '" + type +
          "', timeout: " + timeout.to_s +
          ", text: \"" + text +
          "\"});"
        end
      end
      # binding.pry
      # javascript_tag( "$(function() { \n  " + noties.join("\n  ") + "\n}); debugger();")
      javascript_tag(noties.join("\n "));
    end
  end
end
