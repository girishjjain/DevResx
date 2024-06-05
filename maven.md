# Maven Commands

* To compile all modules in parallel, useful after taking latest to ensure there are no compile errors (shouldn’t be needed in normal course but only to check for compile errors)
  ```
  mvn clean install -DskipTests=true -T1C
  ```

* To compile all modules + execute tests in parallel
  ```
  mvn clean install -T1C
  ```

* To build specific module and its referenced modules
  ```
  mvn -T1C clean install -pl app-modules/common/config-service -am 
  ```

* Resume build from certain module, useful when your build fails for a module then instead of starting over, you can resume after applying fix 
  ```
  mvn clean install -rf app-modules/common/config-service
  ```

* To make sure you didn't break anything, just before commiting your changes
  ```
  mvn clean install
  ```

* To update project dependencies that aren't specific version numbers, pass `-U` (aka --update-snapshots)
  ```
  mvn -U clean install
  ```
* To run tests from a particular test class
  ```
  mvn test -Dtest=classname
  ```
* To list dependencies available on compile/test classpath
  ```
  mvn dependency:build-classpath -DincludeScope=compile
  mvn dependency:build-classpath -DincludeScope=test
  ```
