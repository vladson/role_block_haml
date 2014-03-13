# Role Block Haml
Role Block Haml - is a gem, that adds some awesome shortcuts for `data-role` and `data-block` attributes to Haml parser.
Especially useful when combined with [Evil Blocks] by [Evil Martians]

## Usage

```haml
    @@todo
      %span@linker
      @actor
```

Is converted into:

```html
    <div data-block="todo">
        <span data-role="linker"></span>
        <div data-role="actor"></div>
    </div>
```

## Install

### Ruby on Rails

Add `role_block_haml` gem to `Gemfile`:

```ruby
    gem "role_block_haml"
```