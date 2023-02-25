# SBT
SBT is a build tool for Scala, Java, and more. It requires Java 1.6 or later.

## Features of sbt
* Little or no configuration required for simple projects
* Scala-based build definition that can use the full flexibility of Scala code
* Accurate incremental recompilation using information extracted from the compiler
* Continuous compilation and testing with triggered execution
* Packages and publishes jars
* Generates documentation with scaladoc
* Supports mixed Scala/Java projects
* Supports testing with ScalaCheck, specs, and ScalaTest. JUnit is supported by a plugin.
* Starts the Scala REPL with project classes and dependencies on the classpath
* Modularization supported with sub-projects
* External project support (list a git repository as a dependency!)
* Parallel task execution, including parallel test execution
* Library management support: inline declarations, external Ivy or Maven configuration files, or manual management

## Installation 
* `brew install sbt` on Mac

## Getting Started
* To setup a simple (Hello World) build definition, run `sbt new sbt/scala-seed.g8` command. Once setup, you can start sbt shell from base directory with `sbt` command. To exit sbt shell, use `exit` command. 
* In sbt’s terminology, the “base directory” is the directory containing the project, so if you created a project hello containing hello/build.sbt, hello is your base directory
* The build definition is described in `build.sbt` (actually any files named *.sbt) in the project’s base directory
* Build support files - In addition to build.sbt, `project` directory can contain .scala files that defines helper objects and one-off plugins, for e.g.
```
build.sbt
project/
  Dependencies.scala
```
* sbt uses the same directory structure as Maven for source files by default (all paths are relative to the base directory). Other directories in `src/` will be ignored.
```
  src/
    main/
      resources/
        <files to include in main jar here>
      scala/
        <main Scala sources>
      java/
        <main Java sources>
    test/
      resources/
        <files to include in test jar here>
      scala/
        <test Scala sources>
      java/
        <test Java sources>
```
* You may see .sbt files inside project/ but they are not equivalent to .sbt files in the project’s base directory
* Build products - Generated files (compiled classes, packaged jars, managed files, caches, and documentation) will be written to the `target` directory by default
* Batch mode - You can also run sbt in batch mode, specifying a space-separted list of commands and arguments. **Note**: Running in batch mode requires JVM spinup and JIT each time, so your build will run much slower.
* To specify SBT version to be used for your build, create a file named `project/build.properties` that specifies the sbt version as follows:
`sbt.version=0.13.18`
  * If the required version is not available locally, the sbt launcher will download it for you
  * If this file is not present, the sbt launcher will choose an arbitrary version, which is discouraged because it makes your build non-portable

## Build Definition
* Defined in `build.sbt` (along with build support files in project directory) and it contains a set of projects (of type `Project`). Because the term project can be ambiguous, it's often called subproject in SBT documentation
* To load subproject located in the current directory, use:
```scala
  lazy val root = (project in file(".")).settings(
      name := "Hello",
      scalaVersion := "2.12.2"
    )
```
* Each subproject is configured by key-value pairs. For example, one key is `name` and it maps to a string value. The key-value pairs are listed under `.settings(...)` method
* Essentially speaking, build.sbt defines subprojects, which holds a sequence of key-value pairs called _setting expressions_ using build.sbt DSL
* A setting expression consists of three parts:
  * Left-hand side is a _key_
  * _Operator_, which in this case is `:=`
  * Right-hand side is called the _body_ or _setting body_
* On the left-hand side, `name` and `scalaVersion` are _keys_. 
* A key is an instance of `SettingKey[T]`, `TaskKey[T]`, or `InputKey[T]` where T is the expected value type
* build.sbt may also be interspersed with val, lazy val, and defs. Top-level classes and objects are not allowed in build.sbt. Those should go in the project/ directory as Scala source files.
* Typically, lazy vals are used instead of vals to avoid initialization order problems.

### Keys
* Types - There are three flavors of key:
  * `SettingKey[T]` - a key for a value computed once (value is computed when loading subproject and value is kept around)
  * `TaskKey[T]` - a key for a value, called a _task_, that has to be recomputed each time, potentially with side effects
  * `InputKey[T]` - a key for a task that has command line arguments as input
