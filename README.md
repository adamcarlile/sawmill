# Sawmill

This gem is designed to parse log files

## Installation

Clone this repo, and run the following command:
```
rake install
```

The sawmill binfile should now be in your path.

## Usage

Invocation is via `sawmill`, help is provided by `sawmill help` or `sawmill help [COMMAND]` for detailed command help.

```
sawmill help read
Usage:
  sawmill read FILE

Options:
  r, [--renderer=RENDERER]      # Specify a renderer to display the results
                                # Default: text
                                # Possible values: text
  p, [--parser=PARSER]          # Specify a parser to read the log file
                                # Default: tuple
                                # Possible values: tuple
  u, [--unique], [--no-unique]  # Reduce by unique views

Read a log file and display the results
```

It is shipped with an example file in the `rspec/fixtures/webserver.log`

## Testing

The application has a spec suite, and can be invoked through: `bundle install && bundle exec rspec`

## Design

The basic structure of this gem is as follows. We ingest the file with the file class, that class is responsible for yielding each line to a parser. That parser can be specified at run time, however in this implementation there is only one. Each line is then transformed into a ruby object that represents a page, and a collection of vists to that page.

By default we count all visits in the total, regardless of their uniqueness, however in order to keep the API simple and no in-line switching based on some control flow, we apply a different presenter to the page, which redefines how the count is tallied. In this case injecting a uniq call into the stack.

Finally after we've applied those calls, we shovel the sorted array of pages, with their views, back into a render, who's responsibility it is to actually output the objects in a meaningful way. Again, this was designed to allow for extension, potentially to output a table, or some other great ASCII concotion, or even potentially render a PDF if that's your bag!

## TODO

* Error control and handling, for blank file handlers, or files with malformed contents
* Potentially colourising the output, or transforming it into a table
* A few more tests around the CLI, perhaps a high level integration spec, that actually excercises the CLI in a shell

(However I ran out of time)

## Problems

* The dataset as supplied contains malformed IP address, therefor we cannot use the built in ruby library for handling IP addresses, as they raise validation exceptions. But provided with a real dataset, we could reinstate that line in the `sawmill/attributes/ip` object.
