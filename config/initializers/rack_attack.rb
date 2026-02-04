# Rate limiting for authentication endpoints
class Rack::Attack
  # Only enable in production
  unless Rails.env.development?
    # Throttle login attempts by email
    throttle("logins/email", limit: 10, period: 1.minute) do |req|
      if req.path.include?("/users/sign_in") && req.post?
        req.params.dig("user", "email").to_s.downcase.gsub(/\s+/, "") rescue nil
      end
    end

    # Throttle signup attempts by IP
    throttle("signups/ip", limit: 5, period: 10.minutes) do |req|
      if req.path.include?("/users") && req.post?
        req.ip
      end
    end

    # Throttle password reset requests
    throttle("password_resets/email", limit: 5, period: 10.minutes) do |req|
      if req.path.include?("/users/password") && req.post?
        req.params.dig("user", "email").to_s.downcase.gsub(/\s+/, "") rescue nil
      end
    end
  end
end

# Enable Rack::Attack
Rails.application.config.middleware.use Rack::Attack
