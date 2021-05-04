# Clojure

## Basics
* First and foremost, Clojure is dynamic. That means that a Clojure program is not just something you compile and run, but something with which you can interact. In particular, you can grow your program, with data loaded, adding features, fixing bugs, testing, in an unbroken stream.
* Clojure models its data structures as immutable objects represented by interfaces, and otherwise does not offer its own class system.
* Clojure has arbitrary precision integers, strings, ratios, doubles, characters, symbols, keywords.
* Clojure is a compiled language, so one might wonder when you have to run the compiler. You don’t. Anything you enter into the REPL or load using load-file is automatically compiled to JVM bytecode on the fly.
* Clojure is a hosted language
* Besides JVM, Clojure also targets JavaScript and the Microsoft Common Language Runtime (CLR)
* clojure.jar - is Clojure compiler - responsible for producting bytecode
* When you install Leiningen, it automatically downloads the Clojure compiler, clojure.jar.

## Functional Programming
* Clojure is a functional programming language. Clojure is impure, in that it doesn’t force your program to be referentially transparent, and doesn’t strive for 'provable' programs. The philosophy behind Clojure is that most parts of most programs should be functional, and that programs that are more functional are more robust.

#### First-class Functions
* `fn` creates a fucntion object. It yields a value like any other - you can store it in a var, pass it to functions, etc.
* `defn` is a macro that makes defining functions a little simpler. 
* Clojure supports arity overloading in a single function object, self-reference, and variable-arity functions using `&`
* You can create local names for values inside a function using `let`
* Locals created with `let` are not variables. Once created their values never change!

#### Immutable Data Structures
* The easiest way to avoid mutating state is to use immutable data structures. Clojure provides a set of immutable lists, vectors, sets and maps.
* Persistence is a term used to describe the property wherein the old version of the collection is still available after the 'change', and that the collection maintains its performance guarantees for most operations. Specifically, this means that the new version can’t be created using a full copy, since that would require linear time.
* Inevitably, persistent collections are implemented using linked data structures, so that the new versions can share structure with the prior version.


You can create new Clojure project using leiningen and following command
`lein new app clojure1`

Leiningen is used to build and manage Clojure projects:
* Creating a new Clojure project
* Running the Clojure project
* Building the Clojure project
* Using the REPL

To execute clojure source, use command - `lein run`
To package your project into a JAR, use command `lein uberjar`


Clojure REPL
To start a REPL, use `lein repl`

All Lisps, Clojure included, employ prefix notation, meaning that the operator always comes first in an expression. 

Conceptually, the REPL is similar to Secure Shell (SSH). In the same way that you can use SSH to interact with a remote server, the Clojure REPL allows you to interact with a running Clojure process.

Using emacs for working with Clojure is recommended
* In Emacs, editing takes place in buffers.
* To switch to a buffer, use C-x b  (Ctrl + x then b) and enter the buffer name in the minibuffer.
* To create a new buffer, use C-x b and enter a new buffer name.
* To open a file, use C-x C-f and navigate to the file.
* To save a buffer to a file, use C-x C-s.
* To create a new file, use C-x C-f and enter the new file’s path. When you save the buffer, Emacs will create the file on the filesystem.

We use the term form to refer to valid code. Clojure evaluates every form to produce a value.
All "operator" operations take the form opening parenthesis, operator, operands, closing parenthesis:
`(operator operand1 operand2 ... operandn)`
Notice that there are no commas. Clojure uses whitespace to separate operands, and it treats commas as whitespace.

This is the general structure for an `if` expression:
```
(if boolean-form
  then-form
  optional-else-form)
```

You can also omit the else branch. If you do that and the Boolean expression is false, Clojure returns `nil`, like this:
```
(if false
  "By Odin's Elbow!")
; => nil
```

Notice that `if` uses operand position to associate operands with the then and else branches: the first operand is the then branch, and the second operand is the (optional) else branch. As a result, each branch can have only one form. To get around this apparent limitation, you can use the `do` operator.

The do operator lets you wrap up multiple forms in parentheses and run each of them. Try the following in your REPL:
```
(if true
  (do (println "Success!")
      "By Zeus's hammer!")
  (do (println "Failure!")
      "By Aquaman's trident!"))
; => Success!
; => "By Zeus's hammer!"
```

The `when` operator is like a combination of `if` and `do`, but with no else branch. Here’s an example:
```
(when true
  (println "Success!")
  "abra cadabra")
; => Success!
; => "abra cadabra"
```