* Built-in Keys
  * Defined as fields in an object called `Keys`
  * A build.sbt implicitly has an `import sbt.Keys._`, so `sbt.Keys.name` can be referred to as `name` 
* Custom Keys 
  * Can be defined with their respective creation methods - `settingsKey`, `taskKey`, and `inputKey`. Each method expects the type of the value associated with the key as well as a description. The name of the key is taken from the val, the key is assigned to:
  ```scala
    lazy val hello = taskKey[Unit]("An example task")
  ```
* Task vs Setting keys
  * A `TaskKey[T]` is said to define a _task_. Tasks are operations such as `compile` or `package`. They may return `Unit`, or they may return a value related to the task. For example `package` is a `TaskKey[File]` and its value is the JAR file it creates.
  * Each time you start a task execution, for example, `compile` at sbt prompt, sbt will re-run any tasks involved exactly once.
  * _A given key always refers to either a task or a plain setting_. That is "taskiness" (whether to re-run each time) is a property of the (type of) key, not the value.
* Defining tasks and settings
  * Using `:=`, you can assign a value to a setting and a computation to a task. For a setting, value will be computed once at project load time. For a task, the computation will be re-run each time the task is executed.
  * For example, to implement the `hello` task defined earlier,
  ```scala
    lazy val hello = taskKey[Unit]("An example task")

    lazy val root = (project in file(".")).settings(
      hello := { println("Hello!") }
    )
  ```
  * Appending Values - Assignment with `:=` is the simplest but if the key's value type is a sequence, you can append to sequence rather than replacing it:
    * `+=` will append a single element to sequence
    * `++=` will concatenate another sequence

* Types for tasks and settings
  * From a type-system perspective
    * `settingKey := 41` results in `SettingKey[T]`
    * `taskKey := 41` results in `TaskKey[T]`
  * A setting can't depend on a task (as a setting is evaluated only once on project load and not re-run), more on this later

### Adding library dependencies
* sbt uses Apache Ivy to implement managed dependencies
* To add a managed dependency, use
```scala
  val derby = "org.apache.derby" % "derby" % "10.4.1.3"

  lazy val root = (project in file(".")).settings(
    ...
    libraryDependencies += derby
  )
```
* The % method is used to construct an Ivy module ID from strings
* Per-configuration dependencies
  * To add a dependency only for your `Test` configuration and not `Compile` configuration, add `% "test"`, for example:
  ```scala
    libraryDependencies += "org.apache.derby" % "derby" % "10.4.1.3" % "test"
    
    // Or, the type-safe version
    libraryDependencies += "org.apache.derby" % "derby" % "10.4.1.3" % Test
  ```

### Task Graph
* Rather than thinking of `settings` as key-value pairs, a better analogy would be to think of it as a _directed acyclic graph_ (DAG) of tasks where the edges denotes **happens-before**. Let's call this the _task graph_.
* Declaring tasks dependency
  * In build.sbt DSL, we use `.value` to express the dependency to another task or setting.
  * The value method is special and may only be called in the argument to := (or, += or ++=)
  * As an example, consider below example of scalacOption that depends on `compile` and `update` tasks
  ```scala
    scalacOptions := {
      val updateResult = update.value     // declares task dependency
      val x = clean.value

      updateResult.allConfigurations.take(3)
    }
  ```
  * `update.value` and `clean.value` declare task dependencies, whereas `updateResult.allConfigurations.take(3)` is the body of the task
  * `.value` is not a normal Scala method call, `build.sbt` DSL uses a macro to lift these outside of the task body. 
  * Both `update` and `clean` tasks are completed by the time task engine evaluates the opening `{` of `scalacOptions` regardless of which line it appears in the body. Even if you had `.value` reference inside a conditional expression, it would still run dependent task before the body of task.
  * Important thing to note here is that there is no guarantee about the ordering of `update` and `clean` tasks. They might run `update` then `clean`, or `clean` then `update`, or both in parallel
  * Bottom line, if you use a key's value in another computation, then the computation depends on that key.
