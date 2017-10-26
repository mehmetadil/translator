class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :articles
  has_many :offers, foreign_key: 'translator_id', primary_key: 'id', class_name: 'Offer'
  has_many :tasks, foreign_key: 'translator_id', primary_key: 'id', class_name: 'Task'
  has_many :translate_orders
  after_commit :create_profile, on: :create

  def create_profile
    Profile.create_profile(id, email)
  end
end
