# Psd Lint

Keeping your PSDs clean since 1663.

### Dev

You need both [ruby](https://github.com/sstephenson/rbenv) (with [bundler](http://bundler.io/)) and [node](http://nodejs.org/) to be installed in order to work on this locally.

#### Setup

* `brew install nginx`
* `cp config/nginx.conf /usr/local/etc/nginx/nginx.conf`
* `npm install roots -g`
* `cd app && bundle`
* `cd web && npm i`

#### Developing

* `sudo nginx`
  * to stop `sudo nginx -s stop`
* `bundle exec ruby app/app.rb`
* `cd web && npm run dev`
* `open http://localhost`
* ???
* get money

### Testing

#### Tests in place

* Find all unnamed layers
* Find all font's used
* Find group to layer ratio
* Find all blending modes used
* Find all font sizes used
* Find all empty groups

#### Adding Tests

* create a new test file
* walk through the PSD tree using `LNT.propertyWalker`


```js
   return _(PSD.children).map(function(v) {
      return LNT.propertyWalker(v, 'blending_mode');
    }).flatten().uniq().valueOf();
```

* you can also conditionally extract values

```js
  return _(PSD.children).map(function(v) {
    return LNT.propertyWalker(v, function(node, p) {
      if (node.text) {
        p.push(node.text.font.name);
      }
    });
  }).flatten().uniq().valueOf();
```