* Advantages of Task Graph
  * De-duplication - A task is executed only once even when it is depended by multiple tasks
  * Parallel processing - Task engine can schedule mutually non-dependent tasks in parallel
  * Separation of Concern - Task graph lets user wire tasks together in different ways while sbt and plugins can provide various features such as compilation and library dependency management

#### Summary
* Core data structure of the build definition is a DAG of tasks, where the edges denote happens-before relationship.

## Scopes
* "A key corresponded to one entry in sbt's map of key-value pairs" - that was a simplification.
* In truth, each key can have an associated value in more than one context, called a _scope_. 
* For example, 
  * If you have multiple projects (or subprojects) in your build definition, a key can have different value in each project. 
  * the `packageOptions` key (which contains options for creating jar packages) may have different values when packaging class files (`packageBin`) or packaging source code (`packageSrc`)
* There is no single value for a given key **name**, because the value may differ according to scope. However, there is a single value for a given _scoped_ key.
* Each setting defined in the build definition applied to a scoped key as well.

### Scope Axes
* A _scope axis_ is a type constructor similar to `Option[A]`, that is used to form a component in a scope.
* There are three scope axes:
  * subproject axis
  * dependency configuration axis
  * task axis
* Think of it as RGB color cube, as an example, where all colors are represented by a point in the cube whose axes correspond to red, gree, and blue components encoded by a number. Similarly, a full scope in sbt is formed by a **tuple** of a subproject, a configuration, and a task value. 
* Scoping by subproject axis
  * If you put multiple projects in a single build, each project needs its own settings. That is, keys can be scoped according to the project. 
  * The project axis can also be set to `ThisBuild`, which means the "entire build"
  * Build-level settings are often used as a fallback when a project doesn't define a project-specific setting
* Scoping by configuration axis
  * A _dependency configuration_ (or "configuration" for short) defines a graph of library dependencies, potentially with its own classpath, sources, generated packages, etc.
  * Some configurations you'll see in sbt:
    * `Compile` which defines the main build (`src/main/scala`)
    * `Test` which defines how to build tests (`src/test/scala`)
    * `Runtime` which defines the classpath for the run task
  * As keys are scoped to a configuration, they may work differently in each configuration.
  * A configurtion can extend other configurations
* Scoping by task axis
  * Settings can affect how a task works. For example, the `packageSrc` is affected by `packageOptions` setting. To support this, a task key (such as `packageSrc`) can be a scope for another key (such as `packageOptions`)
  * Remember, a setting (key) can't depend on a task (key) but can have a task scope
* Global scope
  * `Global` (which is also written as `*`) is a special value commonly used as a universal fallback for scope axes
  * Direct use of `*` should be reserved to sbt and plugin authors in most cases 
