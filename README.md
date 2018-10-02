# FactoryBotVariants

In tests it's common to create several objects which vary by only one or two
attributes (particularly when asserting the order, or filtering, of entities):

```ruby
it "sorts dogs oldest to youngest" do
  dog_1 = build(:dog, name: "Fido", age: 5)
  dog_2 = build(:dog, name: "Benji", age: 10)
  dog_3 = build(:dog, name: "Spot", age: 1)

  expect(DogSorter.new.sort).to eq [dog_2, dog_1, dog_3]
end
```

With `FactoryBotVariants` you could write this as:

```ruby
dog_1, dog_2, dog_3 = build_variants(:dog, names: ["Fido", "Benji", "Spot"], ages: [5, 10, 1])
```

You can specify attribute names in plural if you like; `names` will become
`name` as the attributes are passed to your factory.

If you have common attributes to assign to each variant, use the `:all` key:

```ruby
build_variants(:dog, names: ["Brutus", "Avril"], all: { cute: false })
```

## Installation

In your gemfile:

```ruby
group :test do
  gem "factory_bot_variants"
end
```

Then `bundle install` and include the DSL where you'd like to use it:

### In specific tests

```ruby
require "factory_bot_variants/dsl"

RSpec.describe Dog do
  include FactoryBotVariants::DSL

  # Your spec
end
```

### In all specs

```ruby
require "factory_bot_variants/dsl"

RSpec.configure do |config|
  config.include FactoryBotVariants::DSL
end
```

## API

There's an equivalent `_variants` method per [FactoryBot strategy][strategies]:

[strategies]: https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#using-factories

- `build_variants`
- `create_variants`
- `attributes_for_variants`
- `build_stubbed_variants`

Arguments:

1. Factory name
1. Traits (optional)
1. One or more variant attributes

Example:

```ruby
build_variants(
  factory_name,
  trait,
  attr1: [:a, :b],
  attr2: [1, 2],
  all: { common_attr: 1 },
)
```
