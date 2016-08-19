# encoding: utf-8

class UserType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :users, dependent: :restrict_with_error
end

class User < ActiveRecord::Base
  validates :user_type_id, presence: true
  validates :screen_name, presence: true

  belongs_to :user_type
  has_many :groups, through: :category_products
  has_many :charges
  has_many :contacts
end

class Group < ActiveRecord::Base
  validates :name, presence: true

  has_many :users, through: :group_users
  has_many :charges
end

class GroupUser < ActiveRecord::Base
  validates :group_id, presence: true, uniqueness: { scope: [:user_id, :entrance_date] }
  validates :user_id, presence: true
  validates :entrance_date, presence: true

  belongs_to :group
  belongs_to :user
end

class Charge < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: [:user_id, :group_id, :year] }
  validates :user_id, presence: true
  validates :group_id, presence: true

  belongs_to :user
  belongs_to :group
end

class ContactTool < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :contacts
end

class Contact < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: { scope: [:contact_tool_id, :data] }
  validates :contact_tool_id, presence: true
  validates :data, presence: true

  belongs_to :user
  belongs_to :contact_tool
end
