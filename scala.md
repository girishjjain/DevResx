# Scala 

* Scala is a blend of object-oriented and functional paradigm 
* Expressions yield a value and don't cause any side effects whereas statements don't return a value and may cause side effects 

  
### Functions
* Pure functions evaluate to same result for a given set of inputs. 
* Impure functions do not evaluate to same output for given set of inputs 

  
### Referential Transparency
* Referential transparency applies to both expressions and functions 
* An expression or function is called referentially transparent if it can be replaced with its value, without changing the algorithm, yielding same output as when they were called without their value replacement. 

  
### Higher-Order Functions
* Higher-order functions provide a way to abstract the parts that do not change and take the part that change as a function argument, they provide a way to maximize code reusability. 


### Scala variables 
* var - assignment can change 
* val - assignment can not change 
 

### In Scala
* if statement yields a value 
* there is no explicit return, the last expression becomes return value 
* if a method does not take any parameters and cause side effects then parenthesis after method name can be ommitted 

  
### Scala REPL
* To load an existing class in Scala REPL use :load FileName.scala  
* To enter paste mode use :paste and then press ^D to exit from paste mode 


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
* fundamental units of code reuse in Scala 
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
