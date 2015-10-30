#require 'pry'
class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end


class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        super name, email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hours_worked * @hourly_rate
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, yearly_salary)
    		super name, email
        @yearly_salary = yearly_salary
    end

    def calculate_salary
      	@yearly_salary.to_f / 52
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, base_salary, hourly_rate, hours_worked )
        super name, email
        @base_salary = base_salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      (@hours_worked * @hourly_rate) + @base_salary.to_f / 52
    end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end

  def pay_employees
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
      #binding.pry
      @employees.each do |employee|
      	puts "El empleado #{employee.name} cobra #{employee.calculate_salary} a la semana"
      end

      total_weekly_salary = @employees.reduce(0) do |sum, employee|
      	sum + employee.calculate_salary
      end



      puts "el coste semanal en salarios para la empresa es de #{total_weekly_salary}"
  end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
salva = HourlyEmployee.new('Salva', 'salva@example.com', 15, 50)
raul = HourlyEmployee.new('Raul', 'raul@example.com', 15, 40)

#puts josh.calculate_salary
#puts nizar.calculate_salary
#puts ted.calculate_salary

employees = [josh, nizar, ted, salva, raul]
payroll = Payroll.new(employees)
payroll.pay_employees
