require "muppet/version"
require "muppet/setup"

module Muppet
  extend Muppet::Setup

  def self.included(base)
    #base.extend( Muppet::Document )
  end

end
