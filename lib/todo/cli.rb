# frozen_string_literal: true
require "json"
require "date"

module Todo
    class CLI
        def self.start(argv) = new(argv).start

        def initialize(argv)
            @argv = argv
            @store = Store.new
        end

        def start
            cmd = @argv.shift
            case cmd
            when "add" then cmd_add
            when "list" then cmd_list
            else
                puts help
            end
            
        end

        def help
            <<~H
            Usage:
                todo add "task-content"
                todo list
            H
        end

        def cmd_add
            title = @argv.join(" ").strip
            if title.empty?
                warn "Task title is required"
                return
            end

            due_date = prompt_for_due_date
            rows = @store.all
            next_id = (rows.map { _1[:id] }.max || 0) + 1

            row = {
                id: next_id,
                title: title,
                add_time: Time.now.utc.iso8601,
                due_date: due_date
            }

            rows << row
            @store.write(rows)
            puts "Task added: #{title}"
        end

        def cmd_list
            rows = @store.all
            if rows.empty?
                puts "No tasks found"
                return
            end
            rows.sort_by { |r| [r[:due_date] || "9999-12-31", r[:id]] }.each do |r|
                puts "#{r[:id]}. #{r[:title]} (Added: #{fmt_times(r[:add_time])}, Due: #{r[:due_date] || "N/A"})"
            end
        end

        private

        def prompt_for_due_date
            loop do
                print "Please enter the due date (YYYY-MM-DD): "
                input = $stdin.gets&.strip
                next puts "cannot  be empty" if input.nil? || input.empty?
                begin
                    d = Date.parse(input)
                    return d.strftime("%Y-%m-%d")
                rescue ArgumentError
                    puts "Invalid date format. Please use YYYY-MM-DD format."
                end
            end
        end

        def fmt_times(s)
            Time.parse(s).strftime("%Y-%m-%d %H:%M")
        rescue 
            s.to_s
        end
    end
end