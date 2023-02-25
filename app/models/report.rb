class Report < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end
end
