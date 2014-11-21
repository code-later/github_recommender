module ApplicationHelper
  def octicon(code)
    content_tag :span, '', :class => "octicon octicon-#{code.to_s.dasherize}"
  end
end
