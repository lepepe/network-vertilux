class Host < ActiveRecord::Base
  belongs_to :host_type
  serialize :properties, Hash

  # Search
  def self.search(keywords)
    hosts = order(:name)
    hosts = hosts.where("properties LIKE ? OR name LIKE ?", "%#{keywords}%", "%#{keywords}%") if keywords.present?
    hosts
  end

  validate :validate_properties

  def validate_properties
    host_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "Cannot be blank"
      end
    end
  end
end
