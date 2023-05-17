<<<<<<< HEAD
# Quickstarts

## Introduction

The repository contains a set of quickstart projects which provide working example
for specific Narayana transaction manager capabilities.
The quickstarts can be used as a reference for your own project.

The list of all available quickstart can be found down at this page.
Each quickstart is categorized with tags that depict areas the quickstart is connected with.

* [List of quickstarts](#list-of-quickstarts)
* [Quickstarts by tag](#quickstarts-by-tag)
* [Contacting us](#contacting-us)
* [Quickstarts in CI environment](#quickstarts-in-ci-environment)
* [Running a single quickstart](#running-a-single-quickstart)
* [Running all quickstarts in a single command](#running-all-quickstarts-in-a-single-command)


---
**NOTE**

WildFly quickstarts contain some more examples how to work with transactions
in the Java EE environment. See repository: [wildfly/quickstart](https://github.com/wildfly/quickstart).
The quickstarts particularly connected to transaction managements are:
[jta-crash-rec](https://github.com/wildfly/quickstart/tree/main/jta-crash-rec),
[jts](https://github.com/wildfly/quickstart/tree/main/jts).

---

## List of quickstarts

Project name | Description | Maven coordinates | Tags
------------ | ----------- | ----------------- | ----
[ArjunaCore/txoj](ArjunaCore/txoj/) | Showing how to use the Transactional Object for Java (_TXOJ_) which is the core implementation concept of the Narayana state machine | _o.j.n.quickstart.arjunacore :txoj_ | _[arjuna.core](#arjuna-core-tag), [standalone](#standalone-tag)_
[ArjunaJTA/maven](ArjunaJTA/maven) | Minimalistic maven project showing how to configure maven to use the Narayana JTA implementation | _o.j.n.quickstart.jta :maven_ | _[jta](#jta-tag), [standalone](#standalone-tag)_
[ArjunaJTA/jakarta_transaction](ArjunaJTA/jakarta_transaction/) | basics on using JTA API in your application, you can check how to obtain the `UserTransaction` and `TransactionManager` with use of the Narayana API | _o.j.n.quickstart.jta :jakarta_transaction_ | _[jta](#jta-tag), [standalone](#standalone-tag)_
[ArjunaJTA/jakartaee_transactional_app](ArjunaJTA/jakartaee_transactional_app/) | WildFly application which shows use of the transaction management in EJB when invoked from CDI bean | _o.j.n.quickstart.jta: jakartaee_transactional_app_ | _[jta](#jta-tag), [wildfly](#wildfly-tag)_
[ArjunaJTA/object_store](ArjunaJTA/object_store/) | How to configure Narayana to run different types of object stores in standalone mode | _org.jboss.narayana.quickstart.jta: object_store_ | _[jta](#jta-tag), [narayana.configuration](#narayana-configuration-tag), [standalone](#standalone-tag)_
[ArjunaJTA/recovery](ArjunaJTA/recovery/) | Example of running periodic recovery in Narayana standalone. The setup shows multiple implementation of the recovery storage for could be configured by user. | _o.j.n.quickstart.jta: recovery_ | _[jta](#jta-tag), [narayana.configuration](#narayana-configuration-tag), [standalone](#standalone-tag)_
[ArjunaJTS/interop](ArjunaJTS/interop/) | Transactional EJB calls between GlassFish and WildFly | _o.j.n.quickstart.jts :jts-interop-quickstart_ | _[jts](#jts-tag),[wildfly](#wildfly-tag),[glassfish](#glassfish-tag)_
[ArjunaJTS/jts](ArjunaJTS/jts/) | Demonstration of setting up JTS transactions in WildFly and how to use EJB2 beans to pass the transactional context over the remote IIOP call | _o.j.n.quickstart.jts :jboss-as-jts-parent_ | _[jts](#jts-tag),[wildfly](#wildfly-tag)_
[ArjunaJTS/recovery](ArjunaJTS/recovery/) | Setting up the Narayana recovery manager for JTS in standalone mode | _o.j.n.quickstart.jts :jts-recovery_ | _[jts](#jts-tag), [narayana.configuration](#narayana-configuration-tag), [standalone](#standalone-tag)_
[ArjunaJTS/standalone](ArjunaJTS/standalone/) | Example of using Narayana JTS and in second part the example of using ORB API to manage remote JTS transaction manager with IIOP calls | _o.j.n.quickstart.jts :jts-standalone_ | _[jts](#jts-tag), [iiop](#iiop-tag), [standalone](#standalone-tag)_
[atsintegration](atsintegration/) | How to integrate Narayana with and arbitrary Java EE application server | _o.j.n.quickstart.jta :application-server-integration_ | _[narayana.configuration](#narayana-configuration-tag)_
[agroal](agroal/) | How to integrate Narayana with Agroal jdbc pooling library | _o.j.n.quickstart.jta :agroal_ | _[jta](#jta-tag), [standalone](#standalone-tag), [jdbc](#jdbc-tag)_
[jta-1_2-standalone](jta-1_2-standalone/) | How to integrate Narayana with Weld | _o.j.n.quickstart.jta :jta-1_2-standalone_ | [standalone](#standalone-tag), [cdi](#cdi-tag)
[jta-1_2-in-wildfly](jta-1_2-in-wildfly/) | How to use transactions with CDI in WildFly | _o.j.n.quickstart.jta :jta-1_2-in-wildfly_ | [standalone](#standalone-tag), [cdi](#cdi-tag)
[jta-and-hibernate-standalone](jta-and-hibernate-standalone/) | Using Narayana to manage transactions when JPA and CDI is used | _o.j.n.quickstart.jta :jta-and-hibernate-standalone_ | [standalone](#standalone-tag), [cdi](#cdi-tag)

## Quickstart categorization

Category | List of quickstarts
-------- | -------------------
**[arjuna.core](#arjuna-core-tag-definition)**<a name='arjuna-core-tag'> | [ArjunaCore/txoj](ArjunaCore/txoj/)
**[narayana.configuration](#narayana-configuration-tag-definition)**<a name='narayana-configuration-tag'> | [ArjunaJTA/object_store](ArjunaJTA/object_store/), [ArjunaJTA/recovery](ArjunaJTA/recovery/), [ArjunaJTS/recovery](ArjunaJTS/recovery/), [atsintegration](atsintegration/)
**[jta](#jta-tag-definition)**<a name='jta-tag'> | [ArjunaJTA/maven](ArjunaJTA/maven/), [ArjunaJTA/jakarta_transaction](ArjunaJTA/jakarta_transaction/), [ArjunaJTA/jakartaee_transactional_app](ArjunaJTA/jakartaee_transactional_app/), [ArjunaJTA/object_store](ArjunaJTA/object_store/), [ArjunaJTA/recovery](ArjunaJTA/recovery/), [agroal](agroal/)
**[jts](#jts-tag-definition)**<a name='jts-tag'> | [ArjunaJTS/interop](ArjunaJTS/interop/), [ArjunaJTS/jts](ArjunaJTS/jts/), [ArjunaJTS/recovery](ArjunaJTS/recovery/), [ArjunaJTS/standalone](ArjunaJTS/standalone/)
**[standalone](#standalone-tag-definition)**<a name='standalone-tag'> | [ArjunaCore/txoj](ArjunaCore/txoj/), [ArjunaJTA/maven](ArjunaJTA/maven/), [ArjunaJTA/jakarta_transaction](ArjunaJTA/jakarta_transaction/), [ArjunaJTA/object_store](ArjunaJTA/object_store/), [ArjunaJTA/recovery](ArjunaJTA/recovery/), [ArjunaJTS/recovery](ArjunaJTS/recovery/), [ArjunaJTS/standalone](ArjunaJTS/standalone/), [agroal](agroal/), [jta-1_2-standalone](jta-1_2-standalone/), [jta-and-hibernate-standalone](jta-and-hibernate-standalone/)
**[wildfly](#wildfly-tag-definition)**<a name='wildfly-tag'> | [ArjunaJTA/jakartaee_transactional_app](ArjunaJTA/jakartaee_transactional_app/),[ArjunaJTS/interop](ArjunaJTS/interop/), [ArjunaJTS/jts](ArjunaJTS/jts/), [jta-1_2-in-wildfly](jta-1_2-in-wildfly/)
**[glassfish](#glassfish-tag-definition)**<a name='glassfish-tag'> | [ArjunaJTS/interop](ArjunaJTS/interop/)
**[iiop](#iiop-tag-definition)**<a name='iiop-tag'> | [ArjunaJTS/standalone](ArjunaJTS/standalone/)
**[jdbc](#jdbc-tag-definition)**<a name='jdbc-tag'> | [agroal](agroal/)
**[cdi](#cdi-tag-definition)**<a name='cdi-tag'> | [jta-1_2-standalone](jta-1_2-standalone/), [jta-1_2-in-wildfly](jta-1_2-in-wildfly/), [jta-and-hibernate-standalone](jta-and-hibernate-standalone/)

### Tags definition

* **arjuna.core**<a name='arjuna-core-tag-definition'> : demonstrating capabilities of Narayana API,
  it's helpful for developers want to write a transaction state machine
  and don't want to start on a green field but rather used battle tested library
* **narayana.configuration**<a name='narayana-configuration-tag-definition'> : depicting aspects
  of Narayana configuration and showing options of such configurations
* **jta**<a name='jta-tag-definition'> : using JTA API to demonstrate transaction processing
* **jts**<a name='jts-tag-definition'> : using JTS API to demonstrate how the Narayana transaction system
  could be run and configured to run distributed JTS transactions
* **standalone**<a name='standalone-tag-definition'> : running as standalone Java SE application
* **wildfly**<a name='wildfly-tag-definition'> : running as deployment on WildFly application server
* **glassfish**<a name='glassfish-tag-definition'> : running on GlassFish application server
* **iiop**<a name='iiop-tag-definition'> : showing how to use ORB API with transaction manager
* **jdbc**<a name='jdbc-tag-definition'> : using JDBC api and showing integration with that
* **cdi**<a name='cdi-tag-definition'> : showing how to use the CDI to be integrated with JTA


## Contacting us

We are always happy to talk transactions and how-to use Narayana in exotic and not so exotic environments.
If you have ideas for what we can add to the quickstarts to make them more useful please do reach out to us at:
http://narayana.io/community

## Quickstarts in CI environment

If you want to see how we run the quickstarts in our continuous integration environment, take a look at [scripts/hudson/quickstart.sh](scripts/hudson/quickstart.sh).

## Running a single quickstart

Change directory into the required quickstart and follow the instructions in the [README.md](README.md) file.

## Running all quickstarts in a single command

To run the quickstarts:

1. set `WORKSPACE` (to the root directory where the quickstart repository was cloned)
2. set `JBOSSAS_IP_ADDR` (default is `localhost`)
3. set `JBOSS_HOME` (to the path of WildFly server, you can download the server at http://wildfly.org/downloads)
4. `mvn clean install`

_NOTE:_
As the scope of Narayana quickstart is broad - it shows integration with many platform
&ndash; you need to expect a big amount of data to be downloaded from Maven repository.

_NOTE:_
If you want to prepare the quickstarts by installing them without running any test
then run the `mvn clean install -DskipTests`

_NOTE:_
If you want to run the quickstart with specific Narayana version you can use
command line option `-Dversion.narayana=...`
=======
[![Narayana](https://design.jboss.org/narayana/logo/final/narayana_logo_600px.png)](https://narayana.io/)

[![Version](https://img.shields.io/maven-central/v/org.jboss.narayana/narayana-all?logo=apache-maven&style=for-the-badge)](https://search.maven.org/artifact/org.jboss.narayana/narayana-all)
[![License](https://img.shields.io/badge/License-LGPL%20v2.1-green.svg?style=for-the-badge)](http://www.gnu.org/licenses/lgpl-2.1)

Narayana
========

Website: https://narayana.io

Twitter: https://twitter.com/narayana_io, using twitter handle [#narayanaio](https://twitter.com/search?q=%23narayanaio)

Getting help
------------
If you need help with using Narayana, please visit our forums at:
https://groups.google.com/g/narayana-users
or ask a question on our zulip channel (https://narayana.zulipchat.com/#).

If you would like to contribute a pull request to help the project out the file [CONTRIBUTING.md](https://github.com/jbosstm/narayana/blob/main/CONTRIBUTING.md) contains some guidance on how to do so.

If you have a performance optimization that you would like to suggest to us, please read our document over here:
https://developer.jboss.org/wiki/PerformanceGatesForAcceptingPerformanceFixesInNarayana

Requirements
------------
To build this project you will need a JDK (Java Development Kit) with a minimum version of 11.

The commands to do this will vary depending upon which operating system you are building on.

Building Naryana
----------------
To build Narayana you should call:

	./build.[sh|bat] <maven_goals, default is install>
	
To build Narayana without running tests you can call:

	./build.[sh|bat] -DskipTests


If you are building the "community" profile and are using a different maven installation to the one provided by maven wrapper `./mvn` you need to make sure you have the following options:

	-Dorson.jar.location=/full/path/to/checkout/location/ext/
	
The distribution is then available in:

	./narayana-full/target/narayana-full-<VERSION>-bin.zip
	
The uber jar for the JDK ORB is available here:

	./ArjunaJTS/narayana-jts-idlj/target/narayana-jts-idlj-<VERSION>.jar

The user jar for local JTA is here:

	./ArjunaJTA/narayana-jta/target/narayana-jta-<VERSION>.jar

If you just need the facilities provided by ArjunaCore:

	./ArjunaCore/arjunacore/target/arjunacore-<VERSION>.jar
	
Building specific components
----------------------------

If you would like to build an individual module (say arjuna) with its dependencies you would type:

	./build.[sh|bat] [clean] install -pl :arjuna -am
	
Other interesting specific components can be built using:

ArjunaCore: `./build.[sh|bat] -am -pl :arjunacore`

NarayanaJTA: `./build.[sh|bat] -am -pl :narayana-jta`

NarayanaJTS (idlj): `./build.[sh|bat] -am -pl :narayana-jts-idlj`

XTS: `./build.[sh|bat] -am -pl :jboss-xts`

STM: `./build.[sh|bat] -am -pl :stm`

LRA: `./build.[sh|bat] -am -f rts/lra`

Narayana (BOM) Bill Of Materials
-----------------------
maven BOM dependency used to encapsulate all the dependencies required by Narayana.

    <dependencyManagement>
     <dependencies>
       <dependency>
         <groupId>org.jboss.narayana</groupId>
         <artifactId>narayana-bom</artifactId>
         <version>6.0.1.Final-SNAPSHOT</version>
         <type>pom</type>
         <scope>import</scope>
       </dependency>
     </dependencies>
   </dependencyManagement>

Testing Narayana
---------------

There are three types of tests in the Narayana repository.

* Unit tests which are run with maven surefire and they do not need any special setup.
  Unit tests are run automatically when Narayana is build and if it's not specified otherwise (e.g. with maven flag `-DskipTests`)
* Integration tests are run with maven surefire or maven failsafe. They are run with use of the Arquillian
  and you need to explicitly enable them by activating profile `arq` (maven flag `-Parq`).
  There is a difficulty that each module have different requirements for the integration tests to be run.
  Most of them requires environmental variable `JBOSS_HOME` to be defined and points to an existing
  directory of [WildFly](https://wildfly.org/downloads/). But some of them requires additional steps
  for WildFly being configured. The best way to find out details is to check the [narayana.sh script](scripts/hudson/narayana.sh)
  which is used to run CI tests.
* Integration qa suite resides in the directory `qa/` and contains form of integration tests.
  These are built but not run automatically. See [qa/README.txt](qa/README.txt) for usage. In brevity launching tests
  is about running commands:

      cd qa/
      ant -f run-tests.xml ci-tests


Code Coverage Testing
---------------------

      ./build.[sh|bat] -PcodeCoverage (the output is in ${project.build.directory}/coverage.html)

Checkstyle
----------

Narayana expect usage of the style of code defined by WildFly checkstyle (maven artifact 
[org.wildfly.checkstyle:wildfly-checkstyle-config](https://github.com/wildfly/wildfly-checkstyle-config)).

Because of historical reasons the checkstyle is applied only at newly developed Narayana modules.
The old ones are left without strict code style rules. There is only a recommendation to follow
code style used in the particular file you edit.

Checkstyle checking is bound to maven install phase and if the file does not comply with the defined rules
the compilation fails.

To get your developer life easier use the checkstyle plugins for your IDE

* clone the repo with the
  [checkstyle.xml](https://github.com/wildfly/wildfly-checkstyle-config/blob/master/src/main/resources/wildfly-checkstyle/checkstyle.xml)
  file https://github.com/wildfly/wildfly-checkstyle-config
* install checkstyle plugin to your favourite IDE
    - IntelliJ IDEA: https://plugins.jetbrains.com/plugin/1065-checkstyle-idea
    - Eclipse: https://checkstyle.org/eclipse-cs/#!/
* configure plugin to consume the *checkstyle.xml* and being applied to the particular module

The WildFly provides a formatter complying with the checkstyle rules. If interested check the IDE configs
at project [wildfly-core](https://github.com/wildfly/wildfly-core/tree/main/ide-configs).

Now The Gory Details.
---------------------
Each module contains a set of maven build scripts, which chiefly just inherits and selectively overrides the parent
 pom.xml  Understanding this approach requires some knowledge of maven's inheritance.

Top level maven builds always start from scratch. Individual module builds on the other hand are incremental,
such that you may rebuild a single module by traversing into its directory and running 'mvn', but only if you
have first built any pre-req modules e.g. via a parent build.

In addition to driving the build of individual modules, the build files in the bundles directories (ArjunaCore,
ArjunaJTA, ArjunaJTS) contain steps to assemble the release directory structure, including docs, scripts,
config files and other ancillaries. These call each other in some cases, as JTS is largely a superset of
JTA and JTA in turn a superset of Core.

3rd party dependency management is done via maven. Note that versions of most 3rd party components are resolved via the WildFly component-matrix
pom.xml, even when building standalone releases. The version of WildFly to use is determined by the top level pom.xml

Maven is provided via [maven wrapper](https://github.com/takari/maven-wrapper) with command `./mvnw`.
>>>>>>> a73b1183e1c8093a64d060c8471ab7d63d8e0a82
