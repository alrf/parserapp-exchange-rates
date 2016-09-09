
desc 'get exchange rates from Yandex.ru'
task get_exchange_rates: :environment do
  #UserMailer.digest_email_update(options).deliver!
  Parser.yandex
end
