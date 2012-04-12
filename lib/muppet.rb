require "mongo"
require "muppet/version"
require "muppet/setup"
require "muppet/document"

module Muppet
  extend Muppet::Setup
  include Muppet::Document::InstanceMethods
  
  def self.included(base)
    base.extend( Muppet::Document::ClassMethods )
  end

end
