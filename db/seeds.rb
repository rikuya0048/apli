meet = Category.create(name: "会いたい")
talk = Category.create(name: "話したい")
work = Category.create(name: "働きたい")
community = Category.create(name: "参加したい")

# meetの子カテゴリ

# talkの子カテゴリ

# workの子カテゴリ
work_itengineer = work.children.create(name: "ITエンジニア")
work_designer = work.children.create(name: "デザイナー")
work_business = work.children.create(name: "ビジネス")
work_writer = work.children.create(name: "ライター")
work_webengineer = work.children.create(name: "Web制作")
work_videoeditor = work.children.create(name: "動画編集")

# communityの子カテゴリ