* Referring to scopes in build definition
  * If you create a setting in build.sbt with bare key, it will be scoped to (current subproject, configuration Global, task Global)
  * A bare key on the right-hand side is also scoped to (current subproject, configuration `Global`, task `Global`). For example:
  ```scala
    organization := name.value
  ```
  * Keys have an overloaded method called `in` that is used to set the scope. The argument to `in(...)` can be an instance of any of the scope axes. For example, you could set `name` scoped to `Compile` configuration 
  ```scala
    name in Compile := "hello"
  ```
  or something like this (it's pointless, just an example)
  ```scala
    name in packageBin := "hello
  ```
  or you could set the name with multiple scope axes
  ```scala
    name in (Compile, packageBin) := "hello"
  ```
  or you could use `Global` for all axes
  ```scala
    // same as concurrentRestrictions in (Global, Global, Global)
    concurrentRestrictions in Global := Seq(
      Tags.limitAll(1)
    )
  ```
* Inspecting Scopes
  * In sbt shell, you can use `inspect` command to understand keys and their scopes. Try `inspect test:fullClasspath`
* When to specify a scope
  * You need to specify the scope if the key in question is normally scoped, for example, the `compile` task, by default, is scoped to `Compile` and `Test` configurations, and does not exist outside of those scopes.
  * To change value associated with `compile` task, you need to write `compile in Compile` or `compile in Test`. Using plain `compile` would define a new `compile` task scoped to current project (with `Global` configuration, and `Global` task), rather than overriding the standard `compile` tasks which are scoped to a configuration.
  * The name is only part of a key. In reality, all keys consist of both a name, and a scope (where the scope has three axes). The expression `packageOptions in (Compile, packageBin)` is a key name. Simply `packageOptions` is also a key name, but a different one.
* Build-level settings
  * An advanced technique for factoring out common setttings across subprojects is to define settings scoped to `ThisBuild`
  * If a key scoped to a particular subproject is not found, sbt will look for it in `ThisBuild` as a fallback
  * Not recommended to use build-level settings beyond simple value assignments


## Multi-Project Builds
* A project is defined by declaring a lazy val of type `Project`. For example:
```scala
  lazy val util = (project in file("util"))
  lazy val core = (project in file("core"))
```
* The name of the val is used as the subproject’s ID
* Aggregation
  * Aggregation means running a task on aggregate project will also run it on aggregated projects. For example,
  ```scala
    lazy val root = (project in file(".")) .aggregate(util, core)
    lazy val util = (project in file("util"))
    lazy val core = (project in file("core"))  
  ```
  * In the above example, the root project aggregates util and core. Now start up sbt and try `compile` and all three prjects should be compiled
* Classpath dependencies
  * A project may depend on code in another project. This is done by adding a `dependsOn` method call. For example, if core needed util on its classpath, you would define core as:
  ```
    lazy val core = project.dependsOn(util)
  ```
* Default root project - If a project is not defined in the root directory in the build, sbt creates a default one that aggregates all other projects in the build

## Using Plugins
* A plugin extends build definition, for example, a plugin could add a `codeCoverage` task which would generate a test coverage report.

## Custom Settings and Tasks
* Defining a key
  * Keys have one of three types - `SettingKey`, `TaskKey`, or `InputKey`
  * The type parameter `T` in `SettingKey[T]` indicates type of value the setting has
  * `T` in `TaskKey[T]` indicates type of the task's result
  * Keys may be defined in an .sbt file, a .scala file, or in an auto plugin.
* Implementing a task
  * Once you've defined a key for your task, you'll need to complete it with a task definition.
  * You could be defining your own task, or you could redefine an existing task
  * Either way, code looks same, use `:=` to associate some code with task key:
  ```scala
    val sampleStringTask = taskKey[String]("A sample string task.") 
    val sampleIntTask = taskKey[Int]("A sample int task.")
    lazy val commonSettings = Seq( organization := "com.example", version := "0.1.0-SNAPSHOT")

    lazy val library = (project in file("library")) .settings(
        commonSettings,
        sampleStringTask := System.getProperty("user.home"),
        sampleIntTask := {
          val sum = 1 + 2 
          println("sum: " + sum) 
          sum
        }
      )
  ```
  * If task has dependencies, you would refer their value using `value` as explained earlier
  * sbt has some libraries and convenience functions, in particular you can use the convenient APIs in IO to manipulate files and libraries.

## Execution semantics of tasks
* When depending on other tasks from a custom task, an important detail to note is the execution semantics of the custom tasks i.e. exactly _when_ these tasks are evaluated
* Sequential semantics - When each line in the body would be strictly evaluated sequentially, i.e. one after the other.
* When a task depends on other tasks (by referencing it's result with .value) then tasks engine creates a dependency DAG of tasks to denote task-dependency, and achieve following:
  * evaluate task dependencies, _before_ evaluating the task (partial ordering)
  * try to evaluate task dependencies in parallel if they are independent (parallelization)
  * each task dependency will be evaluated once and only once per command execution (de-duplication)
* Unlike plain Scala method calls, invoking `value` on tasks will not be evaluated strictly. Instead, they simply act as placeholders.
* In below example, task depends on two other tasks but it will not produce intended result:
  ```scala
    sampleTask := {
      startServer.value
      val sum = 1 + 2
      println("sum:" + sum)
      stopServer.value        // This WON'T work
      sum
    }
  ```
  * It produces following output:
  ```
    sbt:sbt> sampleTask
    stopping server...
    starting server...
    sum:3
  ```
  * The `stopServer` task would be evaluated before `sampleTask` evaluation begins.
* Cleanup Tasks - The notion of cleanup task does not fit into the execution model of tasks because tasks are about tracking dependencies.
* How should one implement `stopServer` task? For instance, `stopServer` should depend on `sampleTask`, at which point `stopServer` should be the `sampleTask`.
* You can have a task depend on itself (personally, I would avoid this), for example,
```scala
    taskA := {
      println("taskA first part is evaluated")
      "Hi"
    },
    taskA := {
      val old = taskA.value
      println("taskA second part is evaluated")
      "Bye"
    }
```
* With above approach, you can solve earlier problem of `sampleTask` by rewriting it as follows:
```scala
    sampleTask := {
      startServer.value
      val sum = 1 + 2
      println("sum:" + sum)
      sum
    }
    sampleTask := {
      sampleTask.value
      stopServer.value
      sum
    }
```
* Another way of making sure that something happens after some other thing is to use Scala. Implement a simple function in project/ServerUtil.scala, for example and since method calls follow sequential semantics, everything would happen in order. There's no de-duplication so you have to be careful about that.


#### Common SBT Commands
| Command | Description |
| --- | --- |
| `clean` | Deletes all generated files (in `target` directory) |
| `compile` | Compiles main sources (in src/main/scala and src/main/java directories) |
| `test` | Compiles and runs all tests |
| `console` | Starts scala interpreter with a classpath including compiled sources and all dependencies |
| `run` | Runs the main class for the project in the same virtual machine as sbt |
| `package` | Creates a JAR file containing the files in src/main/resources and the classes compiled from src/main/scala and src/main/java |
| `help <command>` | Displays detailed help for the specific command |
| `reload` | Reloads the build definition, needed if you change build definition |
| `subProjId/compile` | Run a task in another project by explicitly specifying the project ID |
| `;compile ;test:compile ;it:compile` | Compile everything - code, (unit) tests, and integration tests (under it folder) |
| `projects` | Lists all projects in build definition |
| `project <project_name>` | When build definition has multiple subprojects, use this command to set a project in scope |
| `compile:sourceDirectory` <br/> `test:sourceDirectory` | Retrieve value of certain setting keys. For example, to get path of compile sources, use `compile:sourceDirectory` |
| `inspect`| Examples: `inspect sbtVersion`, `inspect scalaVersion`, `inspect test:fullClasspath` |
| `;coverage ;testOnly com.rallyhealth.authn.services.ArachneAndLegacyAuthServiceSpec ;coverageReport ;coverageAggregate` | Coverage with a single test |
| `;clean ;update ;coverage ;test ;coverageReport ;coverageAggregate` | Get unit tests coverage |
| `;clean ;update ;coverage ;test ;it:test ;coverageReport ;coverageAggregate` | Get coverage including integration tests |
| `it:testOnly com.rallyhealth.authn.api.oidc.AdvantageOIDCPickupV3Test -- -z "return 200 with authz_code_done when pickup for advantage is enabled for user with surrogateId"` ||
| `eval scala.sys.env("ENV")` | To find value of an environment variable, for e.g., this would return value of `ENV` environment variable |
| `show package` | `show` can be used to show output of setting/task |
|`show compile:fullClasspathAsJars`| Compile time internal and external dependencies, all as JARs |


# References
  * [SBT Documentation](https://www.scala-sbt.org/0.13/docs/index.html)
  * Use `@scala_sbt` for questions and discussions on Twitter


### Questions/Doubts
```
Tasks based on other keys’ values You can compute values of some tasks or settings to define or append a value for another task. It’s done by using Def.task and taskValue as an argument to :=, +=, or ++=.
As a first example, consider appending a source generator using the project base directory and compilation classpath.
sourceGenerators in Compile += Def.task {
  myGenerator(baseDirectory.value, (managedClasspath in Compile).value)
}.taskValue
```
My understanding - Above example defines a task on the fly, instead of having a named task, using Def.task {...} and it's value is extracted using taskValue. It's body is like any other task body that could depend on another key using .value
