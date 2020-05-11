module Activable
def self.included(base)
  base.extend ClassMethods
  base.send :include, InstanceMethods
end
module ClassMethods
  attr_accessor :instances

  def calculate_id
    instances.count
  end

  def all
    instances
  end

  def find(option)
    attribute = option.keys.first
    value = option[attribute]
    instances.each  do |instance|
      return instance if instance.method(attribute).call == value
    end
  end

  def first
    instances.first
  end

  def last
    instances.last
  end
end

module InstanceMethods
  protected

  def register_instances
    self.class.instances ||= []
    self.class.instances << self
  end
end
end
