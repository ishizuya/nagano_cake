# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: '111@111',
   password: '111111'
)


Post.create(
   {name: "スキンケア・基礎化粧品の商品一覧（10ページ目）｜美容・化粧品情報はアットコスメ"},
{name: "エリクシール ルフレ バランシング おしろいミルク Ｃ"},
{name: "薬用ローション（とてもしっとり）"},
{name: "Wトリートメントオイル"},
{name: "日本酒の化粧水 高保湿"},
{name: "アミノモイスト ぷるぷるしっとり肌マスク"},
{name: "黒真珠マスク"},
{name: "カネボウ インスタント オフ オイル"},
{name: "エリクシール ホワイト クリアローション T II"},
{name: "VC100エッセンスローションEX"},
{name: "プレディア スパ・エ・メール ファンゴ W クレンズ"},
{name: "スキンケア・基礎化粧品の商品一覧（11ページ目）｜美容・化粧品情報はアットコスメ"},
{name: "ガラク ナイアシン2.0エッセンス"},
{name: "ニベアクリーム"},
{name: "PH SENSITIVE CREAM"},
{name: "カウブランド 無添加メイク落としミルク"},
{name: "アルティミューン パワライジング コンセントレート III"},
{name: "スムージングジェルウォッシュ"},
{name: "スキンリペアクリーム"},
{name: "プロP ミスト"},
{name: "潤浸保湿 モイストリペアシートマスク"},
{name: "スポットクリアセラム ＷＴ"}
   )