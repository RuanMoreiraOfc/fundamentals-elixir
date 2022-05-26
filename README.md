<h1 align='center'>
ELIXIR
</h1>

## Fundamentals

Elixir is a funcional complied language, one of the principles of it is immutability.
It means theres no direct modification to the data allocated.

As a funcional language it is not possible to change the data without a module: [Example with string!][string-example]

As a complied language, it needs to be complied before you run the program. But
with elixir installed you can run with any command without compiling it with the
**Elixir’s Interactive Shell** using in your terminal:

```bash
iex
```

## Help

To know better about any command/module you can use `h` command to describe how
to use or implement some feature

```elixir
h
```

```elixir
h String
```

```elixir
h String.upcase
```

### VS Code

When coding with vscode you can use some extensions to help you while coding.

Credo (Elixir Linter) [pantajoe]
ElixirLS: Elixir support and debugger [ElixirLS]

## Strict Choices

With maps you have to choose how you gonna call the key.

[Example with map!][map-example]

<div>
Javascript developers:
</div>

![vegeta under rain][sad-example]

<!-- VARIABLES -->

<!-- *** FILES *** -->

[string-example]: string.ex
[map-example]: map.ex

<!-- *** MEMES ***  -->

[sad-example]: https://c.tenor.com/4F6LXZy2_4kAAAAd/vegeta-under-the-rain.gif
