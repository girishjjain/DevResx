## Scribble

### SDKMAN
* To set default version of java - `sdk default java 17.0.6-zulu`

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


## Queries
* `\l` - List databases
* `\c <db_name>` - Change database
* `\x` - Turn extended display on/off
* `\dt` - List tables
* `\d <table_name>` - Table schema including indexes
* `explain select * from accounts where id='e8999468-79e8-4a34-abf9-c284a059e9af';`
* `select * from device_credentials where created_at > now() - interval '1 week' limit 10;`
* List partition bounds
  ```sql
  SELECT t.oid::regclass AS partition,
        pg_get_expr(t.relpartbound, t.oid) AS bounds
  FROM pg_inherits AS i
    JOIN pg_class AS t ON t.oid = i.inhrelid
  WHERE i.inhparent = 'rp_session_2'::regclass;
  ```

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
| `Opt + Tab` | Navigate between "tab groups" |
| `Ctrl + Shift + [` or `Ctrl + Shift + ]` | Navigate between start and end of current block/braces |
| `Ctrl + G` | Select next occurrence of current selection |
| `Ctrl + T` | Brings up refactoring menu and then start typing first letter of the menu option to select it, for example, to select "Introduct Parameter", type ip |
| `F1` | To see documentation for the symbol at the caret |
| `Opt + Space` | To see definition popup for the symbol at the caret |
| `F2` | To go to next highlighted error in file |
| `Cmd + Shift + F7` | To highlight usages |
| `Ctrl + Cmd + G` | Select all occurrences of the selection. Extremely useful for editing multiple instances of selection |
| `Shift + Esc` | To hide active tool window |

