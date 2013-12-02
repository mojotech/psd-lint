# Psd Lint

### Dev
* ```npm install -g roots```
* ```bundle install```
* ```bundle exec ruby app.rb```
* ```roots watch```


### Changing the worker server location
  * edit ```workerPath``` in ```assets/js/config.js```

### Tests in place
* Find all unnamed layers
* Find all font's used
* Find group to layer ratio
* Find all blending modes used
* Find all font sizes used
* Find all empty groups

### Adding Tests
* create a new test file
* walk through the PSD tree using ```LNT.propertyWalker```


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

