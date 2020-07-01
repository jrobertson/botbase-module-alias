Gem::Specification.new do |s|
  s.name = 'botbase-module-alias'
  s.version = '0.1.2'
  s.summary = 'A botbase module plugin which matched a verbose command with ' + 
      'a known alias command from a lookup file.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/botbase-module-alias.rb']
  s.add_runtime_dependency('dynarex', '~> 1.7', '>=1.7.26')
  s.signing_key = '../privatekeys/botbase-module-alias.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/botbase-module-alias'
end
