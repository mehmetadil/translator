class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :offers, foreign_key: 'translator_id', class_name: 'Offer', dependent: :destroy
  has_many :tasks, foreign_key: 'translator_id', class_name: 'Task', dependent: :destroy
  has_many :translate_orders, dependent: :destroy
  has_many :version_tracker_comments, dependent: :destroy
  after_create :build_profile
  acts_as_target
  def build_profile
    create_profile(
      first_name: '',
      last_name: ''
    )
  end
end
