# Todo CLI

A simple and elegant command-line TODO list manager built with Ruby. Manage your daily tasks efficiently with due date tracking.

## Features

- ✅ Add tasks with due dates
- 📋 List all tasks sorted by due date
- 💾 Persistent storage using JSON
- 🎯 Simple and intuitive CLI interface

## Requirements

- Ruby >= 3.0.0

## Installation

### Option 1: Install from Source

```bash
git clone https://github.com/jacksen-ng/ruby-todo-cli.git
cd ruby-todo-cli
gem build todo-cli.gemspec
gem install ./todo-cli-0.1.0.gem
```

### Option 2: Install from RubyGems (when published)

```bash
gem install todo-cli
```

### Option 3: Local Development

```bash
git clone https://github.com/jacksen-ng/ruby-todo-cli.git
cd ruby-todo-cli
bundle install
```

Then use `./bin/todo` instead of `todo` command.

## Usage

### Add a Task

```bash
todo add "Complete project documentation"
```

You will be prompted to enter a due date in YYYY-MM-DD format:

```
Please enter the due date (YYYY-MM-DD): 2025-10-15
Task added: Complete project documentation
```

### List All Tasks

```bash
todo list
```

Example output:

```
1. Complete project documentation (Added: 2025-10-01 10:30, Due: 2025-10-15)
2. Review pull requests (Added: 2025-10-01 11:45, Due: 2025-10-03)
```

### Get Help

```bash
todo
```

This will display available commands.

## Data Storage

Tasks are stored in `~/.todo.json` by default. You can customize the storage location by setting the `TODO_STORE` environment variable:

```bash
export TODO_STORE=/path/to/your/todos.json
```

## Development

### Setup

```bash
bundle install
```

### Running Tests

```bash
rake test
```

### Building the Gem

```bash
gem build todo-cli.gemspec
```

### Installing Locally

```bash
gem install ./todo-cli-0.1.0.gem
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

NG JACK SEN - ngjacksen04@gmail.com

## Changelog

### 0.1.0 (2025-10-01)

- Initial release
- Add task functionality with due dates
- List tasks sorted by due date
- JSON-based persistent storage
