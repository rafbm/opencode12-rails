class Service
  include ActiveModel::Model

  def self.associate(name, options = {})
    define_method name do
      instance_variable_get("@#{name}") || instance_variable_set("@#{name}",
        (options[:class_name] || name.to_s.classify).constantize.new)
    end

    define_method "#{name}=" do |params|
      params = params.permit(options[:permit]) if options[:permit]
      send(name).attributes = params
    end

    validates_each name do |record, attribute, instance|
      record.errors.add(attribute, instance.errors.full_messages) if instance.invalid?
    end
  end

private

  def transaction(&block)
    !!ActiveRecord::Base.transaction(&block)
  end
end
