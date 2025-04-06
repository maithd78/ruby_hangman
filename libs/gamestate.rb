# save
require 'yaml'
# save game
class Gamestate
  attr_accessor :secret_code, :lives, :display_code

  def initialize(secret_code, lives, display_code)
    @secret_code = secret_code
    @lives = lives
    @display_code = display_code
  end

  def to_yaml
    YAML.dump({
                secret_code: @secret_code,
                lives: @lives,
                display_code: @display_code
              })
  end
end
