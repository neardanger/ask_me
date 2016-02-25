class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  def gravatar




  end
end
