class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
  end

  validates :price, inclusion: { in: (300..9_999_999) }
end