Use when if you want to do multiple things when some condition is true, and you always want to return nil when the condition is false.

Clojure has true and false values. nil is used to indicate no value in Clojure. You can check if a value is nil with the appropriately named nil? function:

```
(nil? 1)
; => false

(nil? nil)
; => true
```

Both `nil` and `false` are used to represent logical falsiness, whereas all other values are logically truthy. Truthy and falsey refer to how a value is treated in a Boolean expression

Clojure’s equality operator is =:
```
(= 1 1)
; => true

(= nil nil)
; => true

(= 1 2)
; => false
```

Clojure uses the Boolean operators `or` and `and`. 
* `or` returns either the first truthy value or the last value. 
* `and` returns the first falsey value or, if no values are falsey, the last truthy value. 

```
(or false nil :large_I_mean_venti :why_cant_I_just_say_large)
; => :large_I_mean_venti

(or (= 0 1) (= "yes" "no"))
; => false

(or nil)
; => nil
```

Clojure has no assignment operator. You can't associate a new value with a name without creating a new scope. Functional alternative to mutation is recursion.

`


Functions
`type` returns type of given expression, for e.g. `(type 8.66667)


### Questions
* Is Clojure strongly-typed language?
  * I guess it is because it's compiled but then what does the "dynamic" mean for Clojure?


# Clojure Fundamentals - Pluralsight Course
## Introduction
* Clojure evaluation
  * It differs from the traditional compilation process in the sense that source code is being read by a "Reader" that converts it into "data structures" which are compiled by Clojure compiler. 
  * Reader could read code from a source file or REPL-prompt
* Operation Forms
  * `(op ...)`
    * `op` can be one of:
      * Special operator (built-in to Clojure) or macro
      * Expression that yields a function
      * Something invocable
* Literals
  ```clojure
  42            ; Long
  6.022e23      ; Double

  42N           ; BigInt
  1.0M          ; BigDecimal
  22/7          ; Ratio

  "hello"       ; String
  \e            ; Character

  true          ; Boolean
  nil           ; null

  + Fred *bob*  ; Symbols (symbols with asterisk on either side are mutable)

  :alpha :beta  ; Keywords
  ```
* Data Structures
  ```clojure
  (4 :alpha 3.0)        ; List
  [2 "hello" 99]        ; Vector
  {:a 1 :b 2}           ; Map
  #{ram shyam aam}      ; Set
  ```
  * Clojure collections are heterogeneously typed
* Metadata
  * Clojure supports metadata, which is ability to attach maps of data to any object. These maps do not affect the equality of the object.
  * You attach metadata using `with-meta`
  ```clojure
  (with-meta [1 2 3] {:example true})
  ;;=> [1 2 3]

  (meta (with-meta [1 2 3] {:example true}))
  ;;=> {:example true}
  ```
  * Clojure uses these to store function documentation strings
* Clojure has several built-in reader macros, which are kind of syntactic shortcuts. A reader macro is a pattern of characters that the clojure reader understands and knows to expand to some usally larger piece of code.
  | Reader Macro | Expansion| Comments|
  |--|--|--|
  |`'foo`| `(quote foo)` | quote is a special operator that returns its argument unevaluated  |
  | `#'foo` | `(var foo)` |  |
  | `@foo` | `(deref foo)` ||
  | `#(+ % 5)` | `(fn [x] (+ x 5))` | Short annonymous function reader macro|
  | `^{:key val} foo` | `(with-meta foo {:key val}` |
  | `^:key foo` | `(with-meta foo {:key true}` |
* Leiningen Directory Structure
  |Path |Purpose|
  |--|--|
  |`project.clj`| Project/build config |
  |`classes/`| Compiled bytecode |
  |`lib/`| Dependent JARs |
  |`public/`| HTML/CSS/JS files for web |
  |`src/`| Clojure source |
  |`test/`| Unit tests |
* Maven Directory Structure
  |Path |Purpose|
  |--|--|
  |`pom.xml`| Project/build config |
  |`target/classes`| Compiled bytecode |
  |`~/.m2/repository`| Dependent JARs |
  |`src/main/clojure`| Clojure sourece |
  |`src/test/clojure`| Unit tests |

