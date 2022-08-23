$stdout.sync = true
class Account
    attr_reader :name, :balance
    def initialize(name, balance=0)
        @name = name
        @balance = balance
    end

    public
    def get_balance(pin_code)
        puts pin_code === pin ? "Your balance is #{@balance}" : pin_err
    end

    def deposit(pin_code)
        if pin_code == pin
            print "How much would like to deposit?"
            amount = gets.chomp.to_i
            @balance += amount
            puts "New balance: #{@balance}"
        else
            puts pin_err
        end
    end

    def withdraw(pin_code)
        if pin_code == pin
            puts "How much would you like to withdraw?"
            #$stdout.flush
            amount = gets.to_i
            @balance -= amount
            puts "New balance: #{@balance}"
        else
            puts pin_err
        end
    end

    private
    def pin
        @pin = 1234
    end

    def pin_err
        return "denied access - incorrect pin"
    end
end

me = Account.new("me", 1000)

me.withdraw(1234)
me.deposit(1234)
me.get_balance(1234)
me.get_balance(9876)