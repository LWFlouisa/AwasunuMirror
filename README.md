# AwasunuMirror
This is just a temporary mirror while real work happens on my own instance.

## Instructions coming soon.
To create a new tree:

~~~
./new_tree "sample_tree" :cats "encrireln Cats are the cleanest pets" :dogs "encrireln Dogs are mans best friend" :gerbils "encrireln Gerbils dont use hamster wheels"
~~~

## Operating Tree
This gives you an automated tree branch that chooses an Awasunu path:

~~~sample_tree
./auto_parser_generic 7 'awa' 150 :cats 'encrireln Cats are the cleanest pets' :dogs 'encrireln Dogs are mans best friend' :gerbils 'encrireln Gerbils dont use hamster wheels'
~~~

~~~
[ ':dogs', 'encrireln Dogs are mans best friend', Cosmic Distance:  0.0035118781332616465 out of 150 tiles ], Human Scale:  0.3511878133261646 out of 150 tiles ]
[ ':cats', 'encrireln Cats are the cleanest pets', Cosmic Distance:  0.27088246593206355 out of 150 tiles ], Human Scale:  27.08824659320635 out of 150 tiles ]
[ ':dogs', 'encrireln Dogs are mans best friend', Cosmic Distance:  0.48986262980414913 out of 150 tiles ], Human Scale:  48.986262980414914 out of 150 tiles ]
[ ':cats', 'encrireln Cats are the cleanest pets', Cosmic Distance:  0.010268387253695417 out of 150 tiles ], Human Scale:  1.026838725369542 out of 150 tiles ]
[ ':cats', 'encrireln Cats are the cleanest pets', Cosmic Distance:  0.00889776530896012 out of 150 tiles ], Human Scale:  0.8897765308960119 out of 150 tiles ]
[ ':cats', 'encrireln Cats are the cleanest pets', Cosmic Distance:  0.058326663452531805 out of 150 tiles ], Human Scale:  5.83266634525318 out of 150 tiles ]
[ ':gerbils', 'encrireln Gerbils dont use hamster wheels', Cosmic Distance:  0.40760748194332935 out of 150 tiles ], Human Scale:  40.76074819433294 out of 150 tiles ]
~~~

Now parse the last script:

~~~
./awasunu gerbils.awa
~~~

## Result
A random fact about Gerbils:

~~~
Gerbils dont use hamster wheels
~~~

## Mode Of Operation
This is designed to append to the output file for any given label.
