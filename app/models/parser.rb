class Parser < ApplicationRecord

  require 'open-uri'
  require 'nokogiri'

  arr = {}
  arr[0] = { 'lnk' => 'https://news.yandex.ru/quotes/2002.html', 'cmnt' => 'USD ММВБ', 'tbl' => 'usd_mmvb' }
  arr[1] = { 'lnk' => 'https://news.yandex.ru/quotes/2000.html', 'cmnt' => 'EUR ММВБ', 'tbl' => 'eur_mmvb' }
  arr[2] = { 'lnk' => 'https://news.yandex.ru/quotes/1.html', 'cmnt' => 'USD ЦБ', 'tbl' => 'usd_cbr' }
  arr[3] = { 'lnk' => 'https://news.yandex.ru/quotes/23.html', 'cmnt' => 'EUR ЦБ', 'tbl' => 'eur_cbr' }
  arr[4] = { 'lnk' => 'https://news.yandex.ru/quotes/10007.html', 'cmnt' => 'CHF ЦБ', 'tbl' => 'chf_cbr' }

  arr.each do |key, array|
    puts "#{key}: #{array} #{array['lnk']}"
    page = Nokogiri::HTML(open(array['lnk']))
    #p page

    date = []
    page.css('.quote__date').each do |elem|
      #p elem.content
      date << elem.content
    end
    p date

    value = []
    page.css('.quote__value').each do |elem|
      value << elem.content
    end
    p value

    change = []
    page.css('.quote__change').each do |elem|
      change << elem.content
    end
    p change

  end

end
