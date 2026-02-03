require "net/http"
require "json"

class ExchangeRateService
  API_URL = "https://open.er-api.com/v6/latest/KES"

  def self.get_rate(target_currency)
    return 1.0 if target_currency == "KES"

    rates = fetch_rates
    rates[target_currency]
  end

  def self.fetch_rates
    Rails.cache.fetch("exchange_rates_kes", expires_in: 24.hours) do
      begin
        uri = URI(API_URL)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)

        if data["result"] == "success"
          data["rates"]
        else
          Rails.logger.error("ExchangeRateService Error: #{data['error-type']}")
          {}
        end
      rescue StandardError => e
        Rails.logger.error("ExchangeRateService Request Failed: #{e.message}")
        {}
      end
    end
  end
end
