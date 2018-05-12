# Odometex
Simple distance comparisons for Elixir.

**Note:** Unit length -> meters

## Installation
```elixir
def deps do
  [
    {:odometex, "~> 0.1.0"}
  ]
end
```

## Usage
To compare distances with some global references.
```elixir
  Odometex.compare(20)
  # => [
  #   %Odometex.Result{label: "Bowling lane", meters: 19, times: 1.052632},
  #   %Odometex.Result{label: "Blue Whale (female)", meters: 25, times: 0.8},
  #   %Odometex.Result{label: "Basketball court", meters: 28, times: 0.714286},
  #   %Odometex.Result{label: "Football pitch", meters: 105, times: 0.190476},
  #   %Odometex.Result{
  #     label: "Passeig de Gràcia, Barcelona",
  #     meters: 1300,
  #     times: 0.015385
  #   }
  # ]

  # It supports order and limit options
  Odometex.compare(20, order: :desc, limit: 5)
  # => [
  #   %Odometex.Result{label: "Great Wall", meters: 8851000, times: 2.0e-6},
  #   %Odometex.Result{label: "Amazon River", meters: 6992000, times: 3.0e-6},
  #   %Odometex.Result{label: "Nile", meters: 6853000, times: 3.0e-6},
  #   %Odometex.Result{label: "Sahara", meters: 4800000, times: 4.0e-6},
  #   %Odometex.Result{label: "Route 66", meters: 3945000, times: 5.0e-6}
  # ]
```

Documentation can be found on [HexDocs](https://hexdocs.pm/odometex/api-reference.html).

## Contributing
Do you know any cool distance/reference that isn't listed [here](config/distances.json)? It isn't also on the open issues?
Please create a new issue or submit a PR, we will be happy to receive it.

