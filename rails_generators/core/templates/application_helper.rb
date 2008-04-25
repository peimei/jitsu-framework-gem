module ApplicationHelper
  
  # Body helper for styling
  def body(options={})
    options.reverse_merge!(:id => controller.controller_name, :class => controller.action_name)
    tag('body', options, true)
  end
  
  # DRY js destroy action confirm
  def confirm_message(action, obj_description)
    "Are you sure you want to #{action.upcase} #{obj_description}?"
  end
  
  # This allows us to have a multi-line flash message with markup styling
  def format_flash_message(msg)
    return content_tag(:p, msg) unless msg.is_a?(Array)
    title = content_tag(:h1, msg[0])
    desc = content_tag(:p, msg[1])

    "#{title}#{desc}"
  end
  
end
