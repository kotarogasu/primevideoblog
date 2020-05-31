require 'open-uri' #URLにアクセスする為のライブラリを読み込みます。
require 'nokogiri' #Nokogiriライブラリを読み込みます。

url = 'https://www.amazon.co.jp/gp/video/detail/B07MHY5Z8W/ref=atv_dp_b06_det_c_Z0r2A3_1_4'#切り出すURLを指定します。

opt = {}
opt['User-Agent'] = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/530.5 (KHTML, like Gecko) Chrome/2.0.172.33 Safari/530.5'

charset = nil
html = open(url,opt) do |f|
  charset = f.charset #文字種別を取得します。
  f.read #htmlを読み込み変数htmlに渡します。
end

doc = Nokogiri::HTML.parse(html, nil, charset) #htmlを解析し、オブジェクト化
title = doc.css("._2Q73m9._2Q73m9._2Q73m9")
# img = doc.css(".av-page-desktop ._2a7NJV img")[0][:src]
# (".av-page-desktop ._2a7NJV._2a7NJV._2a7NJV ")
acter = doc.css("._33ixDQ")
acter2 = doc.css("#btf-product-details ._33ixDQ")
# trailer = doc.css('a')[0][:href]

# doc.css('#meta-info ._33ixDQ').each do|acter|
#   puts acter.text
# end
# doc.css("#btf-product-details ._33ixDQ").each do|acter2|
#   puts acter2.text
# end
# doc.css('._2vKtVw > a').each do |trailer|
#   puts trailer.attribute("href")
# end

puts title.text
# puts img
puts acter.text
# puts acter2.text


