## Scribble

### Docker
| Command | Description |
| --- | --- |
| `docker images` | List available images |
| `docker pull <url>` | Pull image from a repository. You may need to login using `docker login <repo_url>` before you pull an image |
| `docker ps` | List of running docker containers |
| `docker --version` | Display docker version |
| `docker version` | Display docker version and info |
| `docker info` | Display docker version and info |
| `docker run -it <image_id>` | Runs a container using given image and allocates a pseudo-TTY connected to container's STDIN; creating an interactive bash shell in the container |
| `docker exec -it <container name> /bin/bash` | SSH into a running docker container (get container name by executing `docker ps`) |
| `docker logs <container name/id>` | See all logs of a particular container |
| `docker logs --follow <container name>`| Follow docker container logs output/tail continuously, for e.g. `docker logs --follow engine.base.migration` |

### NodeJS on Debian
* To uninstall currently installed version of NodeJS: `sudo apt-get remove nodejs`
* Refer following page to install NodeJS: https://github.com/nodesource/distributions#debinstall
    * Remeber to execute commands referenced in above link as root (or prefix commands with sudo)

### Postgres
* To start Postgres DB Server - `postgres -D /usr/local/var/postgres`
* Use below script to setup a local DB and user login
```
    CREATE ROLE heimdalluser WITH LOGIN;
    ALTER ROLE heimdalluser WITH PASSWORD 'password';
    ALTER ROLE heimdalluser WITH SUPERUSER CREATEROLE CREATEDB;
    CREATE DATABASE heimdall;
    GRANT ALL PRIVILEGES ON DATABASE heimdall TO heimdalluser;
```
* To connect to Postgres DB using terminal - `psql -h <host_name> -U <user_name> -d <db_name> -W`, for e.g. `psql -h localhost -U heimdalluser -d heimdall -W`


### Python
* Statement grouping is done by indentation instead of beginning and ending brackets
* No variable or argument declarations are necessary


#### OAuth 2.0
* Grant Types
  * Client Credentials Grant
    * Direct Access by the **client** application
    * Access token obtained using client credentials
  * Authorization Code Grant (Most secured)
    * Delegated access to a **backend** application
    * Access token obtained by exchanging code with client credentials
    * Refresh token can be used with client credentials
  * Implicit Grant
    * Delegeated access to a **frontend** application
    * Access token directly obtained through the redirect
    * Not supposed to have access to refresh tokens
* Token 
  * Reference Token or self ontained token


#### OpenID Connect
* Identity layer that sits on top of OAuth 2.0
* Relying Party (RP) is an OAuth 2.0 client that relies on Identity Provider to authenticate user and request claims about that user
* Identity Provider (IdP) is OAuth 2.0 authorization server which offers authentication as a service
* Identity Token contains number of claims (or attributes) about identity of Resource Owner (end user). For example, 
  * Subject - A unique identifier issued to user by IdP
  * Audience - Identifies relying party
* Scopes are used to request specific sets of information, that's made available as claim values, OIDC defines standard scopes. For example, 
  * openid - mandatory scope, identifies request as OpenId Connect request
  * profile - requests access to end user's default profile claims
  * email
  * address
  * phone
* OIDC Endpoints
  * Authorization 
  * Token
  * User Info
