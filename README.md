# OpenPonk: Simulation

[![Build Status](https://travis-ci.org/JanBliznicenko/openponk-simulation.svg?branch=master)](https://travis-ci.org/JanBliznicenko/openponk-simulation)

This repository adds simulations framework to the OpenPonk tool. 

When behavior is defined for a metamodel, model could be simulated in a random, user-picked or otherwise defined order.
Example of usage is https://github.com/JanBliznicenko/openponk-petrinets

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Installation for usage

Requires Pharo 6.1.

In Playground, run following code:
```
Metacello new
    baseline: 'OpenPonkSimulation';
    repository: 'github://JanBliznicenko/openponk-simulation/repository';
    load
```

## Installation for development

Requires Pharo 6.1.

1. Update Iceberg using script for Pharo 6.1 on https://github.com/pharo-vcs/iceberg
1. Clone the repository via Iceberg
1. Install default baseline BaselineOfOpenPonkSimulation
