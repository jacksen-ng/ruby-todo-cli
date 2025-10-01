# frozen_string_literal: true
module Todo
    class Store
        DEFAULT_PATH = ENV["TODO_STORE"] || File.expand_path("~/.todo.json")

        def initialize(path: DEFAULT_PATH)
            @path = path
            ensure_dir
        end

        def all
            File.exist?(@path) ? JSON.parse(File.read(@path), symbolize_names: true) : []
        end

        def write(rows)
            File.write(@path, JSON.pretty_generate(rows))
        end

        private

        def ensure_dir
            dir = File.dirname(@path)
            Dir.mkdir(dir) unless Dir.exist?(dir)
        end
    end
end