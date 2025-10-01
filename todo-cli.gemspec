require_relative "lib/todo/version"

Gem::Specification.new do |spec|
    spec.name          = "todo-cli"
    spec.version       = Todo::VERSION
    spec.authors       = ["NG JACK SEN"]
    spec.email         = ["ngjacksen04@gmail.com"]

    spec.summary       = "A simple command-line TODO list manager"
    spec.description   = "A lightweight CLI tool for managing your daily tasks with due dates"
    spec.homepage      = "https://github.com/jacksen-ng/ruby-todo-cli"
    spec.license       = "MIT"
    spec.required_ruby_version = ">= 3.0.0"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/jacksen-ng/ruby-todo-cli"
    spec.metadata["changelog_uri"] = "https://github.com/jacksen-ng/ruby-todo-cli/blob/main/CHANGELOG.md"

    spec.files = Dir["lib/**/*.rb", "bin/*", "LICENSE", "README.md"]
    spec.bindir = "bin"
    spec.executables = ["todo"]
    spec.require_paths = ["lib"]

    spec.add_dependency "json", "~> 2.0"
end

