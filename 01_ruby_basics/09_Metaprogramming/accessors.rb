module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        define_method(name) do
          instance_variable_get("@#{name}")
        end
        define_method("#{name}_history") do
          instance_variable_get("@#{name}_history")
        end
        define_method("#{name}=") do |value|
          prev_val = instance_variable_get("@#{name}")
          instance_variable_set("@#{name}", value)
          history_values = instance_variable_get("@#{name}_history") || []
          instance_variable_set("@#{name}_history", history_values << prev_val)
        end
      end
    end

    def strong_attr_accessor(name, type)
      define_method(name) { instance_variable_get("@#{name}") }
      define_method("#{name}=") do |value|
        raise "Тип должен быть #{type}" unless value.class == type

        instance_variable_set("@#{name}", value)
      end
    end
  end
end
