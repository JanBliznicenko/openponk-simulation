# OpenPonk: Simulation

This is an unofficial extension of [OpenPonk tool](https://openponk.org) that adds base for implementing simulations. 

When behavior is defined for a metamodel, model could be simulated in a random, user-picked or otherwise defined order.
Example of usage is https://github.com/JanBliznicenko/openponk-petrinets

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Installation for usage

Requires Pharo 12.

In Playground, run following code:
```
Metacello new
    baseline: 'OpenPonkSimulation';
    repository: 'github://JanBliznicenko/openponk-simulation';
    load
```

## Installation for development

Requires Pharo 12.

1. Clone the repository via Git Repositories Browser (Iceberg)
1. Install default baseline BaselineOfOpenPonkSimulation
