# Security headers for e-commerce application
Rails.application.config.action_dispatch.default_headers.merge!(
  'X-Frame-Options' => 'SAMEORIGIN',
  'X-Content-Type-Options' => 'nosniff',
  'X-XSS-Protection' => '1; mode=block',
  'Referrer-Policy' => 'strict-origin-when-cross-origin',
  'Permissions-Policy' => 'geolocation=(), microphone=(), camera=()'
)

# Secure session cookies
Rails.application.config.session_store :cookie_store,
  key: '_ecommerce_rails_session',
  secure: Rails.env.production?,
  httponly: true,
  same_site: :lax

# Force SSL in production
if Rails.env.production?
  Rails.application.config.force_ssl = true
  Rails.application.config.ssl_options = {
    hsts: { 
      expires: 1.year, 
      subdomains: true,
      preload: true
    }
  }
end
