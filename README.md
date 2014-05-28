# dropzonejs-rails

Integrate [Matias Meno's Dropzone](http://www.dropzonejs.com/) awesome file upload JS library right into the Asset pipeline of your Rails apps.

## Version

The latest version of this gem bundles **Dropzone v3.10.2**.

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

1. Run `rake check` to see if there is a newer version of Dropzone available.
2. If **1.** tells you to do so, run `rake get` - it'll download the files four you.


## Licence (MIT)

(c) Copyright 2013 José Nahuel Cuesta Luengo

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
