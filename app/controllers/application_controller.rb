class ApplicationController < ActionController::Base
  include SessionsHelper
  include CommentsHelper

  before_action :set_locale, :search, :load_data

  def logged_in_user
    return if logged_in?
    store_location
    redirect_to login_url
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def search
    @search = Vehicle.ransack
  end

  def load_data
    @branchs = Branch.select :id, :name
  end

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale =
      if I18n.available_locales.include? locale
        locale
      else
        I18n.default_locale
      end
  end
end
