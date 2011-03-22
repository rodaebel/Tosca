=====
Tosca
=====

The Tosca project aims at providing a generic Open Sound Control server and
dispatcher built on top of the Erlang/OTP platform.


Copyright and License
---------------------

Copyright 2011 Tobias Rodaebel

This software is released under the Apache License, Version 2.0. You may obtain
a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

The OSC library module is originally taken from Ruslan Babayev's erlang-osc
implementation.


Requirements
------------

Tosca requires Erlang/OTP R14A or higher.


Building and Running
--------------------

In order to build and run the server, enter the following commands::

  $ make
  $ bin/toscad

Optionally, a configuration file can be specified::

  $ bin/toscad --config=tosca.config


Running Unit Tests
------------------

The Tosca project contains a number of unit tests. Run all unit tests by typing
the following command::

  $ make test
