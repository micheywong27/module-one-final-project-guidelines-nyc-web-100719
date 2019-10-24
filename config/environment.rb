require 'bundler'
Bundler.require

require 'figlet'

font = Figlet::Font.new('standard.flf')

figlet = Figlet::Typesetter.new(font)

puts figlet['Sandwich House'].bold


require 'colorize'
require 'colorized_string'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = nil 