## Functions
* Clojure is a functional programming language. Functions are first-class which means that a function object is treated like any other value and can be passed to other functions. Clojure also supports higher-order functions which means functions can take functions as arguments, that's simply an implication of functions being first-class.
* Functions are first-class abstractions in Clojure
  * Can be stored, passed as argument, invoked
* `fn` creates a function with named parameters and body
* `fn` create annonymous function
* Clojure gives us a mechanism to store functions in a named Var for later use. A Var is a reference type in Clojure which is a mechanism for naming things.
  ```clojure
  (def messenger (fn [msg] (print msg)))
  ;; is equivalent to this 
  (defn messenger [msg] (print msg))
  ```
* Using `defn` macro to create a named function is the common approach
* `let` binds symbols to immutable values
  * Values may be literals or expressions
  * Bound symbols are available in lexical scope
* Functions in Clojure can have multiple arities, which is to say there can be multiple versions of the same function that are differentiated by the number of arguments that they take.
  * Arity just means the number of arguments
  ```clojure
  (defn messenger
    ;; no args, call self with default msg
    ([] (messenger "Hello World!"))
    ;; one arg, print it
    ([msg] (print msg)))
  ```
* Variadic functions i.e. function of indefinite arity, which is to say that we can create arity for a function that can take any number of arguments. 
  * Collected args represented as sequence
  ```clojure
  (defn messenger [greeting & who]
    (print greeting who))

  (messenger "Hello" "world" "class")
  ;; Hello (world class)
  ```
* `apply` is a way to invoke a function on a collection of arguments. Given a function and some sequence, apply that sequence to the function as if they were the arguments.
  ```clojure
  ;; & puts rest of args into sequence
  (defn messenger [greeting & who]
    ;; apply gets args out of sequence
    (apply print greeing who))
  
  (messenger "Hello" "world" "class")
  ;; Hello world class
  ```
* Invoking Java code
  |Task|Java|Clojure|
  |--|--|--|
  | Instantiation| `new Widget("foo")` | `(Widget. "foo")` |
  | Instance method | `rnd.nextInt()` | `(.nextInt rnd)`|
  | Instance field |`object.field`| `(.-field object)`|
  | Static method | `Math.sqrt(25)`| `Math/sqrt 25`|
  | Static field | `Math.PI`| `Math/PI`|
* Chaining Access
  |Language|Syntax|
  |--|--|
  |Java| `person.getAddress().getZipCode()` |
  | Clojure | `(.getZipCode (.getAddress person))` |
  | Clojure sugar | `(.. person getAddress getZipCode` |
* Java Methods vs Functions
  * Java methods are not Clojure functions
  * Can't store them, pass as arguments
  * Can wrap them in functions when necessary
  ```clojure
  ;; make a function to invoke .length on arg
  (fn [obj] (.length obj))
  ```
* Clojure gives a terse reader macro `#()` for short fns defined inline
  * Single argument: `%`
  * Multiple args: `%1, %2, %3`
  * Variadic: `%&` for remaining args
  ```clojure
  ;; a function to invoke .length on arg
  #(.length %)
  ```

## Namespaces
* Namespaces are a modularization tool in Clojure.
* Namespace scopes give us the ability to modularize the naming of:  
  * Vars
  * Keywords
  * Java type names.
* Vars are the thing that is actually created when we use `def` or `defn` inside the namespace. They're an object that represents a named value, and they're stored in namespaces.
  ```clojure
  ;; In the namespace "foo.bar"
  (defn hello [] (prinntln "Hello, world"))

  ;; In another namespace
  (foo.bar/hello)       ; namespace-qualified
  ```
* All the functions in Clojure for working with namespaces do  one of the four operations:
  * Load - find source on classpath and evaluating it
  * Alias - make shorter name for namespace-qualified symbols
  * Refer - copy symbol bindings from another namespace into current namespace
  * Import - make Java class names available in current namespace
* `require`
  * Loads the namespace if not already loaded, it finds source on classpath and evaluates it 
    * [GJ]: What does evaluation here mean?
  * It takes a symbol as an argument, that must be quoted
  ```clojure
  (require 'clojure.set)
  ;;=> nil

  (clojure.set/union #{1 2} #{2 3 4})
  ;;=> #{1 2 3 4}
  ```
  * Optionally, you can provide an alias for the loaded namespace. You provide a vector as an argument, that must be quoted
  ```clojure
  (require ['clojure.set :as set])
  ;;=> nil

  (set/union #{1 2} #{2 3 4})
  ;;=> #{1 2 3 4}
  ```
