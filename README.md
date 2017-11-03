# OpenPonk: Simulation

![Travis build status](https://api.travis-ci.org/bliznjan/openponk-simulation.svg)

This repository adds simulations framework to the OpenPonk tool. 

When behavior is defined for a metamodel, model could be simulated in a random, user-picked or otherwise defined order.
Example of usage is https://github.com/bliznjan/openponk-petrinets

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Installation for usage

Requires Pharo 5 or greater.

In Playground, run following code:
```
Metacello new
    baseline: 'OpenPonkSimulationGUI';
    repository: 'github://bliznjan/openponk-simulation/repository';
    load
```

## Installation for development

Requires Pharo 6.1 - image 60158 or greater.

1. Enable Iceberg Metacello integration in Iceberg settings
1. Clone the repository via Iceberg
1. Install default baseline BaselineOfOpenPonkSimulationGUI
