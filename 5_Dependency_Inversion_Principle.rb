# High level objects should not depend on low level implementations

# class Parser
#     def parse_xml(file)
#       XmlParser.new.parse(file)
#     end
  
#     def parse_csv(file)
#       CsvParser.new.parse(file)
#     end
#   end
  
#   class XmlParser
#     def parse(file)
#       # parse xml
#       puts "xml parsing done"
#     end
#   end
  
#   class CsvParser
#     def parse(file)
#       # parse csv
#       puts "csv parsing done"
#     end
# end

# parser = Parser.new

# parser.parse_xml('json')


# The class Parser depends on classes XmlParser and CsvParser instead of abstractions, 
# which indicates the violation of the DIP principle since the classes XmlParser and CsvParser may contain the logic that refers to other classes. 
# Thus, we may impact all the related classes when modifying the class Parser.



class Parser
    def initialize(parser: CsvParser.new)
      @parser = parser
    end
  
    def parse(file)
      @parser.parse(file)
    end
  end
  
  class XmlParser
    def parse(file)
      # parse xml
      puts "xml parsing done"
    end
  end
  
  class CsvParser
    def parse(file)
      # parse csv
      puts "csv parsing done"
    end
  end
  

  parser = Parser.new
  parser.parse('json')

  parser_xml = Parser.new(parser:XmlParser.new)
  parser_xml.parse('json')