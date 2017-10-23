# dropzonejs-rails

Integrate [Matias Meno's Dropzone](http://www.dropzonejs.com/) awesome file upload JS library right into the Asset pipeline of your Rails apps.

## Version

The latest version of this gem bundles **Dropzone v5.2.0**.

### Dropzone 4.x

If you depend on Dropzone's 4.x branch, you need to specify `gem 'dropzonejs-rails', '~> 0.7.4'` in your Gemfile, otherwise you'll get 5.x.

### Dropzone 3.x

If you depend on Dropzone's 3.x branch, you need to specify `gem 'dropzonejs-rails', '~> 0.5.3'` in your Gemfile, otherwise you'll get 4.x.

## Installation and usage

First add `dropzonejs-rails` to your Gemfile and, as you already know, `bundle` it and then restart your Rails app:

```ruby
# On your Gemfile
gem 'dropzonejs-rails'
```

```bash
$ bundle install
```

After that, you need to make `dropzone.js` available on your pages. To do that, you can add it to your `application.js` file, like this:

```javascript
//= require dropzone
```

And if you would like to use one of the styles bundled with Dropzone, add to your `application.css`:
```scss
*= require dropzone/basic
```
or
```scss
*= require dropzone/dropzone
```

And **Bam!** - you're all set.


## Issues, Requests, Comments, Poetry

Go to [this secret place](https://github.com/ncuesta/dropzonejs-rails/issues).


## Contributing

1. Fork,
2. Hack,
3. Create a Pull Request.

**DO NOT - I repeat - DO NOT bump version numbers.** Unless you **really** need to.


### Getting the latest version of Dropzone

1. Run `rake dropzone:check` to see if there is a newer version of Dropzone available.
2. If **1.** tells you that a new version is available, you can run `rake dropzone:replace` - it'll download the files for you.
3. If **1.** tells you that a new version is available, you can run `rake dropzone:bump` - it'll download the files, commit and release them for you.

## Changelog

* v0.8.1
  * Updates Dropzone to 5.1.1 **#44 by [@lerarybak](https://github.com/lerarybak).**
* v0.8.0
  * Updates Dropzone to the 5.1 branch. **#43 by [@lerarybak](https://github.com/lerarybak).**
* v0.7.4
  * Refactors rake tasks for better separation of concerns and a cleaner use. **#41 By [@thomasstephane](https://github.com/thomasstephane).**
* v0.7.0
  * Updates Dropzone to the 4.x branch
* v0.5.1
  * Moves assets to the `app/` directory so that Rails 4 adds them to the Sprockets
    pipeline. Kudos to @senny for pointing this out.
  * Fixes incorrect references to the old vendor/ directory.

## Licence (MIT)

(c) Copyright 2013-2017 José Nahuel Cuesta Luengo

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
