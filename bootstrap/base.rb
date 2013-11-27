module Bootstrap
  class Base

    attr_reader :path, :setup

    def initialize(bootstrap_path)
      @path   = bootstrap_path
      @setup  = Bootstrap::Setup.new(self)
      @backup = Bootstrap::Backup.new(self)
    end

    def process!
      @backup.process!
      @setup.process!
    end

  end
end
