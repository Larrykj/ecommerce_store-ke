# Additional encryption and security settings
Rails.application.config.to_prepare do
  # Ensure ActiveRecord encryption is enabled
  # Keys must be set via environment variables or credentials
  primary_key = ENV['ACTIVE_RECORD_PRIMARY_KEY'] || Rails.application.credentials.dig(:active_record_encryption, :primary_key)
  deterministic_key = ENV['ACTIVE_RECORD_DETERMINISTIC_KEY'] || Rails.application.credentials.dig(:active_record_encryption, :deterministic_key)
  key_derivation_salt = ENV['ACTIVE_RECORD_KEY_DERIVATION_SALT'] || Rails.application.credentials.dig(:active_record_encryption, :key_derivation_salt)
  
  if primary_key && deterministic_key && key_derivation_salt
    ActiveRecord::Encryption.configure(
      primary_key: primary_key,
      deterministic_key: deterministic_key,
      key_derivation_salt: key_derivation_salt
    )
  elsif Rails.env.production?
    raise "ActiveRecord encryption keys must be configured in production via ENV variables or credentials"
  end
end