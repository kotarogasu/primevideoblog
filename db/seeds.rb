# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movie = Category.create(name:"映画")
movie_action = movie.children.create(name:"アクション・アドベンチャー")
movie_sf = movie.children.create(name:"SF")
movie_comedy = movie.children.create(name:"コメディ")
movie_human = movie.children.create(name:"ヒューマン")
movie_fantasy = movie.children.create(name:"ファンタジー")
movie_lovestory = movie.children.create(name:"ラブストリー")
movie_horror = movie.children.create(name:"ホラー、サスペンス")
movie_drama = movie.children.create(name: "ドラマ")
movie_musical = movie.children.create(name:"ミュージカル")
movie_war = movie.children.create(name:"戦争")
movie_documentary = movie.children.create(name:"ドキュメンタリー")
movie_japan = movie.children.create(name:"邦画")
movie_korea = movie.children.create(name:"韓流映画")
movie_etc = movie.children.create(name:"その他")

tvshow = Category.create(name:"tv番組")
tvshow_jdrama = tvshow.children.create(name:"国内ドラマ")
tvshow_wdrama = tvshow.children.create(name:"海外ドラマ")
tvshow_amozon = tvshow.children.create(name:"amazonオリジナル")
tvshow_variety = tvshow.children.create(name:"バラエティ、お笑い")
tvshow_kdrama = tvshow.children.create(name:"韓国ドラマ")
tvshow_anime = tvshow.children.create(name:"アニメ")
tvshow_documentary = tvshow.children.create(name:"ドキュメンタリー")
tvshow_etc = tvshow.children.create(name:"その他")
