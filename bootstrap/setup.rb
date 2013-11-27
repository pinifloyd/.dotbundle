module Bootstrap
  class Setup < Base

    FOLDER = 'setup'.freeze

    attr_reader :entries

    def initialize bootstrap
      @path    = File.join bootstrap.path, FOLDER
      @entries = Dir.chdir(@path) { Dir.glob('.??*') }
    end

    def process!
      Dir.chdir(Dir.home) { @entries.each { |file| symlink! file } }
    end

    private

    def symlink! file
      File.symlink File.join(@path, file), file
    end

  end
end
