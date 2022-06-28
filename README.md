<h1 align='center'>
ELIXIR
</h1>

<div align="center">

[![card-last-commit]][btn-null]

</div>

<div align="center">

[![style-guide]][btn-style-guide]

</div>

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


[btn-null]: #
[btn-style-guide]: https://github.com/christopheradams/elixir_style_guide


<!-- *** INFO CARDS *** -->

[card-last-commit]: https://img.shields.io/github/last-commit/ruanmoreiraofc/fundamentals-elixir?style=for-the-badge&label=Last%20Commit
[style-guide]: https://img.shields.io/badge/<StyleGuide>-_?style=for-the-badge

<!-- *** FILES *** -->

[string-example]: string.ex
[map-example]: map.ex

<!-- *** MEMES ***  -->

[sad-example]: https://c.tenor.com/4F6LXZy2_4kAAAAd/vegeta-under-the-rain.gif
