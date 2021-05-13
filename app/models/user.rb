class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bikes, through: :schedules
  has_many :schedules, dependent: :destroy

  validates :role, presence: true, inclusion: { in: %w(admin user) }

  class_attribute :roles
  self.roles = %w(admin user)

  def self.humanize_role(role)
    I18n.t "#{i18n_scope}.attributes.user.roles.#{role}"
  end
end
