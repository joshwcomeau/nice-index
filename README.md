Atom Nice Index
================

An Atom package that automatically renames index.* files to their parent directory name.

```
about/index.html  -> /about
Home/index.jsx    -> /Home
server/index.js   -> /server
```

## NOTE: This project is seeking maintainers.
As the primary author, I no longer use Atom (switched to VS Code), and so it no longer makes sense for me to maintain this project. If anyone would like to inherit this project, please let me know!


### Why?

It's common practice, in web development, to give your directories semantically-relevant names, but to give the primary file the name of `index.js`, `index.html`, `index.css`, etc.

Web servers like apache will, by default, automatically try and serve index.html or index.php files when you request a directory. So, `http://www.google.com/` will attempt to serve `http://www.google.com/index.html`. This allows us to hide the file extension from the user, and provide nicer URLs.

In Node.js and ES2015 Javascript imports, this same convention was adopted. You can `require` or `import` a path like `/components/Home`, and it will attempt to find an `index.*` file within it.

The end result is that a lot of projects are packed with files like `index.js`, `index.html`, `index.css`, etc. Here's an example structure from a React app:

```
.
├── components
|   ├── Home
|   |   ├── index.jsx
|   |   └── index.css
|   ├── Header
|   |   ├── index.jsx
|   |   └── index.css
|   └── Footer
|   |   ├── index.jsx
|   |   └── index.css
├── server
|   └── index.js
└── index.html
```

In Atom, this means your files will look something like this:

![Sample pane files](/img/before.png "Before")

This is not good! All the filenames are the same. Atom tries to be helpful by showing the directory name after the filename, but when you have more than a couple of files open, that stuff all gets hidden.

### There must be a better way...

Wouldn't it be nicer if, for all `index.*` files, we just showed the parent directory? Something like:

![Better pane files](/img/after.png "After")

This way, we get the best of both worlds. We get semantically meaningful tab names in Atom while developing, and we can still reap all the benefits of using the index.* convention.


Acknowledgements
----------------

JP Richardson's [atom-rename-tabs](https://github.com/jprichardson/atom-rename-tabs) gave me the inspiration (and a starter template) for this codebase.



Install
-------

```
apm install nice-index
```

or go to `Settings` → `Install` → `Search` and search for `nice-index`.


Icons
--------
Because we're hiding the file extensions (index.jsx vs index.css, for example), you'll probably want to ensure you use an Atom UI theme that has custom icons. I recommend Seti UI.


Known Issues
-----

Because we're hijacking the tab-naming, there are a few small bugs I have not yet had the chance to fix. For example, when renaming a file, you'll need to close and reopen the file for it to display its new title.

Will happily accept PRs for this issue :)


License
-------
MIT
