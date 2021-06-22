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

end
