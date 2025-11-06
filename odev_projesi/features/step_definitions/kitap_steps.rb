# Bu dosya, .feature dosyasındaki İngilizce cümleleri Ruby koduna çevirir.

# "Given" adımları (Veritabanı hazırlığı)
# Önceki kodda "{string}" yazıyordu, tırnakları kaldırdık.
Given('a Author named {string} exists in the database') do |author_name|
    Author.create!(name: author_name)
  end
  
  Given('a Genre named {string} exists in the database') do |genre_name|
    Genre.create!(name: genre_name)
  end
  
  
  # "When" adımı (API isteği)
  # Önceki kodda "{string}" yazıyordu, tırnakları kaldırdık.
  When('I send a POST request to {string} with the following JSON:') do |path, json_data|
    # Bu metotların çalışması için "features/support/env.rb" dosyanda
    # World(Rack::Test::Methods) satırı olmalı.
    post path, json_data, { 'CONTENT_TYPE' => 'application/json' }
  end
  
  
  # "Then" adımları (Doğrulama)
  # Bu adım zaten doğruydu ve eşleşmişti.
  Then('the API response status code should be {int}') do |status_code|
    # Bu metotların çalışması için "features/support/env.rb" dosyanda
    # require 'rspec/expectations' satırı olmalı.
    expect(last_response.status).to eq(status_code)
  end
  
  # Bu adımı, terminalin önerdiği daha genel snippet ile değiştirdik:
  # '{string} as {string}' -> '"title" as "Dune"' ile eşleşir.
  Then('the JSON response should include {string} as {string}') do |key, value|
    json_response = JSON.parse(last_response.body)
    expect(json_response[key]).to eq(value)
  end