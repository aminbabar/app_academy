require "employee"

class Startup
    attr_reader(:name, :funding, :employees, :salaries)

    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees  = []
    end


    def valid_title?(title)
        @salaries.include?(title)
    end


    def >(another_startup)
        self.funding > another_startup.funding
    end


    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise error
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee_instance)
        if @funding > @salaries[employee_instance.title]
            employee_instance.pay(@salaries[employee_instance.title])
            @funding -= @salaries[employee_instance.title]
        else
            raise error
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end


    def average_salary
        sum = 0
        @employees.each {|employee| sum += @salaries[employee.title]}
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |title, salary|
            if @salaries[title] == nil
                @salaries[title] = salary
            end
        end
        @employees = @employees + another_startup.employees
        another_startup.close()
    end


end
