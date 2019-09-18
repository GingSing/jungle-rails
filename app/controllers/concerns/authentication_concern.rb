module AuthenticationConcern extend ActiveSupport::Concern
  included do
    before_action :authenticate
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic("Admin") do |user,pass| 
      user == ENV["WEBSITE_USERNAME"] && pass == ENV["WEBSITE_PASSWORD"] 
    end
  end
end