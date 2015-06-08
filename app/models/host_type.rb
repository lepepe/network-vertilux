class HostType < ActiveRecord::Base
  has_many :fields, class_name: "HostField"
  accepts_nested_attributes_for :fields, allow_destroy: true
  has_many :hosts
end
