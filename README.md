# Introducing the botbase-module-alias gem

## Testing the botbase module

    require 'botbase-module-alias'


    class DummyBot

      def received(msg, mode: nil, echo_node: nil)
        puts 'received: ' + msg
      end
    end

    dummy = DummyBot.new
    bma = BotBaseModuleAlias.new aliases: '/home/james/jamesrobertson.eu/qbx/r/speech_alias.txt', callback: dummy
    r = bma.query 'create a new password'
    #=> received: lpa

## file (speech_alias.txt):

<pre>
&lt;?dynarex schema="keywords[title, tags]/keyword(title, aliasname, hashtags)"?&gt;
title: Speech alias
tags: alias speech verbose phrase
--+


t: ^create a new password$
a: lpa
h: password

t: ^create a random word$
a: rwo
h: password

</pre>


In the code snippet above the botbase-module-alias gem queries a lookfile for a matching phrase and returns the associated alias command. Alias commands are convenient to type from the command-line, however with speech recognition it is easier to say the verbose command.

## Resources

* botbase-module-alias https://rubygems.org/gems/botbase-module-alias

botbase plugin alias aliases
