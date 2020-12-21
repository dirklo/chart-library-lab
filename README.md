# Chart Library Lab
-Rick Moore

## Objectives

1. Create the class files for a music chart library

## Song Class:

The Song class will be the primary hub for the remaining classes.  

When initialized, a song object will take in a title string as an argument, set it to it's `@title` instance variable and create `@genres` and `@arrangements` variables, both set to empty strings.

the `#artist=` setter method will be able to take in either an artist object or a string, and either set `@artist` to the passed object, an object found using the string to search for it, or create a new artist object and set it to the `@artist` variable.  

the `#add_genre` method will have similar functionality, taking in either a genre object, or a string, and either creating a new genre object, or searching for and returning an existing one, and adding it to the `@genres` array

the `#create_arrangement` method will take in no arguments, but create an arrangement object that can be used to attach many arrangements to a single song.  Creating an arrangment here will automatically assign that arrangement to this songs arrangement list, and assign this song as the `@song` variable on that arrangment.

The song class will also have a @@all class variable initialized to an empty string, and all new song objects will be added upon initialization, and accessable through a `.all` class method

## Artist Class:

Upon initialization, artists objects will take in a name string as an argument, and set it as it's own `@name` variable.  They will also initialize a `@songs` instance variable, set to an empty array, to keep track of that artist's song list.

The `#song_titles` method will return an array of this artists song titles

the `#add_song` method will take in a title string, and create a new song object, and assigning this artist as the `@artist` variable in the new song object.  *Note* adding the artist to the new song object should automatically add that song to this artist's song list, so no need to be redundant.

The class method `.select_or_create_by_name` will be used to take in a string, and either return an existing artist with that name (using the @@all list), or create and return a new artist object with that name.  This method will be used by the song class when adding artists.

This class will also have an accessible `@@all` variable to keep track of all the artists objects.

## Arranger Class:

The arranger is the author of a particular arrangement.  Arrangers will have many arrangements, but an arrangement doesn't necessarily need an arranger (the arranger may be unknown).  

Arranger objects will have an `@arrangements` variable, initialized to an empty array to keep track of all the arranger's arrangements.  

The `#add_arrangement` method should raise an `AssociationTypeMismatchError` error if anything but an arrangement object is passed.  If the arrangement object is not already present in the `@arrangements` array, it should add it. 

This class will also have a `.select_or_create_by_name` method that will be used when assigning an arranger to an arrangement.

The class will have a `@@all` class variable to keep a list of all arranger objects.

## Arrangement Class: 

An arrangement is a collection of charts, one for each instrument in a group.  Arrangements will have many charts, and belong to a song.  An arrangement may also belong to an arranger.

Arrangements must belong to a song, so they will always be inilialized by the `#create_arrangement` method in the song class.

Arrangement methods will have a `@charts` variable to hold it's chart list.

The `#add_chart` method will take in a filepath string and an instrument string, and create a new chart, adding it to this arrangement's chart list.

## Genre Class: 

Genres organize songs into styles.  Genres will have many songs, but songs do not necessarily need any genres.  

Genre objects will take in a name string and be initialized with a `@name` variable, and a `@songs` variable, set to an empty string for the genre's song list.

the genre class will have a `.select_or_create_by_name` method so the song class can add genre tags with just a name string.  This method will take in a name string, and return an existing genre object, or create and return a new genre object based on that name.

## Chart Class:

Charts are single files that have an instrument and belong to an arrangement.  They are initialized with a `@file` variable for the filepath, and an `@inst` variable for the instrument string.

Charts will have an `#arrangement=` method to set the arrangement it belongs to.  This should not allow for duplicated in the arrangement's chart list.


