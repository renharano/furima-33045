class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: '本・メディア' },
    { id: 6, name: 'ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー' },
    { id: 8, name: 'コスメ' },
    { id: 9, name: '家電' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

  
end
