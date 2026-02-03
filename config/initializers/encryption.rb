# Additional encryption and security settings

# Stub keys for test environment
if Rails.env.test?
  Rails.application.config.active_record.encryption.primary_key = "test_primary_key_0000000000000000"
  Rails.application.config.active_record.encryption.deterministic_key = "test_deterministic_key_000000000"
  Rails.application.config.active_record.encryption.key_derivation_salt = "test_key_derivation_salt_0000000"
else
  primary_key = ENV["ACTIVE_RECORD_PRIMARY_KEY"] || Rails.application.credentials.dig(:active_record_encryption, :primary_key)
  deterministic_key = ENV["ACTIVE_RECORD_DETERMINISTIC_KEY"] || Rails.application.credentials.dig(:active_record_encryption, :deterministic_key)
  key_derivation_salt = ENV["ACTIVE_RECORD_KEY_DERIVATION_SALT"] || Rails.application.credentials.dig(:active_record_encryption, :key_derivation_salt)

  if primary_key && deterministic_key && key_derivation_salt
    Rails.application.config.active_record.encryption.primary_key = primary_key
    Rails.application.config.active_record.encryption.deterministic_key = deterministic_key
    Rails.application.config.active_record.encryption.key_derivation_salt = key_derivation_salt
  elsif Rails.env.production?
    raise "ActiveRecord encryption keys must be configured in production via ENV variables or credentials"
  end
end

# Password complexity requirements
module Devise
  module Models
    module Validatable
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
        message: "must include at least one uppercase letter, one lowercase letter, one number, and one special character")
    end
  end
end
