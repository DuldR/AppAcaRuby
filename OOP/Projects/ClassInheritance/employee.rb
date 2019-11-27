class Employee

    attr_reader :name, :salary, :title, :boss

    def initialize(name, salary, title, boss)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def bonus(multi)

        bonus = (@salary) * multi

        return bonus
    end



end

class Manager < Employee

    attr_reader :employees

    def initialize(name, salary, title, boss, employees)
        super(name, salary, title, boss)
        @employees = employees
    end

    def bonus(multi)
        if @title == "Founder" || @title == "TA Manager"
            b_set = 0

            @employees.each do |manager|
                manager.employees.each do |employee|
                    b_set += employee.salary
                end
                b_set += manager.salary
            end
        end

        bonus = b_set * multi
    end



end

shawna = Employee.new("Shawna", 12000, "TA", "Darren")
david = Employee.new("David", 10000, "TA", "Darren")
darren = Manager.new("Darren", 78000, "TA Manager", "Ned", [shawna, david])
ned = Manager.new("Ned", 1000000, "Founder", nil, [darren])