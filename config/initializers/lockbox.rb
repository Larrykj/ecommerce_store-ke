# Lockbox encryption configuration
# Use Rails credentials first, then environment variable as fallback
Lockbox.master_key = Rails.application.credentials.dig(:lockbox, :master_key) || ENV["LOCKBOX_MASTER_KEY"]

# Ensure master key is present in production
if Rails.env.production? && Lockbox.master_key.nil?
  raise "LOCKBOX_MASTER_KEY must be set in Rails credentials or environment variables in production"
end
