## Short-term Goals
* Web Security Training - https://portswigger.net
* Udemy Advanced Scala course
* Learn emacs - Read GNU manual

### TO READ
* https://github.com/BartoszMilewski/Publications/blob/master/TheDaoOfFP/DaoFP.pdf
* Fibers - https://typelevel.org/blog/2021/02/21/fibers-fast-mkay.html
* http://www.scala-lang.org/docu/files/collections-api/collections.html
* http://docs.scala-lang.org/overviews/collections/concrete-immutable-collection-classes.html#vectors
* https://stackoverflow.com/questions/56850294/how-to-correctly-handle-individual-exceptions-in-future-sequence
* https://stackoverflow.com/questions/29344430/scala-waiting-for-sequence-of-futures/29344937#29344937
* https://twitter.github.io/scala_school/
* http://twitter.github.io/effectivescala/
* http://www.jpattonassociates.com/wp-content/uploads/2015/03/story_mapping.pdf
* Category Theory Crash course by Bartosz Milewski - https://www.youtube.com/watch?v=JH_Ou17_zyU
* https://www.manning.com/books/functional-programming-in-scala
* https://www.braveclojure.com
* https://github.com/AudaxHealthInc/backend-bootcamp
* [Shapeless](https://github.com/milessabin/shapeless/wiki/Feature-overview:-shapeless-2.0.0)



scala byName method

- a method defined using def minus parameters
   can it be defined without parenthesis - Yes
   can it be invoked without parenthesis? - Can be invoked only with parenthesis, give compile error minus parenthesis
- a method defined using val minus parameters
   can it be defined without parenthesis? - Yes, and that's the only way
   can it be invoked without parenthesis - Yes, and that's the only way
- a method defined using def with parameters
   can it be defined without parenthesis - No`
   can it be invoked without parenthesis? - No
- a method defined using val with parameters
   can it be defined without parenthesis? - No, vals can't take parameters

byName parameters
   - Is it a function value?
   - Give an example of how they're different from function value
   - What kind of scenarios to watch out for when using by name parameters?
byValue parameters (Not sure if this needs to be detailed out)
   - value is evaluated before function is invoked
   - what happens when a "function value is passed"


git show develop:accounts/app/com/rallyhealth/authn/services/delegate/SSOAttributeFormatHelper.scala > /Users/girish.jain/Documents/Rally/notes/rally/diff/a.scala | code --diff /Users/girish.jain/code/rally-play-authentication/accounts/app/com/rallyhealth/authn/services/delegate/SSOAttributeFormatHelper.scala

git dft develop..HEAD accounts/app/com/rallyhealth/authn/services/delegate/SSOAttributeFormatHelper.scala


Deleted merge conflict for 'web/app/com/rallyhealth/auth/token/rp/config/RPClientConfigFormats.scala':
  {local}: deleted
  {remote}: modified file
Use (m)odified or (d)eleted file, or (a)bort?

What's local here? The branch that I was working on? or the branch that I am merging/rebasing?

https://stackoverflow.com/questions/3051461/git-rebase-keeping-track-of-local-and-remote


#### Functor
A functor is a type with unit (think of apply method on case class) and map methods. It needs to follow certain laws:
1. Identitiy law - Calling map on a fuctor with identity function, returns functor back. This law makes sure that map only applies the function which is passed to it on the contained value and does not perform any other operation of it's own.
```scala
  def identity[A](x: A): A = x
  Functor[X].map(identity) == Functor[X]
```
2. Associative law - Let f and g be functions we want to apply on the value contained in functor. Then, calling map with f and then calling map with g is equivalent to calling map with g composed with f.
```scala
  Functor[X].map(f).map(g) == Functor[X].map(x => g(f(x))
```
This law allows us to chain multiple calls instead of composing multiple functions and then applying them in a single map operation.

#### Monad
A type with unit and flatMap is a Monad (flatMap serves two purposes, it can do the work of map as well as flatten a doubly-wrapped functor into a singly wrapped one).

A restaurant, how many waiters? (proportionate to the work load)

https://medium.com/beingprofessional/understanding-functor-and-monad-with-a-bag-of-peanuts-8fa702b3f69e

https://www.youtube.com/user/TheCatsters#p/u/68/xqLgGB7Hv7g

Why Monads? or What problems do Monads solve?
Monads solve the problem of writing functions that have side-effects in a pure functional language. For e.g. a function that reads line from terminal is a side-effecting function, or similarly printing line to console is a side-effecting function. Monads helps write these functions in pure funcitonal language.

(10 equals) 20
(equals 10) 20

equals is a curried function that will take its parameters one at a time
when calling (10 equals)

(halve 2) 4
  2/4
  4/2

  going by the "section" description, brackets would convert it into a prefix notation but it is nothing but prefix notation so that would resolve to
   (f p1) p2 => p2 f p1

  but in case of (p1 f) p2 => p1 f p2 because expression (p1 f) does not evaluate to


## Category Theory
* A category consists of **objects** and __arrows__ that go between them.
* The essence of a category is composition. Arrows compose, so if you have an arrow from object 𝐴 to object 𝐵, and another arrow from object 𝐵 to object 𝐶, then there must be an arrow — their composition — that goes from 𝐴 to 𝐶.
* Think of arrows, which are also called morphisms, as functions


https://www.youtube.com/watch?v=2wkEX6MCxJs&amp;t=4s


rm -rf .bloop/ && rm -rf .metals/ && rm -rf target/
find . -type d -name target -exec rm -rf {} \;


alias enable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=2g -XX:NewRatio=2 -XX:+UseParallelGC -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"'
alias disable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=2g -XX:NewRatio=2 -XX:+UseParallelGC"'

sbt "accounts/whatDependsOn com.fasterxml.jackson.core jackson-databind" | grep '\[info\]   +' > test.txt
cat ~/.ivy2/cache/com.fasterxml.jackson.datatype/jackson-datatype-jdk8/ivy-2.7.8.xml | grep 'jackson'

Example of using higher-kinded types in Scala to save boilerplate code around Option
https://www.47deg.com/blog/higher-kinded-data-in-scala/
https://medium.com/bigpanda-engineering/understanding-f-in-scala-4bec5996761f


Looked at the accounts-wiki PR and now I better understand the need for this deviceType configuration in Heimdall and how authn uses it. AuthN basically sets the IS cookie with Max-Age if the device type is mobile which makes it a non-session (permanent) cookie and these cookies can be shared between in-app browser and mobile browser.

* Playing with `EitherT` type in cats library
```scala
@ import cats.data.EitherT
import cats.data.EitherT

@ val fn: Future[String] = Future.successful("Hello")
fn: Future[String] = Future(Success(Hello))

@ val e1 = EitherT.right(fn)
e1: EitherT[Future, Nothing, String] = EitherT(Future(Success(Right(Hello))))

@ val e2 = Future.successful(new RuntimeException("failed!!"))
e2: Future[RuntimeException] = Future(Success(java.lang.RuntimeException: failed!!))

@ val e3 = Future.successful(throw new RuntimeException("failed!!"))
java.lang.RuntimeException: failed!!
  ammonite.$sess.cmd4$.<clinit>(cmd4.sc:1)


@ e3
cmd5.sc:1: not found: value e3
val res5 = e3
           ^
Compilation Failed

@ println(e3)
cmd5.sc:1: not found: value e3
val res5 = println(e3)
                   ^
Compilation Failed

@ val failingFuture: Future[String] = Future.successful(throw new RuntimeException("failed!!"))
java.lang.RuntimeException: failed!!
  ammonite.$sess.cmd5$.<clinit>(cmd5.sc:1)


@ val failingFuture: Future[String] = Future.successful(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery")
  )
cmd6.sc:1: type mismatch;
 found   : scala.concurrent.Future[String]
 required: PartialFunction[Throwable,scala.concurrent.Future[String]]
val failingFuture: Future[String] = Future.successful(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery")
                                                                                                                           ^
Compilation Failed

@ val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery"))
cmd6.sc:1: type mismatch;
 found   : scala.concurrent.Future[String]
 required: PartialFunction[Throwable,scala.concurrent.Future[String]]
val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery"))
                                                                                                                ^
Compilation Failed

@ val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery"))
cmd6.sc:1: type mismatch;
 found   : scala.concurrent.Future[String]
 required: PartialFunction[Throwable,scala.concurrent.Future[String]]
val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery"))
                                                                                                                ^
Compilation Failed

@ val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery"))
cmd6.sc:1: type mismatch;
 found   : scala.concurrent.Future[String]
 required: PartialFunction[Throwable,scala.concurrent.Future[String]]
val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith(Future.successful("Hello from recovery"))
                                                                                                                ^
Compilation Failed

@ val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith
  {
              case NonFatal(ex) =>
                Future.successful("Hello from recovery")
            }
cmd6.sc:1: polymorphic expression cannot be instantiated to expected type;
 found   : [U](pf: PartialFunction[Throwable,scala.concurrent.Future[U]])(implicit executor: scala.concurrent.ExecutionContext): scala.concurrent.Future[U]
 required: scala.concurrent.Future[String]
val failingFuture: Future[String] = Future(throw new RuntimeException("failed!!")).recoverWith
                                                                                   ^
cmd6.sc:2: missing parameter type for expanded function
The argument types of an anonymous function must be fully known. (SLS 8.5)
Expected type was: ?
val res6_1 = {
             ^
Compilation Failed

@ val failingFuture: Future[String] = Future[String](throw new RuntimeException("failed!!")).recoverWith
  {
              case NonFatal(ex) =>
                Future.successful("Hello from recovery")
            }
cmd6.sc:1: polymorphic expression cannot be instantiated to expected type;
 found   : [U >: String](pf: PartialFunction[Throwable,scala.concurrent.Future[U]])(implicit executor: scala.concurrent.ExecutionContext): scala.concurrent.Future[U]
 required: scala.concurrent.Future[String]
val failingFuture: Future[String] = Future[String](throw new RuntimeException("failed!!")).recoverWith
                                                                                           ^
cmd6.sc:2: missing parameter type for expanded function
The argument types of an anonymous function must be fully known. (SLS 8.5)
Expected type was: ?
val res6_1 = {
             ^
Compilation Failed

@ val failingFuture: Future[String] = Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
  {
              case NonFatal(ex) =>
                Future.successful("Hello from recovery")
            }
cmd6.sc:1: missing argument list for method recoverWith in trait Future
Unapplied methods are only converted to functions when a function type is expected.
You can make this conversion explicit by writing `recoverWith _` or `recoverWith(_)(_)` instead of `recoverWith`.
val failingFuture: Future[String] = Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
                                                                                                      ^
cmd6.sc:2: missing parameter type for expanded function
The argument types of an anonymous function must be fully known. (SLS 8.5)
Expected type was: ?
val res6_1 = {
             ^
Compilation Failed

@ val failingFuture: Future[String] = () => {Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
  {
              case NonFatal(ex) =>
                Future.successful("Hello from recovery")
            }}
cmd6.sc:3: not found: value NonFatal
            case NonFatal(ex) =>
                 ^
cmd6.sc:1: type mismatch;
 found   : () => scala.concurrent.Future[String]
 required: scala.concurrent.Future[String]
val failingFuture: Future[String] = () => {Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
                                       ^
Compilation Failed

@ impoort scala.util.control.NonFatal
(console):1:1 expected end-of-input
impoort scala.util.control.NonFatal
^

@ import scala.util.control.NonFatal
import scala.util.control.NonFatal

@ val failingFuture: Future[String] = () => {Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
  {
              case NonFatal(ex) =>
                Future.successful("Hello from recovery")
            }}
cmd7.sc:1: type mismatch;
 found   : () => scala.concurrent.Future[String]
 required: scala.concurrent.Future[String]
val failingFuture: Future[String] = () => {Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
                                       ^
Compilation Failed

@ val failingFuture = () => {Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
  {
              case NonFatal(ex) =>
                Future.successful("Hello from recovery")
            }}
failingFuture: () => Future[String] = ammonite.$sess.cmd7$$$Lambda$1798/1574798546@1dbeedff

@ EitherT.right(failingFuture)
res8: EitherT[Function0, Nothing, Future[String]] = EitherT(cats.instances.Function0Instances$$anon$4$$Lambda$1804/1015658596@3639b04)

@ val e11 = EitherT.right(failingFuture)
e11: EitherT[Function0, Nothing, Future[String]] = EitherT(cats.instances.Function0Instances$$anon$4$$Lambda$1804/1015658596@61288814)

@ e11.get
cmd10.sc:1: value get is not a member of cats.data.EitherT[Function0,Nothing,scala.concurrent.Future[String]]
val res10 = e11.get
                ^
Compilation Failed

@ e11.value
res10: () => Either[Nothing, Future[String]] = cats.instances.Function0Instances$$anon$4$$Lambda$1804/1015658596@61288814

@ e11.value()
res11: Either[Nothing, Future[String]] = Right(Future(Success(Hello from recovery)))

@ () => {Future[String](throw new RuntimeException("failed!!")).recoverWith[String]
    {
                case NonFatal(ex) =>
                  Future.successful("Hello from recovery")
              }}
res12: () => Future[String] = ammonite.$sess.cmd12$$$Lambda$1832/1534507153@4a013b23

@ val failingFutureMinusRecoverWith = () => Future[String](throw new RuntimeException("failed!!"))
failingFutureMinusRecoverWith: () => Future[String] = ammonite.$sess.cmd13$$$Lambda$1839/1329489396@240f712e

@ val e12 = EitherT.right(failingFutureMinusRecoverWith)
e12: EitherT[Function0, Nothing, Future[String]] = EitherT(cats.instances.Function0Instances$$anon$4$$Lambda$1804/1015658596@43c64d6f)

@ e12.value()
res15: Either[Nothing, Future[String]] = Right(Future(Failure(java.lang.RuntimeException: failed!!)))

@ val e13 = EitherT.right(failingFutureMinusRecoverWith())
e13: EitherT[Future, Nothing, String] = EitherT(Future(Failure(java.lang.RuntimeException: failed!!)))

```
def findScopesForElid(elid: String): List[String] = {
  scopesWithElid.foldLeft((false, new ListBuffer[String]))((accumulator, current) => {
    if (current.startsWith("elid:")) {
      (elid == current, accumulator._2)
    } else if (accumulator._1) {
      accumulator._2.append(current)
      (true, accumulator._2)
    } else (false, accumulator._2)
  })._2.toList
}


curl --verbose -x socks5h://127.0.0.1:3129
curl -x socks5h://127.0.0.1:3131 --location --request GET 'https://core-userlingo.cozy-tuna.rally-dev.plumbing/rest/v1/monitor'


./gradlew test --continuous --tests DefaultPlanSelectionStrategySpec
