# Kotlin

# Installation
* Comes pre-installed with IntelliJ
* You can install command-line compiler (`kotlinc`)

# Overview
* Kotlin is a JVM language
* Kotlin is an object-oriented language
* Kotlin is also a functional language
* Kotlin has way less ceremony than Java
* You can use REPL to play with language 
* Kotlin files have `kt` extension
* Hello World using Kotlin:
  ```kotlin
  fun main(args: Array<String>) {
    print("Hello World!")
  }
  ```
  * Few things to note here:
    * You don't need a class
    * Return type is not explicitly specified for the `main` function which meant it will be `Unit` (same as `void` in Java)
    * No semicolons
* You can compile a kotlin file using `kotlinc hello.kt`, it will produce a `hello.class` file upon successful compilation. To produce a JAR file that includes Kotlin runtime, use `kotlinc hello.kt --include-runtime -d hello.jar`, which then can be executed using JVM using `java -jar hello.jar`
* Why use Kotlin?
  * Way less ceremony than Java
  * Improves on Java in many ways