* `use`
  * Does everything that `require` does and it also brings all of the symbols into current namespace so that we can use them without referring them in a fully-qualified way
  * Clojure warns when symbol names clash 
  * Not recommended except for REPL
  * `use :only`
    * Refers only specified symbols into current namespace. It provides a way to mitigate the problem of name collision.
    ```clojure
    (use `[clojure.string :only (join)])
    ;;=> nil

    (join "," [1 2 3])
    ;;=> "1,2,3"
    ```
* Reloading namespace
  * By default, when you do `require` or `use`, that namespace is loaded only once
  * `use` and `require` take optional flag to force reload
  ```clojure
  ;; Reload just thr foo.bar namespace
  (require 'foo.bar :reload)

  ;; Reload foo.bar and everything required or used by foo.bar
  ;; However, it will NOT reload tertiary dependencies
  (require 'foo.bar :reload-all)
  ```
* `import` 
  * Makes Java classes available w/o package prefix in current namespace
  * Argument is a list, quoting is optional
  * Does not support aliases/renaming
  * Does not support Java's `import *`
  ```clojure
  (import (java.io FileReader File))
  ;;=> nil

  (FileReader. (File. "readme.txt"))
  ;;=> #<FileReader ...>
  ```
* `ns`
  * Macro to declare a namespace at top of file
  * Automatically refers all of `clojure.core`, making functions in clojure.core available without qualification.
  * Also imports all of `java.lang` so classes like `String` are available without qualification
  * Using `ns :require` you can declare a namespace and also specify the namespaces required for the new namespace
  ```clojure
  (ns my.cool.project
    (:require [some.ns.foo :as foo]))
  
  (foo/function-in-foo)
  ```
* Private Vars
  * Namespaces contain named definitions and it's possible to add metadata to the definition to indicate that it should be private to that namespace
  * Add `^:private` metadata to a definition
    * `defn-` is shortcut for `defn ^:private`
* `the-ns`
  * Namespaces are first class objects but their *names* are not normal symbols.
  ```clojure
  clojure.core
  ;;=> ClassNotFoundException: clojure.core

  (the-ns 'clojure.core)
  ;;=> #<Namespace clojure.core>
  ```


## Collections
* Every Clojure collection is immutable
* Clojure provides comparatively few number of data structures but they are incredibly general
* Clojure also provides seq abstraction that is common across all data structures and allows us to take any data structure and view it as a sequence
* Large library of functions that work with many of these data structures
* Immutability
  * In Clojure, values of compound data structures are immutable too, which is key to Clojure's concurrency model
* Persistent data structures 
  * It makes immutables collections efficient
  * Persistent collections are built from their old values plus any modifications (instead of a full copy)
  * All Clojure data structures are persistent 
* Lists
  * Clojure lists are singly-linked lists
  ```clojure
  ()              ;=> the empty list
  (1 2 3)         ;=> error because 1 not function
  (list 1 2 3)    ;=> (1 2 3)
  '(1 2 3)        ;=> (1 2 3)
  (conj '(2 3) 1) ;=> (1 2 3)
  ```
* Vectors
  * Indexed, random-access, array-like
  ```clojure
  []                ;=> the empty vector
  [1 2 3]           ;=> [1 2 3]
  (vector 1 2 3)    ;=> [1 2 3]
  (vec '(1 2 3))    ;=> [1 2 3]
  (nth [1 2 3] 0)   ;=> 1
  (conj [1 2] 3)    ;=> [1 2 3]
  ```
* Maps
  * Key => value, hash table, dictionary
  * Unordered
  ```clojure
  {}
  {:a 1 :b 2}
  {:a {:a 1 :b 2}}
  ```
## Miscellaneous
|Clojure|Notes|
|--|--|
|`(ns-publics) 'clojure.java.io)`| Returns map of all symbols available in given quoted symbol. It will use the given symbol as a namespace. |
| `(dir clojure.java.io)` | Returns named symbols listing for given namespace |
| `(doc delete-fil)`| Returns documentation string for given function |
* Clojure web "stack"
  ```
  My traditional backend has trended towards ring + jetty + polaris (routing) + java.jdbc (DB connectivity) + ragtime (migrations) + hugsql or honeysql (ORM alternatives)

  ring + compojure is what i used for clojure at work. i think you can find/create ring middleware for everything you’re used to having in Play. i also know of Luminus but haven’t used it myself
  ```


