module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    resource.errors.full_messages.each do |message|
      html << <<-EOF
      <div class="error-alert">
        <div class="error-message">#{message}</div>
      </div>
      EOF
    end
    html.html_safe
  end
end
