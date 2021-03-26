Feature: welcome to karate
  
  #print key word
  Scenario: how to print
    Given print "Hello World"
    When print "another print"
    Then print 'then print'
    
  Scenario: more printing
    Given print 'some words to print'
     * print 'my name is','karate kid'
    # , -->concat two string +1 white space
     * print 2+2


  Scenario: variables
    * def name = 'Mike'
    * print 'my name is',name
    * def age = 20
    * print name,'is',age,'years old'



  Scenario: difficult parameters: json object
    * def student = {'name':'sam','owes_tuition':'false'}
    * print student
    * print student.name
    #json format olduğu için gpath kullandık yani student.name i
    * print student.owes_tuition


  Scenario: json object 2
    * def student =
    """
    {
      "firstName":"Steven",
      "lastName":"King",
      "salary": 2099
    }
    """
    * print student.firstName
    * print student.lastName
    * print student.salary


    Scenario: spartan variable
      * def spartan =
      """
      {
        "id": 10,
        "name": "Lorenza",
        "gender": "Female",
        "phone": 3312820936
      }
      """
      * print spartan.id
      * print spartan.name
      * print spartan.gender
      * print spartan.phone



    Scenario: json array objects
     * def students =
      """
      [
        {
          'name':'sam',
          'owes_tuition':'false'
        },

        {
          'name':'mike',
          'owes_tuition':'true'
        }
      ]
      """
      * print students
      * print students[0].name
      * print students[1].owes_tuition