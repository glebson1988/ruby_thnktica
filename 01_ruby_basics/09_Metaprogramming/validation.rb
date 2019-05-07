module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validates

    def validate(name, type, *args)
      @validates ||= []
      @validates << { name: name, type: type, arguments: args }
    end
  end

  module InstanceMethods
    def validate!
      return if self.class.validates.nil?

      self.class.validates.each do |validation|
        arg_name = instance_variable_get("@#{validation[:name]}")
        send("validate_#{validation[:type]}", arg_name, *validation[:arguments])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate_presence(name)
      raise 'Параметр nil либо пуст' if name.nil? || name.empty?
    end

    def validate_format(name, format)
      raise 'Неверный формат' if name !~ format
    end

    def validate_type(name, type)
      raise 'Некорректный тип' if name.class != type
    end
  end
end
