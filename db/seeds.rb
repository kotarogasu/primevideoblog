# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wmovie = Category.create(name:"洋画")
wmovie_action = wmovie.children.create(name:"アクション・アドベンチャー")
wmovie_anime = wmovie.children.create(name:"アニメ")
wmovie_sf = wmovie.children.create(name:"SF")
wmovie_comedy = wmovie.children.create(name:"コメディ")
wmovie_human = wmovie.children.create(name:"ヒューマン")
wmovie_fantasy = wmovie.children.create(name:"ファンタジー")
wmovie_lovestory = wmovie.children.create(name:"ラブストリー")
wmovie_horror = wmovie.children.create(name:"ホラー、サスペンス")
wmovie_drama = wmovie.children.create(name: "ドラマ")
wmovie_musical = wmovie.children.create(name:"ミュージカル")
wmovie_war = wmovie.children.create(name:"戦争")
wmovie_documentary = wmovie.children.create(name:"ドキュメンタリー")

jmovie = Category.create(name:"邦画")
jmovie_action = jmovie.children.create(name:"アクション・アドベンチャー")
jmovie_anime = jmovie.children.create(name:"アニメ")
jmovie_sf = jmovie.children.create(name:"SF")
jmovie_comedy = jmovie.children.create(name:"コメディ")
jmovie_human = jmovie.children.create(name:"ヒューマン")
jmovie_fantasy = jmovie.children.create(name:"ファンタジー")
jmovie_lovestory = jmovie.children.create(name:"ラブストリー")
jmovie_horror = jmovie.children.create(name:"ホラー、サスペンス")
jmovie_drama = jmovie.children.create(name: "ドラマ")
jmovie_musical = jmovie.children.create(name:"ミュージカル")
jmovie_war = jmovie.children.create(name:"戦争")
jmovie_documentary = jmovie.children.create(name:"ドキュメンタリー")
jmovie_yakuza = jmovie.children.create(name:"任侠、ヤクザ")

tvshow = Category.create(name:"tv番組")
tvshow_jdrama = tvshow.children.create(name:"国内ドラマ")
tvshow_wdrama = tvshow.children.create(name:"海外ドラマ")
tvshow_amozon = tvshow.children.create(name:"amazonオリジナル")
tvshow_variety = tvshow.children.create(name:"バラエティ、お笑い")
tvshow_kdrama = tvshow.children.create(name:"韓国ドラマ")
tvshow_documentary = tvshow.children.create(name:"ドキュメンタリー")
