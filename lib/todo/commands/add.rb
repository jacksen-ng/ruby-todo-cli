module Todo
    module Commands
        class Add
            def initialize(argv)
                @argv = argv
                @store = Store.new

            end

            def run
                title = @argv.join(" ").strip
                abort("Task title is required") if title.empty?

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

            private

            def prompt_for_due_date
                loop do
                    print "Please enter the due date (YYYY-MM-DD): "
                    input = $stdin.gets&.strip
                    if input.nil? || input.empty?
                        puts "cannot  be empty"
                        next
                    end

                    begin
                        return Date.parse(input).strftime("%Y-%m-%d")
                    rescue ArgumentError
                        puts "Invalid date format. Please use YYYY-MM-DD format."
                    end
                end
            end
        end
    end
end