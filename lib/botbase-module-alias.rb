#!/usr/bin/env ruby

# file: botbase-module-alias.rb

# A service module (used by the BotBase gem) intended to interpret verbose 
# statements into known alias commands e.g. create a random 
# password => lpa (leet_password).

require 'dynarex'

class BotBaseModuleAliasException < Exception
end

class BotBaseModuleAlias
  
  def initialize(aliases: nil, callback: nil, debug: false)

    @debug = debug
    
    if aliases.nil? then
      raise BotBaseModuleAliasException, 'aliases must be provided' 
    end
    
    @bot = callback       
    @dx = Dynarex.new aliases
    
  end

  def query(s, mode: :textchat, echo_node: 'node1')
               
    a = @dx.all.inject([]) do |r, x|
    
      found = s.match(/#{x.title}/i)
      found ? r << [x, found] : r

    end
    puts ': ' + a.inspect
    
    if a.any? then
           
      msg=a[0][0].aliasname

      puts 'msg: ' + msg.inspect
      
      if @bot.log then
        @bot.log.info 'BotBaseModuleAlias/query: found ' + msg
      end
      
      @bot.received(msg, mode: mode, echo_node: echo_node)
           
    else
      ''
    end
           
  end  

end
