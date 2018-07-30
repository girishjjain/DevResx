# Overview
* Scala is short for Scalable Language.
* Scala is a blend of object-oriented and functional paradigm. Scala does not limit us to one programming style. We can program with objects, or in functional style, and also mix the two to get best of both worlds.
* Expressions yield a value and don't cause any side effects whereas statements don't return a value and may cause side effects 
* Scala compiles down to bytecode. We can extend Java classes from Scala classes, and vice versa. We can also use Java classes in Scala and Scala classes in Java.

## Functional Programming Overview

### Functions
* Pure functions evaluate to same result for a given set of inputs. 
* Impure functions do not always evaluate to same output for given set of inputs 

  
### Referential Transparency
* Referential transparency applies to both expressions and functions 
* An expression or function is called referentially transparent if it can be replaced with its value, without changing the algorithm, yielding same output as when they were called without their value replacement. 

  
### Higher-Order Functions
* Functions that take functions as parameters
* Higher-order functions provide a way to abstract the parts that do not change and take the part that change as a function argument, they provide a way to maximize code reusability. 

### Currying
* Functions that take their arguments one at a time are called curried functions


## Scala 

### Scala variables 
* var - assignment can change 
* val - assignment can not change 


### In Scala
* primitives in Java are objects in Scala
* In Java, you “implement” interface, in Scala, you “extend” or “mix in” traits.
* classes can’t have static members, instead, Scala has Singleton objects
* Scala implicitly imports members of packages java.lang and scala, as well as members of a singleton object named Predef, into every Scala source file
* constructors other than primary constructor are called auxiliary constructors and very auxiliary constructor must invoke another constructor of the same class as its first action. Also, only primary constructor can invoke a superclass constructor.
* while and do-while constructs are called “loops”, not expressions, and their result type is Unit 
* if statement yields a value 
* assignment results in Unit value


### Syntax, In Scala:
* Semicolon are optional
* Depending on the context, the dot operator (.) is optional as well, and so are the parentheses. Thus, instead of writing s1.equals(s2);, we can write s1 equals s2
* You can drop both the dot and the parentheses if a method takes either zero or one parameter. If a method takes more than one parameter, you must use the parentheses, but the dot is still optional.
* The convention is that you include parentheses if method has side effects, such as println(), but leave them off if method has no side effects, such as toLowerCase on a String 
* There is no need for explicit return (it's optional), the last expression becomes return value 
* Any method invocation, in which you are passing in exactly one argument, you can opt to use curly braces to surround the argument instead of parentheses 


### Functions
* In Scala, method parameters are vals (immutable) and not vars 
* A function literal is compiled into a class that when instantiated at runtime is a *function value*. 
* A function value is an object. Function types are classes that can be inherited by subclasses 
* You can define functions inside a function. Just like local variables, such local functions are visible only in their enclosing blocks. 
* Local functions can access parameters of their enclosing function
* A curried function is applied to multiple argument lists, instead of just one. 

### Variable arguments
* To indicate that a parameter can take variable number of arguments, use an asterisk after the last parameter's type.
* To pass an array to a method that takes variable number of parameters, you can use array explode notation (_*), for e.g. max(numbers: _*)

### Return Types
* In Java, the type of the value returned from a method is its return type. In Scala, that same concept is called result type. 
* A result type of ```Unit``` indicates the function returns no interesting value. Scala’s ```Unit``` type is similar to Java’s void type. 



### Strings
* Scala supports string interpolation, you can use s-interpolator which is leading s before double quotes. For a simple variable, prefix it with $ sign. For more complex expressions, place them in curly braces.
* To format the output, in addition to interpolating, use the f-interpolator.


### Operators
* Scala doesn't have any operators, but only methods. Statement c1 + c2 results in a call to the + method on c1 with c2 as an argument to the method call - that's c1.+(c2).
* Scala doesn't define precedence on operators; it defines precedence on methods. The first character of methods is used to define precedence on methods.
* Operators (methods) are ususally left associative i.e. o1 op o2 is same as o1.op(o2), unless they end with : in which case, they are right associative. 


### Scala REPL
* The ```scala``` command can run in two modes, as an interactive shell or in batch mode. If we don't provide any arguments, the scala command brings up the interactive shell. However, if we provide a file name then it runs the code in it within a stand-alone JVM. You could provide a script file or a compiler-generated .class file.
* To load an existing class in Scala REPL use :load FileName.scala  
* To enter paste mode use :paste and then press ^D to exit from paste mode 
* You can view the bytecode generated during the execution of the scala command using the -savecompiled option before the file name and the tool will save it to a JAR file

### SBT (Scala Build Tool)
* ```sbt``` is Scala build tool
* sbt minus any arguments starts sbt shell
* sbt shell has command prompt so you can run commands like ```compile``` and ```run```
* To run sbt command in watch mode, where one or more source file changes triggers command to run, prefix command with ~ for e.g.
```
~testOnly
sbt ~testOnly
```

### Companion (Singleton) Objects 
* Characteristics
  * same name as the class 
  * start with object keyword 
  * live in same source file as class 
  * can access private members 
* You can define apply method on companion object that lets you create new instance of class without using new keyword 
  

### Case Classes  
* Start with case modifier 
* Scala compiler creates companion object and adds apply method 
* All arguments in parameter list of case class are immutable  
* Scala compiler adds copy method to case class to make modified copies 


### Traits  
* Traits are like interfaces in Java, but they can also have method implementations, and even fields.
* Fundamental units of code reuse in Scala 
* App is a trait provided by Scala library which by default provides a method called main, so when a singleton object extends App they get access to main method, that serves as entry point to program 


### Pattern Matching  
* Pattern Matching is a mechanism for checking a value against a pattern
* A successful match can also deconstruct a value into its constituent parts. Its a more powerful version of switch statements and can also be used to simplify a series of if else statements. 
* Structure of Pattern Match 
```
    <objectToMatch> match { 

        case <pattern1> => // body to follow 

        case <pattern2> => // body to follow 

    } 
```
* First match is applied/evaluated and rest are ignored 
* When no match is found, Scala throws MatchError 
* You can provide a default case to be executed when there is no match found, it is denoted using _ letter, remember to keep this as last case statement 


### Miscellaneous
* Apache Camel uses Scala for its DSL to create routing rules
