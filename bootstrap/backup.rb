module Bootstrap
  class Backup < Base

    FOLDER = 'backup'.freeze

    def initialize bootstrap
      @bootstrap = bootstrap
      @path      = path
      @entries   = entries
    end

    def process!
      make! if @entries.any?
    end

    private

    def path
      File.join @bootstrap.path, FOLDER, DateTime.now.strftime('%d-%m-%Y %H:%M:%S')
    end

    def entries
      Dir.entries(Dir.home) & @bootstrap.setup.entries
    end

    def make!
      folder!; backup!
    end

    def folder!
      Dir.mkdir @path
    end

    def backup!
      Dir.chdir(Dir.home) { @entries.each { |file| rename! file } }
    end

    def rename! file
      File.rename file, File.join(@path, file)
    end

  end
end
