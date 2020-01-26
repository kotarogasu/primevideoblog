require 'open-uri' #URLにアクセスする為のライブラリを読み込みます。
require 'nokogiri' #Nokogiriライブラリを読み込みます。

url = 'https://www.amazon.co.jp/gp/video/detail/B07X45Z6HG/ref=atv_hm_hom_1_c_aRoe3w_2_2'#切り出すURLを指定します。

charset = nil
html = open(url) do |f|
  charset = f.charset #文字種別を取得します。
  f.read #htmlを読み込み変数htmlに渡します。
end

doc = Nokogiri::HTML.parse(html, nil, charset) #htmlを解析し、オブジェクト化
title = doc.css("._2Q73m9._2Q73m9._2Q73m9")
img = doc.css(".av-page-desktop ._2a7NJV._2a7NJV._2a7NJV img")[0][:src]
# (".av-page-desktop ._2a7NJV._2a7NJV._2a7NJV ")

puts title.text
puts img