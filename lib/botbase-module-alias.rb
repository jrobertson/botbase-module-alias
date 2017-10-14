#!/usr/bin/env ruby

# file: botbase-module-alias.rb

# A service module (used by the BotBase gem) intended to interpret verbose statements into 
# known alias commands e.g. create a random password => lpa (leet_password).

require 'dynarex'

class BotBaseModuleAliasException < Exception
end

class BotBaseModuleAlias
  
  def initialize(aliases: nil, callback: nil)
    
    if aliases.nil? then
      raise BotBaseModuleAliasException, 'aliases must be provided' 
    end
    
    @bot = callback    
    
    s, _ = RXFHelper.read aliases
    @dx = Dynarex.new
    @dx.import aliases

    
  end

  def query(s, mode: :textchat, echo_node: 'node1')
               
    a = @dx.all.inject([]) do |r, x|
    
      found = s.match(/#{x.title}/i)
      found ? r << [x, found] : r

    end
    
    if a.any? then
           
      msg=a[0][0].aliasname
      notice msg
      
      @bot.received(msg, mode: mode, echo_node: echo_node)
           
    else
      ''
    end
           
  end
  
  private
  
  def notice(msg)
    @bot.debug msg if @bot
  end

end
