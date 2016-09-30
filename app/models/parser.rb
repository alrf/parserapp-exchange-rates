class Parser < ApplicationRecord

  require 'open-uri'
  require 'nokogiri'

  arr = {}
  arr[0] = { 'lnk' => 'https://news.yandex.ru/quotes/2002.html', 'cmnt' => 'USD ММВБ', 'tbl' => 'UsdMmvb' }
  arr[1] = { 'lnk' => 'https://news.yandex.ru/quotes/2000.html', 'cmnt' => 'EUR ММВБ', 'tbl' => 'EurMmvb' }
  arr[2] = { 'lnk' => 'https://news.yandex.ru/quotes/1.html', 'cmnt' => 'USD ЦБ', 'tbl' => 'UsdCbr' }
  arr[3] = { 'lnk' => 'https://news.yandex.ru/quotes/23.html', 'cmnt' => 'EUR ЦБ', 'tbl' => 'EurCbr' }
  arr[4] = { 'lnk' => 'https://news.yandex.ru/quotes/10007.html', 'cmnt' => 'CHF ЦБ', 'tbl' => 'ChfCbr' }

  arr.each do |key, array|
    puts "#{key}: #{array} #{array['lnk']}"
    table = array['tbl']
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


    tbl = table.constantize
    d = DateTime.now.strftime('%Y-%m-%d')
    tbl = tbl.where(date: d).first_or_initialize
    tbl.date = d
    tbl.value = 0
    tbl.change = 0
    tbl.save

    date.each_with_index do |d,index|
      next if index == 0
      p "#{index} #{table} #{d} #{value[index]} #{change[index]}"

      d = Date.strptime(d, '%d.%m.%y').strftime('%Y-%m-%d')
      p d

      tbl = table.constantize
      tbl = tbl.where(date: d).first_or_initialize
      tbl.date = d
      tbl.value = value[index]
      tbl.change = change[index]
      tbl.save
    end

  end

end
