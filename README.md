Atom Nice Index
================

It is the convention in a lot of javascript applications to use the following directory structure:

```
.
├── actions
|   └── index.js
├── components
|   └── Home
|       ├── Home.production.jsx
|       ├── Home.development.jsx
|       └── index.jsx
├── constants
|   └── index.js
├── server
|   └── index.js
├── store
|   ├── createStore.production.js
|   ├── createStore.development.js
|   └── index.js
└── index.html
```

In Atom, this means your files will look something like this:

![Sample pane files](http://i.imgur.com/GDexok8.jpg)

This is not good! All the filenames are the same. Atom tries to be helpful by showing the directory name after the filename, but with a reasonable amount of files open, it's completely obfuscated and untenable.

### There must be a better way...

What if for all `index.*` files, we always just showed the parent directory? Something like:

![Better pane files](http://i.imgur.com/gM88FOR.png)

We prefix the file name with `/` so we know it's the directory's name, and we show the much-more-relevant name.

This way, we get the best of both worlds. We can use this lovely pattern...

```js
// Good
import Home from './components/Home'

// Less good
import Home from './components/Home/home.jsx'
```

...AND we get very clear filenames when developing :)


Acknowledgements
----------------

JP Richardson's [atom-rename-tabs](https://github.com/jprichardson/atom-rename-tabs) gave me the inspiration (and a starter template) for this codebase.



Install
-------

```
apm install nice-index
```

or go to `Settings` → `Install` → `Search` and search for `nice-index`.


Usage
-----

It Just Works™


License
-------
MIT
