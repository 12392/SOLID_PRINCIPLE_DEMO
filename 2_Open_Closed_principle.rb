# Software elements (classes, modules, functions, etc.) should
# be open for extention, but closed for modification


# class OrderReport
#     def initialize(customer:, total:)
#         @customer = customer
#         @total = total
#     end

#     def invoice
#         puts "Invoice"
#         puts @customer
#         puts @total
#     end

#     def bill_of_loading
#         puts "BOL"
#         puts @customer
#         puts "Shiping label...."
#     end
# end

# order = OrderReport.new(customer: "Suryansh", total: 100)
# order.invoice
# order.bill_of_loading

#output
# Invoice
# Suryansh
# 100
# BOL
# Suryansh
# Shiping label....

# If we want some modification like we need to add address
# in bill_of_loading it will take 4 changes which is expensive


# class OrderReport
#     def initialize(customer:, total:, address:)#change
#         @customer = customer
#         @total = total
#         @address = address #change
#     end

#     def invoice
#         puts "Invoice"
#         puts @customer
#         puts @total
#     end

#     def bill_of_loading
#         puts "BOL"
#         puts @customer
#         puts "Shiping label...."
#         puts @address #change
#     end
# end

# order = OrderReport.new(customer: "Suryansh", total: 100, address:"123 Any Strret") #change
# order.invoice
# order.bill_of_loading

#output
# Invoice
# Suryansh
# 100
# BOL
# Suryansh
# Shiping label....
# 123 Any Strret

# **********************SOLUTION***********************
# we can use oops inheritence to solve upper problem

class OrderReport
    def initialize(customer:, total:)
        @customer = customer
        @total = total
    end
end

class Invoice < OrderReport
    def print_out
        puts "Invoice"
        puts @customer
        puts @total
    end
end

class BillOfLoading < OrderReport
    def initialize(address:, **args)
        super(**args)
        @address = address
    end
    
    def print_out
        puts "BOL"
        puts @customer
        puts "Shiping label...."
        puts @address 
    end
end


invoice = Invoice.new(customer: "Suryansh", total: 100)
bill_of_loading = BillOfLoading.new(customer: "Suryansh", total: 100, address:"123 Any Strret") 
invoice.print_out
bill_of_loading.print_out

# Invoice
# Suryansh
# 100
# BOL
# Suryansh
# Shiping label....
# 123 Any Strret
