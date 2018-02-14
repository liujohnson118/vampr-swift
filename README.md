## Vampr

You've been hired by vampires to build an app called _Vampr_. This app will be able to quickly determine a vampire's lineage relative to any other vampire. This app will need to be able to answer the following questions:

* Who is a vampire's creator?
* How many vampires has a vampire created?
* How many vampires away from the original vampire is a vampire?
* Who is the more senior vampire out of two vampires? (Who is closer to the original vampire)
* Who is the closest common ancestor of two vampires? 

_Vampr_ needs to store and organize all the vampires in a way that makes it easy to answer these questions. You may have noticed that there are aspects of our previous "Org Chart" exercise that we can use in the development of _Vampr_. 

The vampire's lineage is best represented by a tree structure:

![picture of vampire tree](https://i.imgur.com/23dIvHw.png)

This is the current tree we have of all the vampires. You will need to store this tree in code and create methods to implement all of the requirements.