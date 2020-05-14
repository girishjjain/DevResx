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
