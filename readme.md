# Psd Lint

### Dev

#### Setup
* brew install nginx
* open /usr/local/etc/nginx/nginx.conf
  * set your file contents to
  * ```
      events {
      }

      http {
        server {
          client_max_body_size 200M;

          location /process {
            proxy_pass "http://localhost:4567/";
            proxy_set_header Host $http_host;
          }

          location / {
            proxy_pass "http://localhost:1111";
            proxy_set_header Host $http_host;
          }
        }
      }
    ```
* ```npm install -g roots```
* ```bundle install```

#### Developing
* ```sudo nginx```
  * to stop ```sudo nginx -s stop```
* ```bundle exec ruby app.rb```
* ```roots watch```
* ```open http://localhost/```
* ### profit

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

