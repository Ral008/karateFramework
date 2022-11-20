Feature: Variables creation in Karate Framework

  Background: Create and initialize variables
    * def app_name = "Google"
    * def page_lode_timeout = 20

  # <Gherkin Keyword> <def> <variable_name> = <value>
  # * <def> <variable_name> = <value>
  
  Scenario: to create a variable
    # Use variable for repeating value
    # Storing the data from a external file
    # In the matcher expression
    # Passing the Data from one feature file to another
    
    Given def var_int = 10
    And def var_string = 'Karate'
    Then print "Int variable ==> ", var_int
    And print "String variable ==> ", var_string
    * def var_int_2 = var_int + 10
    And print "New variable ==> ", var_int_2
    And print "Background section variable ==> ", app_name, page_lode_timeout

  Scenario: Access the variable
    * def var_int = 1
    * def var_string = "New"
    * def var_int_2 = var_int + 90
    Given print "Previous scenario ==> ", var_int
    And print "Previous scenario ==> ", var_string
    And print "Previous scenario ==> ", var_int_2
    And print "Background section variable ==> ", app_name, page_lode_timeout
    