### ScalaTest
* Refer [Style Trait Descriptions and Examples](http://www.scalatest.org/user_guide/selecting_a_style) to understand which base class to use for your test class

### VS Code
* `code --diff file1 file2 ` - Open a file difference editor. Requires two file paths as arguments.
* Keyboard Shortcuts for Scala
| Command | Description |
| ---| ---|
| `Cmd + Shift + O` | Show symbols in current file |


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
* Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real time. CloudWatch data is pushed to DataDog using the provided CloudWatch integrations.
* PSQL - To enable expanded display, use \x command and then to turn it off again use same \x command. Expanded display prints result in vertical format


#### Slick
* Slick is a Scala library for accessing relational database using an interface similar to Scala collections library.


#### GitHub Search
* [Searching Code in GitHub](https://help.github.com/en/articles/searching-code)
* An example: `org:AudaxHealthInc "extends Table" in:file "json" in:file extension:scala`


## Play Framework Essentials (Book Notes)
* The code called by controllers must be thread safe, hence the use of concurrent collections in action methods.
* Though based on sbt, Play projects do not follow the standard sbt projects layout: source files are under the app/ directory, test files under the test/ directory, and resource files (for example, configuration files) are under the conf/ directory.
* The conf/application.conf file contains the application configuration information as key-value pairs. It uses the Human Optimized Configuration Object Notation syntax (HOCON; it is a JSON superset, check out https://github.com/typesafehub/config/blob/master/HOCON.md for more information).

### URL routing
* The conf/routes file defines the mapping between the HTTP endpoints of the application (URLs) and their corresponding actions.
* Apart from comments (starting with #), each line of the routes file defines a route associating an HTTP verb and a URL pattern to a controller action call.

* In Play, the component responsible for interpreting the body of an HTTP request is named body parser.
* HTTP layer tests
```
package controllers
import play.api.test.{PlaySpecification, FakeRequest, WithApplication}
import play.api.libs.json.Json

class ItemsSpec extends PlaySpecification {
  "Items controller" should {
    "list items" in new WithApplication {
      route(FakeRequest(controllers.routes.Items.list())) match {
        case Some(response) => status(response) must equalTo (OK) contentAsJson(response) must equalTo (Json.arr())
        case None => failure
      }
    }
  }
}
```
* The route method calls the Items.list action using a fake HTTP request and returns its response. Note that the fake request is built using the reverse router. Then, if the routing process succeeds, the status method extracts the response status code and the contentAsJson method reads the response content and parses it as a JSON value.
* Refer to the API documentation of play.api.test.PlaySpecification (play.test.Helpers in Java) for an exhaustive list of supported features.
* You can define application-level settings by implementing an object that extends the play.api.GlobalSettings class. This class provides hooks on the application's life cycle and allows you to define some common behavior for your HTTP layer (for example, what to do if routes don't match an incoming request, or things to do before or after each action invocation).

## URI vs URL
* URI - Uniform Resource Identifier
  * Identifies a resource, could just be a name and don't need to have protocol
* URL - Uniform Resource Locator
  * URL is what we come across on a day-to-day basis, for e.g. https://yahoo.com, the protocol and other parts are well defined
* Theoretically URL is a subset of URI but in practice may not always be the case. For example, in Java a `java.net.URI` class would throw exception if the string contains '|' (pipe) character but `java.net.URL` class accepts it fine. URI class follows the RFC-2396 (and updates) to it strictly.
* For most of the cases, you want to use `URL` class instead of `URI` in your code

## React Native
* React Lifecycle Methods Diagram
  - https://reactjs.org/docs/react-component.html
  - https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/

## Kubernetes
* Containers encapsulate microservices and their dependencies but do not run them directly. Containers run container images.
* A container image bundles the application along with its runtime, libraries, and dependencies, and it represents the source of a container deployed to offer an isolated executable environment for the application.
* Container orchestrators are tools which group systems together to form clusters where containers' deployment and management is automated at scale
* Kubernetes is an open source container orchestration tool, originally started by Google, today part of the Cloud Native Computing Foundation (CCNF) project.
* Kubernetes Featuers
  * Automatic Bin Packing - Kubernetes automatically schedules containers based on resource needs and constraints, to maximize utilization without sacrificing availability.
  * Self-healing - Kubernetes automatically replaces and reschedules containers from failed nodes. It kills and restarts unresponsive containers based on health check and rules/policy. It also prevents traffic from being routed to unresponsive containers.
  * Horizontal Scaling - With Kubernetes applications can be scaled manually or automatically based on CPU or custom metrics utilization.
  * Service discovery and Load balancing - Containers receive their own IP addresses from Kubernetes, while it assigns a single Domain Name System (DNS) name to a set of containers to aid in load-balancing.
* Other fully supported Kubernetes features
  * Automated Rollouts and Rollbacks
  * Secret and Configuration Management
  * Storage Orchestration
  * Batch execution
* Kubernetes Architecture
  * At a very high level, Kubernetes has the following main components:
    * One or more **master nodes**, part of the **control plane**
    * One or more **worker nodes**
  * Master Node Overview
    * Master node provides running environment for the **control plane** responsible for managing the state of a Kubernetes cluster, and it is the brain behind all operations inside the cluster. The control plane components are agents with very distinct roles in the cluster's management. In order to communicate with the Kubernetes cluster, users send requests to the control plane via a CLI tool, a Web UI dashboard, or  API.
    * To ensure the control plane's fault tolerance, master node replicas can be added to the cluster, configured in  High-Availability mode.
    * To persist the Kubernetes cluster's state, all cluster configuration data is saved to etcd. etcd is a distrubuted key-value store which only holds cluster state related data, no client workload data. etcd may be configured on the master node (stacked topology), or on its dedicated host (external topology) to help reduce the chances of data store loss by decoupling it from other control plane agents.
    * A master node runs the following contorl plane components:
      * API Server
      * Scheduler
      * Controller Managers
      * Data Store
    * In addition, the master node runs:
      * Container Runtime
      * Node Agent
      * Proxy
    * Master Node Components - API Server
      * All the administrative tasks are coordinated by the **kube-apiserver**, a central control plane component running on the master node.
      * During processing the API server reads the Kubernetes cluster's current state from the etcd data store, and after a call's execution, the resulting state of the Kubernetes cluster is saved.
      * The API Server is the only master plane component to talk to the etcd data store, both to read from and to save Kubernetes cluster state information.
      * API Server is highly configurable and customizable and can scale horizontally.
    * Master Node Components - Scheduler
      * The role of the **kube-scheduler** is to assign new workload objects, such as pods, to nodes.
      * The scheduler obtains resource usage data from the etcd data store, via the API Server. Once all  the cluster data is available, the scheduling algorithm filters the nodes with predicates to isolate the possible node candidates which then are scored with priorities in order to select the one node that satisfies all the requirements for hosting the new workload. The outcome of the decision process is communicated back to the API server, which then delegates the workload deployment with other control plane agents.
      * The scheduler is highly configurable and customizable through scheduling policies, plugins, and profiles.
    * Master Node Components - Controller Managers
      * The **controller managers** are control plane components on the master node running controllers to regulate the state of the Kubernetes cluster. Controllers are watch-loops continuously running and comparing the cluster's desired state (provided by object's configuration data) with its current state. In case of a mismatch, corrective action is taken in the cluster until its current state matches the desired state.
      * The **kube-controller-manager** runs controllers responsible to act when nodes become unavailable, to ensure pod counts are as expected, to create endpoints, service accounts, and API access tokens.
      * The **cloud-controller-manager** runs controllers responsible to interact with the underlying infrastructure of a cloud provider when nodes become unavailable, to manage storage volumes when provided by a cloud service, and to manage load balancing and routing.
    * Master Node Components - Data Store
      * **etcd** is a strongly consistent, distrubuted key-value **data store** used to persist a Kubernetes cluster's state. New data is written to the data store only by appending to it, data is never replaced in the data store. Obsolete data is compacted periodically to minimize the size of the data store.
      * etcd's CLI management tool - **etcdctl**, provides backup, snapshot, and restore capabilities which come in handy especially for a single etcd instance Kubernetes cluster - common in development and learning environments.
      * In Production environments, it is extremely important to replicate the data store in HA mode, for cluster configuration data resiliency.
      ![Stacked etcd Topology](./k8s/kubeadm-ha-topology-stacked-etcd.svg) Stacked etcd Topology
      * For data isolation from control plane components, the bootstrapping process can be configured for an external etcd topology, where the data store is provisioned on a dedicated separate host, thus reducing the chances of an etcd failure.
      ![External etcd Topology](./k8s/kubeadm-ha-topology-external-etcd.svg) External etcd Topology
      * Both stacked and external etcd configurations support HA configurations.
      * etcd is written in the Go programming language. Besides storing the cluster state, etcd is also used to store the configuration details such as subnest, Config Maps, Secrets, etc.
    * Master Node Components - Worker Node
      * A **worker node** provides running environment for client applciations, encapsulated in pods.
      * A pod is the smallest scheduling unit in Kubernetes. It is a logical collection of containers scheduled together, and the collection can be started, stopped, or rescheduled as a single unit of work.
      * A wokrer node has following components:
        * Container Runtime
        * Node Agent - kubelet
        * Proxy - kube-proxy
        * Addons for DNS, Dashboard UI, cluster-level monitoring and logging.
    * Worker Node Components - Container Runtime
      * Although Kubernetes is described as a "container orchestration engine", it does not have the capability to directly handle containers. In order to manage a container's lifecycle, Kubernetes requires a **container runtime** on the node. Kubernetes supports many container runtimes:
        * Docker
        * CRI-O
        * containerd
        * frakti
    * Worker Node Components - Node Agent - kubelet
      * The **kubelet** is an agent running on each node and communicates with the control plance components from the master node. It receives pod definitions, primarily from the API Server, and interacts with the container runtime on the node to run containers associated with the Pod.
      * The kubelet connects to container runtimes through a plugin based interface the Container Runtime Interface (CRI), which provides a clear abstraction layer between the kubelet and the container runtime.
      * Using `dockershim` (a CRI implementation), containers are created using Docker installed on the worker nodes. Internally, Docker uses `containerd` to create and manage containers.

### Kubernetes Commands
* `kubectl -n oid logs notification-service-green-567d56b8f5-8b2kf` - Get logs for the given pod from oid namespace
* `kubectl -n oid get pods` - Get pods list from oid namespace
* `kubectl -n oid get deployment` - Get deployments for given namespace
* `kubectl -n oid get service` - Get services for given namespace
* `kubectl -n oid port-forward service-gateway-green-769988bddf-mjcgn 9988:8080` - Use Port Forwarding to access applications in a cluster. Here the local 9988 port is setup to forward requests to `service-gateway-green-769988bddf-mjcgn` pod in cluster.

# Getting Started with Kubernetes Pluralsight Course
* Kubernetes came out of Google
* Donated to CNCF in 2014
* Think of Data Center as a giant OS which has an array and compute and storage resources at its disposal and application developers provide a container image to run and scale to it. Application developer does not have to worry about how to use these large compute and storage resources, similar to how they did not have to worry about the same when running a program on a single computer.
* K8s runs on linux and is an orchastrator for microservice apps that run on containers
* Masters
  * `kube-apiserver` front-end to the control plane
    * Exposes the REST APIs and consumes JSON
    * a.k.a master, brains of k8s
  * Cluster Store
    * Uses `etcd` (open source distributed key-value store i.e. noSQL database)
    * It's the source of truth for the cluster
  * `kube-controller-manager`
    * Controller of controllers
    * Watches for changes, helps maintain desired state
  * `kube-scheduler`
    * Watches apiserver for new pods
    * Assigns work to nodes
* Nodes
  * Kubelet
    * Main kubernetes agent on the node
    * Watches apiserver for work assignments
    * Instantiates pods
    * Reports back to master - If a pod fails on a node, the kubelet is not responsible for restarting it or finding another node to run it on. It simply reports the state back to the master
  * Container Engine
    * Responsible for working with containers, pulling images, starting/stopping containers
    * Mostly talks to container runtime and in case of Docker uses native Docker APIs
  * kube-proxy
    * Network brains of the node
    * Every pod has a unique IP, all containers in a pod share a single IP
    * load-balancing behind a service is managed by it
* Declarative Model and Desired State
  * Manifest file (YAML or JSON) that describes desired state
  * We never interact with kubernetes imperatively (we shouldn't), we give it declarative manifest file that describes how we want the cluster to look
* Pods
  * One or more containers packaged together and deployed as a single unit
  * Kubernetes runs containers, but always inside a pod
  * Pods can have multiple containers
  * At a highest level, a pod is just a ring-fenced environment to run containers
  * Unit of scaling in k8s is also pods, you add/remove pod replicas
  * Pods exist on a single node, you can't have a single pod spread over multiple nodes
  * Pods are mortal, once a pod dies, the replication controller starts a new pode
  * Every new pod gets a new IP
* Services
  * A higer level stable abstraction point for multiple pods, and provides load-balancing
  * A pod belongs to a serivce via labels i.e. service uses labels to decide over what pods to load-balance
* Deployments
  * First class REST objects, deployed via manifest files
  * Simple rolling updates and rollbacks made possible



## ReactNative Development
### Setup
* `pod install` command was failing, fixed it with below command
  * `gem install --user-install ffi -- --enable-libffi-alloc`



* If you get following error when building the project in XCode:
```
ld: warning: Could not find or use auto-linked library 'swiftCoreGraphics'
ld: warning: Could not find or use auto-linked library 'swiftUIKit'
ld: warning: Could not find or use auto-linked library 'swiftDarwin'
ld: warning: Could not find or use auto-linked library 'swiftFoundation'
ld: warning: Could not find or use auto-linked library 'swiftMetal'
ld: warning: Could not find or use auto-linked library 'swiftObjectiveC'
ld: warning: Could not find or use auto-linked library 'swiftCoreFoundation'
ld: warning: Could not find or use auto-linked library 'swiftDispatch'
ld: warning: Could not find or use auto-linked library 'swiftCoreImage'
ld: warning: Could not find or use auto-linked library 'swiftQuartzCore'
ld: warning: Could not find or use auto-linked library 'swiftCore'
ld: warning: Could not find or use auto-linked library 'swiftSwiftOnoneSupport'
Undefined symbols for architecture arm64:
```
  * then follow following steps:
    * Remove file - `rm Podfile.lock`
    * Remove Pods directory - `rm -rf Pods/`
    * Remove node_modules - `rm -rf node_modules/`
    * Commend the line `use_flipper!()`, using `#use_flipper!()`


# Profiling Java Applications
* USE - Utilization, Saturation, and Errors Matrix for measuring performance
* Run queue - A high run queue for a prolonged period of time is a sign of saturation
* Memory Swapping - When main memory is low on capacity, OS would move some memory pages to to a special location on the disk called swap space, this process is called swapping and is an indicator of memory capacity saturation and possible performance degradation.
* Latency - Is the amount of time required to complete a unit of work, typically reported in milliseconds or seconds.
* Elapsed Time - Measures the time taken for a batch of operations to complete
* Throughput - Is the amount of work that an application can accomplish per unit of time. The unit of time is typically seconds, such as requests per second, transactions per second, etc. Throughput and latency are related. Higher the latency of an application, the higher it's throughput is. To put it another way, if you can do things faster, you can do more of it. The effective throughput of an application is the subcomponent with the lowest throughput. The subcomponent with the lowest throughput presents a bottleneck that increases the latency of the entire system.

# HTTP Redirect Response Codes
* 302 == Found
* 303 == See Other
* Both are used for redirect response from server but there are some key differences.
* With 302, HTTP method (POST/PUT/etc) and the body are not altered when redirection to new `Location` is performed
* If you want the method to be changed to `GET` when redirecting to new `Location`, 303 is to be used
* 302 response code is a bit ambiguous and hence, 307 (Temporary Redirect) was introduced with HTTP 1.1, to make it clear to clients to not change the request method/body
* To summarize:
  * 302: temporary redirect. Only use for HTTP/1.0 clients
  * 303: temporary redirect, changes the method to GET
  * 307: temporary redirect, repeating the request identically
  * 308: permanent redirect, repeating the request identically


# VS Code Snippet for Custom Task
* Below command invokes a zsh script and passes the currently selected text as the argument to it.
```json
{
  // See https://go.microsoft.com/fwlink/?LinkId=733558
  // for the documentation about the tasks.json format
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Convert to Neptune configuration path",
      "type": "process",
      "command": "/Users/gjain17/convert-to-neptune-config.zsh",
      "args": [
        "${selectedText}"
      ],
      "presentation": {
        "reveal": "always",
        "panel": "shared"
      }
    },
  ]
}
```

## Colima docker for Mac
* Refer `https://github.com/abiosoft/colima` for installation instructions and starting Colima
* Link Colima socket to default socket (this may break other docker servers)
  * `sudo ln -s $HOME/.colima/docker.sock /var/run/docker.sock`
* Get the Colima profile name using
  * `colima list`
* Update docker context to use the "default" profile (match with the Colima profile output command above)
  * `docker context use default`
  * `docker context ls`

