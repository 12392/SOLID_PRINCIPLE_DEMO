# Each class and module in a program should focus on a Single task

# The rule of thumb consider that if class description has AND so it shoud be refactored 

# In below example 
# The invoice class prints out invoice details
# AND calculates sales tax
# AND emails the invoice

# Below was highly coupled

# class Invoice
#     def initialize(customer:, state:, total:)
#         @customer = customer
#         @state = state
#         @total = total
#     end
    
#     def details
#         "Customer: #{@customer}, Total: #{@total}"
#     end

#     def sales_tax
#         case @state
#         when 'AZ' then 5.5
#         when 'TX' then 3.2
#         when 'CA' then 8.7
#         end
#     end

#     def email_invoice
#         puts "Emailing Invoice....."
#         puts details
#     end
# end

# invoice = Invoice.new(customer: "Suryansh", state: "AZ", total: 100)
# puts invoice.sales_tax
# invoice.email_invoice

# #output
# 5.5
# Emailing Invoice.....
# Customer: Suryansh, Total: 100


# **********************SOLUTION***********************


class Invoice
    def initialize(customer:, total:)
        @customer = customer
        @total = total
    end
    
    def details
        "Customer: #{@customer}, Total: #{@total}"
    end
end

class SalesTax
    def initialize(state:)
        @state = state
    end

    def sales_tax
        case @state
        when 'AZ' then 5.5
        when 'TX' then 3.2
        when 'CA' then 8.7
        end
    end
end

class Mailer
    def self.email(context)
        puts "Emailing Invoice....."
        puts context
    end
end
    

invoice = Invoice.new(customer: "Suryansh", total: 100)
tax = SalesTax.new(state: 'CA')
puts tax.sales_tax
Mailer.email(invoice.details)

# output
# 8.7
# Emailing Invoice.....
# Customer: Suryansh, Total: 100



