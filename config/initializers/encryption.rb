# Additional encryption and security settings
Rails.application.config.to_prepare do
  # Ensure ActiveRecord encryption is enabled
  # Keys must be set via environment variables
  primary_key = ENV['ACTIVE_RECORD_PRIMARY_KEY']
  deterministic_key = ENV['ACTIVE_RECORD_DETERMINISTIC_KEY']
  key_derivation_salt = ENV['ACTIVE_RECORD_KEY_DERIVATION_SALT']
  
  if primary_key && deterministic_key && key_derivation_salt
    ActiveRecord::Encryption.configure(
      primary_key: primary_key,
      deterministic_key: deterministic_key,
      key_derivation_salt: key_derivation_salt
    )
  elsif Rails.env.production?
    raise "ActiveRecord encryption keys must be configured in production"
  end
end

# Password complexity requirements
module Devise
  module Models
    module Validatable
      # Extend password validation for stronger passwords
      def password_required?
        !persisted? || !password.nil? || !password_confirmation.nil?
      end
    end
  end
end

# Custom password validator for strong passwords
class StrongPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    
    unless value.match?(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/)
      record.errors.add(attribute, :weak_password, 
        message: 'must include at least one uppercase letter, one lowercase letter, one number, and one special character')
    end
  end
end