* Use cases
  * OAuth (for Authorization)
    * Delegated Authorization (Granting access to your API - user's permission to external system to allow access through API) 
  * OpenId Connect (for Authentication)
    * Logging the user in (Simple Login/SSO)
    * Making your accounts available in other systems
* Tokens
  * Access Token - Opaque to RP (client), to be understood by Resource Server
  * ID Token - Encodes user info, intended to be understood by RP (client)
  * OpenId Connect Grant Types
    * Implicit 
      * Intended for **frontend** application only
      * Allows establishing user's identity
    * Authorization Code
      * Intended for **backend** application
      * Allows connecting identity of the user to an internal user concept
    * Hybrid
      * Identity token is intended for backend application
      * Allows connecting identity of the user to an internal user concept
      * Backend must check if the audience of the token matches its client Id

### Scala Curried and Partially Applied Functions
* Scala let's you pass a __method__ as parameter for a higher-order function, for e.g. passing a method to `List.map`
```scala
  val xs = List(1, 2, 3)
  def times2(a: Int)= a * 2
  xs.map(times2).foreach(println)
``` 
* A method is not same as a function (which are instances of `FunctionX` traits that has `apply` method). 
* Transforming a method to a function is called as lifting (or more technical term ETA-Expansion), and it is performed by compiler
* Functions and methods can be partially applied with underscores. For example,
```scala
  // given below method 
  def simpleAddMethod(x: Int, y: Int) = x + y

  // this returns a partially applied function Int => Int
  val add1 = simpleAddMethod(1, _: Int)

  // Note that add1 is a smaller function - takes 1 parameter
```
* Technique of combining by-name parameters with lazy vals is called as *call by need*


### IntelliJ IDEA Shortcuts
| Command | Description |
| --- | --- |
| `F3` | Toggle Bookmark |
| `Cmd + F3` | View Bookmarks List |
| `Opt + F3` | Toggle Bookmark with Mnemonic |
| `Opt + Cmd + Left Arrow` | To navigate to last known cursor position |
| `Cmd + delete` | Delete current line |
| `Opt, Opt + Up/Down` | Edit multiple lines |
| `Opt + Up Arrow` | Extend selection (repeat keystroke to extend your current selection from block to method to class level) |
| `Shift + F6` | Rename selected member |
| `Shift + Cmd + S` | Select/Go to SBT Shell |
| `Cmd + Opt + Shift + Click n Drag Mouse` | Column selection mode |
| `Opt + Cmd + R` | To resume program (when you're in debug mode and you want execution to continue) |
| `Fn + Cmd + Right Arrow` | Go to end of file |
| `Fn + Cmd + Left Arrow` | Go to start of file |
| `Cmd + Shift + V` | Shows clipboard history pop-up, from [SO post](https://stackoverflow.com/questions/1716793/copy-and-pasting-multiple-items-to-the-clipboard-in-intellij-idea) |


### ScalaTest
* Refer [Style Trait Descriptions and Examples](http://www.scalatest.org/user_guide/selecting_a_style) to understand which base class to use for your test class

### VS Code
* `code --diff file1 file2 ` - Open a file difference editor. Requires two file paths as arguments.

#### Monads
* Monads are abstract types which have some fundamental operations
  * unit (also called pure or apply)
  * flatMap (also called bind)
* List, Option, Try, Future, Stream, Set are all monads.
* Operations need to satisfy three monad laws:
  * left-identity - if you build a monad out of an element and you flatMap it with a function, it should give you function applied to that element i.e. 
  ```scala
  unit(x).flatMap(f) == f(x)
  ```
  * right-identity - if you have a monad instance and you flatMap it with unit function then it should give you same monad instance
  ```scala
  aMonadInstance.flatMap(unit) == aMonadInstance
  ```
  * associativity - if you have a monad instance and you flatMap it with two functions in sequence then that should give you the same thing as flatMap the monad instance with the composite function for every element
  ```scala
  m.flatMap(f).flatMap(g) == m.flatMap(x => f(x).flatMap(g))
  ```
* Monads aren't only applicable when a side effect is desired but also may apply when there is no corresponding impure feature.
* In general, a function of type a → b is replaced by a function of type a → M b. This can be read as a function that accepts an argument of type a and returns a result of type b, with a possible "additional" effect captured by M.

#### Tidbits
* If you're manually trying to inject dependencies (for e.g. using MacWire) in a play framework project and you want to inject Configuration class then use below code:
```scala
import play.api.Configuration
import com.typesafe.config.ConfigFactory

lazy val config: Configuration = Configuration(ConfigFactory.load("application.conf"))
```
* Amazon S3 provides object storage through web services interfaces
* PSQL - To enable expanded display, use \x command and then to turn it off again use same \x command. Expanded display prints result in vertical format


#### Slick
* Slick is a Scala library for accessing relational database using an interface similar to Scala collections library.
