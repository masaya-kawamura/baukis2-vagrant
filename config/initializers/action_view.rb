Rails.application.configure do
  # form_withのリモートを無効にする
  config.action_view.form_with_generates_remote_form = false
end