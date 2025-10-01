module Todo
    module Commands
        class Rm
            def initialize(argv)
                @argv = argv
                @store = Store.new
            end

            def run
                id = @argv.shift&.to_i
                abort("Task ID is required") if id.nil? || id == 0

                rows = @store.all
                before = rows.size
                rows.reject! { _1[:id] == id }

                if rows.size == before
                    abort("Task not found")
                else
                    @store.write(rows)
                    puts "Task removed: #{id}"
                end
            end
        end
    end
end