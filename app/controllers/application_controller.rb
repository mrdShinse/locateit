# frozen_string_literal: true

class ApplicationController < ActionController::Base # :nodoc:
  protect_from_forgery with: :exception, prepend: true
  rescue_from StandardError, with: :fire_notification!

  def hashed_current_user
    return {} if current_user.blank?
    { user_id:    current_user.id,
      user_name:  current_user.name,
      user_email: current_user.email }
  rescue
    {}
  end

  def sendable_params
    params
  rescue
    params.permit(:action, :controller)
  else
    params
  end

  def setup_exception_notifier!(exception)
    data = sendable_params.merge(hashed_current_user).merge(UA: request.env['HTTP_USER_AGENT'],
                                                            IP: request.ip,
                                                            HOST: request.host,
                                                            server: IO.popen('whoami').first.chomp)

    request.env['exception_notifier.exception_data'] = { data: data }
    raise exception
  end

  def fire_notification!(exception)
    setup_exception_notifier!(exception)
  rescue
    ExceptionNotifier.notify_exception(exception, env: Rails.env)
    raise exception
  end
end
