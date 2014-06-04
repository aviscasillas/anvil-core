module Anvil
  class Bundler
    def self.update_gem(gem_name)
      line = Cocaine::CommandLine.new('bundle', 'update :gem')
      line.run gem: gem_name
    end
  end
end
