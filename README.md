# native-ui

## Painpoints

These are all points I should adress after initial prototyping is done
* Need a way of cathiching resize events, so I can be notified on how much text to show
* There needs to be a better way to write css (variables, verification, potentially style reloading?)
* Easier write to write components. A react-like interface would be great:
  * `Widget.make(children=[Button.new(text="hello")], class_name=["hello", "test"])`

## Useful links

* https://github.com/D-Programming-Deimos/libX11/blob/master/c/X11/X.h#L150
  * List of events that you can bind to via LCUIDisplay_BindEvent

## TODO:

* Investigate catching kill hooks (atm not being executed)
  * Could be because of the way concurry is used?

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     native-ui:
       github: your-github-user/native-ui
   ```

2. Run `shards install`

## Usage

```crystal
require "native-ui"
```

TODO: Write usage instructions here

## Development

Bindings
```
@[Link(ldflags: "-L./LCUI/lib")]
```

## Contributing

1. Fork it (<https://github.com/your-github-user/native-ui/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [WhoAteDaCake](https://github.com/your-github-user) - creator and maintainer
