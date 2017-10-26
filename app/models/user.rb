class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :offers, foreign_key: 'translator_id', primary_key: 'id', class_name: 'Offer'
  has_many :tasks, foreign_key: 'translator_id', primary_key: 'id', class_name: 'Task'
  has_many :translate_orders
end
