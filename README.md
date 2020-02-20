# Advanced-Building-Blocks-Enumerables
You learned about the Enumerable module that gets mixed into the Array and Hash classes (among others) and provides you with lots of handy iterator methods. To prove that there’s no magic to it, you’re going to rebuild those methods.
Link to original project specification: https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks#project-2-enumerable-methods

## Project Description
Create a script file to house your methods and run it in IRB to test them later.
Add your new methods onto the existing Enumerable module. Ruby makes this easy for you because any class or module can be added to without trouble … just do something like:
  module Enumerable
    def my_each
      # your code here
    end
  end
  
1. Create #my_each, a method that is identical to #each but (obviously) does not use #each. You’ll need to remember the yield statement. Make sure it returns the same thing as #each as well.
2. Create #my_each_with_index in the same way.
3. Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
4. Create #my_all? (continue as above)
5. Create #my_any?
6. Create #my_none?
7. Create #my_count
8. Create #my_map
9. Create #my_inject
10. Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
11. Modify your #my_map method to take a proc instead.
12. Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

## Added RSpec framework for Test Driven Development (TDD)

Test-driven development (TDD) is a software development process that relies on the repetition of a very short development cycle: first the developer writes an (initially failing) automated test case that defines a desired improvement or new function, then produces the minimum amount of code to pass that test, and finally refactors the new code to acceptable standards.

The following sequence of steps is generally followed:

- Add a test  
- Run all tests and see if the new one fails  
- Write some code  
- Run tests  
- Refactor code  
- Repeat  

## Built With

- Ruby

## Author

👤 **Aaron Rory**

- Github: [@Aaron-RN](https://github.com/Aaron-RN)
- Twitter: [@ARNewbold](https://twitter.com/ARNewbold)
- Linkedin: [Aaron Newbold](https://www.linkedin.com/in/aaron-newbold-1b9233187/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
