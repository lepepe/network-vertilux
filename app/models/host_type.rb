class HostType < ActiveRecord::Base
  # validation
  has_many :fields, class_name: "HostField"
  accepts_nested_attributes_for :fields, allow_destroy: true
  has_many :hosts

  # friendly url
  extend FriendlyId
  friendly_id :name, use: :slugged
end
