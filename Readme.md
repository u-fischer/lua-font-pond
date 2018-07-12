# The lua-font-pond

A (hopefully soon growing) collection of examples for various tex-formats about how to use, correct, manipulate and extend fonts with luatex.

The focus lays on methods not covered by the standard user interfaces and on examples that explain the inner working of the fontloaders.
 

The examples are from various sources: questions on various lists and websites or documentations.

Contribuations are welcome.  



##  Structure

Currently the following folders for the various formats exists

- latex
- context
- plain: plaintex examples that load luaotfload.sty
- generic: for everything that doesn't fit in the folders above
- texmf: resources like fontloaders and patches to luaotfload.
- resources:  for code that is perhaps useful across formats but should not go in the texmf
- testfiles: these folders contain a few testfiles for the l3build system.

Every example is accompaigned by the resulting pdf. 

## Rules for contribuations

If you think that you have an interesting example or want to extend or correct some existing example you can sent me a mail or make a pull-request.

Themes for which I would like to get good examples are e.g.

- how to reencode fonts
- how to combine fonts so that kerning and ligatures works 
- how to add patches to fonts in latex in a similar way to goodies in context
- ...

### Examples should 

- be small and to the point
- use if possible free fonts 
- contain at the begin some comments to explain what the example is about
- contain a date and perhaps links to other sources
- file names should use only ASCII and give some indication what the example is about. I didn't try yet to setup some naming system.
- be compilable with a current TeX-system. As the time of writing this is TeXLive 2017 onwards.

### Format specific requirements

- LaTeX: `fontspec` is not required. `luaotfload` is already loaded by the format.
- plain: examples that should go in `plain` folder should contain `input luaotfload.sty`

## Fontloader

I  normally use rather new versions of the fontloader. See <https://ctan.org/pkg/fontloader-luaotfload>
for informations. It is possible that some examples don't work with older fontloaders.

 


