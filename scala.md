# Overview
* Scala is short for Scalable Language.
* Scala is statically typed.
* Scala is a blend of object-oriented and functional paradigm. Scala does not limit us to one programming style. We can program with objects, or in functional style, and also mix the two to get best of both worlds.
* Scala is an object oriented language in pure form: every value is an object and every operation is a method call. For example, when you say `1 + 2` in Scala, you’re actually invoking a method named + defined in class Int (Scala doesn't have any operators but only methods, more on this later).
* In addition to being a pure object oriented language, Scala is also a full blown functional language.
* Scala goes further than all other well known languages in fusing object oriented and functional programming into a uniform language design. For instance, where other languages might have objects and functions as two different concepts, in Scala a function value **_is_** an object.
* Scala compiles down to bytecode. We can extend Java classes from Scala classes, and vice versa. We can also use Java classes in Scala and Scala classes in Java.

## Functional Programming Overview
* Functions are first class values, and that means:
  * A function is a value of the same status as, say, an integer or a string
  * You can pass functions as arguments to other functions, return them as results from functions, or store them in variables
  * You can also define a function inside other function, just as you can define an integer value inside a function
  * You can define functions without giving them a name, sprinkling your code with function literals as easily as you might write integer literal like 41
* Immutable data structures are one of the cornerstones of functional programming. Scala libraries define many immutable data types such as lists, tuples, maps, and sets.
* Core idea with immutability is that methods should not have any side effects. They should communicate with their environment only by taking arguments and returning results.
* Functional languages encourage immutable data structures and referentially transparent methods.


### Functions
* Pure functions evaluate to same result for a given set of inputs. 
* Impure functions do not always evaluate to same output for given set of inputs 
* Expressions yield a value and don't cause any side effects whereas statements don't return a value and may cause side effects 


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
* Scala has two kinds of variables
  * `var` - assignment can change 
  * `val` - assignment can not change
* A `val` is similar to `final` variable in Java. 
* When you define a variable with `val`, the variable can’t be reassigned, but the object to which it refers could potentially still be changed. For example, a `val` pointing to an array can't be reassigned but elements in the array can still be updated.
* Look for opportunities to use vals. They can make your code both easier to read and easier to refactor.


### In Scala
* primitives in Java are objects in Scala
* arrays are zero based, and you access an element by specifying an index in parentheses. For example, `arr(0)` and not `arr[0]`, as in Java. Scala doesn’t introduce new syntax for accessing Array elements, you use parentheses (which is simply invocation of apply method) to access elements, just like calling a method on object.
* In Java, you “implement” interface, in Scala, you “extend” or “mixin” traits
* classes can’t have static members, instead, Scala has Singleton objects
* Scala implicitly imports members of packages `java.lang` and `scala`, as well as members of a singleton object named `Predef`, into every Scala source file
* while and do-while constructs are called “loops”, not expressions, and their result type is Unit 
* if statement yields a value 
* assignment results in Unit value
* you can define classes and singleton objects inside other classes and singleton objects  
* you can name .scala file anything you want, unlike Java, which requires you to put a public class in a file named after the class
* constants are named using camel case, for example, XOffset. This is unlike Java, which follows convention of naming constants with all upper case letters.

### Syntax, In Scala:
* Semicolon are optional
```scala
    val five = 5
    println(five)
```
* Depending on the context, the dot operator (.) is optional as well, and so are the parentheses. Thus, instead of writing s1.equals(s2);, we can write s1 equals s2, or:
```scala
    val result = "Hi" equals "hi"
    println(result)
```
* You can drop both the dot and the parentheses if a method takes either zero or one parameter. If a method takes more than one parameter, you must use the parentheses, but the dot is still optional.
* The convention is that you include parentheses if method has side effects, such as println(), but leave them off if method has no side effects, such as toLowerCase on a String 
* There is no need for explicit return (it's optional), the last expression becomes return value
```scala
    def addOne(n1: Int) = {
        n1 + 1
    }

    println(addOne(4))
``` 
* Scala does not require you to catch checked exceptions, or declare them in a throws clause. You can declare a throws clause if you wish with the @throws annotation, but it is not required.
* Any method invocation, in which you are passing in exactly one argument, you can opt to use curly braces to surround the argument instead of parentheses (useful when using currying technique to pass function literal for one of the argument)
```scala
    def addOne(n1: Int) = {
        n1 + 1
    }

    println(addOne{4})
```
* Imports in Scala can appear anywhere, not just at the beginning of a compilation unit. Also, they can refer to arbitrary values. For example, you can import all members of a parameter and subsequently refer to them directly without prefixing with parameter name (useful when we use objects as modules).
```scala
    def maxOfIntegers(n1: Int, n2: Int): Int = {
        import scala.math._     // you can use import here
        max (n1, n2)            // max works because of the earlier import
    }

    println(maxOfIntegers(1, 2))
```
* Unlike Java, no abstract modifier is necessary (or allowed) on method declarations. A method is abstract if it does not have an implementation (i.e. no equals sign or body)
```scala
    abstract class AbstractClass { 
        def abstractMethod
    }
```
* Every member not labeled private or protected is public. There’s no explicit modifier for public.
* Classes and constructors - In Java, classes have constructors, which can take parameters, whereas in Scala, classes can take parameters directly. The Scala notation is more concise- there’s no need to define fields and write assignments that copy constructor parameters into fields. For example, below code defines a new class named `Employee` with the constructor that takes employee name (string) as an argument and a property getter method for same. Following examples are similar:
> Scala
```scala
    class Employee(val name: String)
```
> Java
 ```java
    class Employee {
        private String name;
        
        public Employee(String name) {
            this.name = name;
        }
        
        public String getName() {
            return this.name;
        }
    }    
 ```
* Constructors other than primary constructor are called auxiliary constructors and every auxiliary constructor must invoke another constructor of the same class as its first action. Auxiliary constructors start with `def this(...)`
* Only primary constructor can invoke a superclass constructor.
* Scala compiler will compile any code you place in the class body, which isn’t part of a field or a method definition, into the primary constructor.
* By convention, a var defined in class is interpreted by Scala as a pair of getter and setter methods. It chooses an arbitrary name for backing field. The getter for var x is named “x”, while it’s setter is namesd “x_”. You can override these default implementations of getter and setter methods by defining methods with the naming convention suggested above. There’s no separate syntax for getters and setters in Scala. 

### Hierarchy
* Every class inherits from a common superclass named `Any`
* Just as `Any` is a superclass of every other class, `Nothing` is a subclass of every other class 
* Type `Nothing` is at the very bottom of Scala’s class hierarchy; it is a subtype of every other type. However, there exists no values of this type whatsoever. Technically, an exception throw has type `Nothing`.
* The root class `Any` has two subclasses: `AnyVal` and `AnyRef`. `AnyVal` is the parent class of every built-in value class in Scala. `AnyRef` is base class of all reference classes in Scala. On Java platform, `AnyRef` is just an alias for `Object` class.
* Scala classes also inherit from a marker trait called `ScalaObject`.
* Class `Null` is the type of `null` reference; it’s a subclass of every reference class. Null isn’t compatible with value types.
* `Null` is provided mostly for interoperability with other JVM languages and should almost never be used in Scala code.

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
* A result type of `Unit` indicates the function returns no interesting value. Scala’s `Unit` type is similar to Java’s `void` type. There’s one value of type `Unit` that exists; it’s called unit value and is written `()`. The existence of `()` is how Scala’s `Unit` differs from Java’s void.


### Strings
* Scala supports string interpolation, you can use s-interpolator which is leading s before double quotes. For a simple variable expression, prefix it with $ sign. For more complex expressions, place them in curly braces.
* To format the output, in addition to interpolating, use the f-interpolator.


### Operators
* Scala doesn't have any operators, but only methods. Statement c1 + c2 results in a call to the + method on c1 with c2 as an argument to the method call - that's c1.+(c2).
* Scala doesn't define precedence on operators; it defines precedence on methods. The first character of methods is used to define precedence on methods.
* Operators (methods) are ususally left associative i.e. o1 op o2 is same as o1.op(o2), unless they end with : in which case, they are right associative. For example: `val l = 1 :: Nil` the :: method (called "cons" operator) associates to the right. It is same as `val l = Nil.::(1)` (Nil is an instance of empty list).
* Equality comparison using `==` works slightly different in Scala than Java. For value types, it would compare underlying values, as it does in Java. For referenece types, the implementation differs. In Java, `==` would always do reference equality comparison i.e., whether two objects are referring to same instance, whereas in Scala, `==` is defined as a method in `AnyRef` class (so all reference types inherit this method) and it invokes `equals` method on underlying type. If a type doesn't override `equals` method then default implementation from `AnyRef` would be invoked, which does reference equality comparison. For reference types other than Java’s boxed numeric types, == is treated as an alias of equals method inherited from Object, but is overridden by many subclasses to implement their natural notion of equality, for e.g. String class. For example:
> Java
```java
    import static java.lang.System.out;

    public class Playground {
        public static void main(String[] args) {
            String s1 = "Hi";
            String s2 = "Hi";
            out.println(s1 == s2);                              // true because String literals are interned
            out.println(new String("Hi") == new String("Hi"));  // false because they are separate instances
        }
    }    
``` 
> Scala
```scala
    new String("Hi") == new String("Hi")    // true (false in Java)
```
* It means you can use `==` consistently with value and reference types and don't have to worry about handling special cases, as in Java.
* If you want reference equality comparison then use `eq`, for example, `o1 eq o2` or it opposite `ne`. 

### Scala REPL
* The `scala` command can run in two modes, as an interactive shell or in batch mode. If we don't provide any arguments, the scala command brings up the interactive shell. However, if we provide a file name then it runs the code in it within a stand-alone JVM. You could provide a script file or a compiler-generated .class file.
* To load an existing class in Scala REPL use :load FileName.scala  
* To enter paste mode use :paste and then press ^D to exit from paste mode 
* You can view the bytecode generated during the execution of the scala command using the -savecompiled option before the file name and the tool will save it to a JAR file

### SBT (Scala Build Tool)
* `sbt` is Scala build tool
* sbt minus any arguments starts sbt shell
* sbt shell has command prompt so you can run commands like `compile` and `run`
* To start console for current project, run `console` command
* To see list of projects, run `projects` command
* To set a project as current project, run `project <project-name>` command
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
* Scala compiler creates companion object and adds apply method, which means we don’t have to use new keyword to create instance of case class 
* All arguments in parameter list of case class are immutable and they implicitly get `val` prefix, so they are maintained as fields 
* Scala compiler adds copy method to case class to make modified copies 
* Compiler adds natural implementations of toString, hashCode, and equals to case class 


### Traits  
* Traits are like interfaces in Java, but they can also have method implementations, and even fields.
* Fundamental units of code reuse in Scala 
* A class can mix in any number of traits
* App is a trait provided by Scala library which by default provides a method called main, so when a singleton object extends App they get access to main method, that serves as entry point to program 


### Pattern Matching  
* Pattern Matching is a mechanism for checking a value against a pattern
* A pattern match includes a sequence of alternatives, each starting with the keyword case. Syntax: `selector match { alternatives }` 
* A successful match can also deconstruct a value into its constituent parts. Its a more powerful version of switch statements and can also be used to simplify a series of if else statements. 
* Structure of Pattern Match 
```scala
    <objectToMatch> match { 

        case <pattern1> => // body to follow 

        case <pattern2> => // body to follow 

    } 
```
* First match is applied/evaluated and rest are ignored 
* When no match is found, Scala throws MatchError 
* You can provide a default case to be executed when there is no match found, it is denoted using _ letter, remember to keep this as last case statement 
* Wildcard pattern (_) matches every value, but it doesn’t introduce a variable name to refer to that value. 
* Nil, a singleton object, is a pattern that matches only empty list  
* Scala compiler uses a simple lexical rule to distinguish between a constant and variable identifiers in a pattern - a simple name starting with a lowercase letter is taken to be a pattern variable; all other references are taken to be constants. 
* A sealed class cannot have any new subclasses added except the ones in the same file. This is very useful for pattern matching, because you only need to worry about the subclasses you already know about. You get better compiler support as well.


### Miscellaneous
* Option type - Scala provides standard `Option` type for optional values. Compare it with get method of `HashMap` in Java where if a value is not found, it returns null but Scala returns Option[T]. It helps keep your code clean, more readable, and saves you from NullPointerException bugs. Scalia encourages use of Option to indicate optional value.
* Apache Camel uses Scala for its DSL to create routing rules
* Scala treats arrays as nonvariant (rigid), so an Array[String] is not considered to conform to an Array[Any].
* Scala supports four kinds of abstract members- vals, vars, methods, and types.
* Use an abstract val when you don’t know the correct value in the class but you do know that the variable will have an unchangeable value in each instance of the class. 

### Uniform access principle
* Uniform access principle says that client code should not be affected by a decision to implement an attribute as a field or method. For example: 
```scala
“A”.length() vs 

Array.length 
```
* Scala treats fields and methods more uniformly than Java. Although you can remove parentheses from a method invocation, remember convention is to use parentheses when invoking a method that causes side effects, for e.g. println method should always be invoked with parentheses as it doesn’t return a value but causes side effects - `println(“a”)`


## Scala Functions and Methods, Feb 8, 2021
* Functions are objects, methods are not
* Method is defined using `def`, function is defined using function literal `(arg: T) => {}`
* Function objects are first class entities on par with classes - methods are not
* Functions - A complete standalone object which is an instance of a class, for e.g. `Function0`
* Mehtod - Reusable code which is defined as a part of a class
* A function class implements traits in Scala, method does not.
* A function object has its own methods that can be invoked
* Functions are value types and can be stored in `val` and `var` storage units. Methods are not value types but can be converted into one easily.
* Invoking a function invokes the `apply()` method on a function. Invoking a method runs the code associated with the method.
* Functions can be annonyous, methods always have a name
* Functions have a slightly higher overhead (due to invoking apply method on function object), methods may be slightly faster and better performing.
* Functions do not accept type parameters or parameter default values, methods work fine with both.
* Empty-paren methdos can be invoked without parenthesis
* A partial function only caters to a subset of possible data for which it has been defined
  * Cab be implemented by creating an implmentation of `PartialFunction` train such as:
  ```scala
  val f = new PartialFunciton[Int, Int] {
    def apply(x: Int): Int = ...

    def isDefinedAt(x: Int): Boolean = ... 
  }
  ```
  * An easier and more intuitive way to implement partial function is using pattern matching:
  ```scala
  val f: PartialFunction[Int, Int] = {
    case x: Int if x != 0 => ...
  }
  ```
* A method defined using just curly braces and no `=` sign is a procedure, a procedure does not return anything, its result type is always Unit
* An empty-paren method is recommended when ther are no parameters and the method accessses but does not change mutable state i.e. by reading fields of the contained object
* Tail recursion - A new stack frame will not be built for each recursive call - all calls will be executed in a **single stack frame** by simply updating the input arguments to the recursive call
* In order to apply tail recursion, the recursive call has to be the **last call** in a method


## Scala Type Classes and Parameterization
### Why?
* Two approaches
  * Parameterized Types
  * Abstract Types
* As part of Scala programming language there are many parameterized types available to us, such as `List[T]`, `Option[T]`, `Either[T, U]`, `Map[K, V]`, etc.
* ??? What about type binding, is it compile time or runtime?
* With parameterized types, the type is determined at compile time.

### Implicits
* Implicit parameter
  * Compiler will replace parameter implicity
* Implicit conversion
  * Compiler will implicitly convert one type to another
* Implicit class
  * Compiler lets you enrich functionality of certain class

### Type Classes
* Ad hoc polymorphism i.e. polymorphism when needed
* To write a type class we need simple interface with some functionality - think of trait with method
* There are three steps to creating a type class:
  * Declare typeclass
  ```scala
  trait Combiner[T] {
    def combine(a: T, b: T): T
  }
  ```
  * Crete typeclass instances
  ```scala
  object Combiner {
    implicit val intCombiner: Combiner[Int] = (a: Int, b: Int) => a + b

    implicit val stringCombiner: Combiner[String] = (a: String, b: String) => s"$a$b"
  }
  ```
  * Provide interface methods
  ```scala
  object CombinerOps {
    def combine[T](a: T, b: T)(implicit ev: Combiner[T]): T = ev.combine(a, b)
  }
  ```
  