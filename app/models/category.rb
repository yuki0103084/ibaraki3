class Category < ActiveHash::Base
    self.data = [
      {id: 1, name: 'おでかけ'}, {id: 2, name: 'お買い物'}, {id: 3, name: '子育て'},
      {id: 4, name: 'グルメ'}, {id: 5, name: 'イベント'}, {id: 6, name: 'その他'}
    ]
    include ActiveHash::Associations
    has_many :articles
  end