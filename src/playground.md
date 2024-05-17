# Editing Playground

## Custom <span class="cloud">colors</span> and <span class="mission">markers</span>

### Elemental colors

Legible on the Navy theme but on the Light theme they are not exactly great.

- <span class="sol">Sol</span>  
  `<span class="sol">Sol</span>`
- <span class="luna">Luna</span>  
  `<span class="luna">Luna</span>`
- <span class="dark">Dark</span>  
  `<span class="dark">Dark</span>`
- <span class="flame">Flame</span>  
  `<span class="flame">Flame</span>`
- <span class="frost">Frost</span>  
  `<span class="frost">Frost</span>`
- <span class="earth">Earth</span>  
  `<span class="earth">Earth</span>`
- <span class="cloud">Cloud</span>  
  `<span class="cloud">Cloud</span>`

### Markers

Used to mark headers and strategies. Font color changes on hover.

- <span class="safety">Safety / Backup strat</span>  
  `<span class="safety">Safety / Backup strat</span>`
- <span class="trap">Trap</span>  
  `<span class="trap">Trap</span>`
- <span class="mission">Mission</span>  
  `<span class="mission">Mission</span>`
- <span class="boss">Boss fight</span>  
  `<span class="boss">Boss fight</span>`
- <span class="purification">Purification</span>  
  `<span class="purification">Purification</span>`
- <span class="puzzle">Puzzle</span>  
  `<span class="puzzle">Puzzle</span>`

## Video embeds

Make sure you use the `/embed/` URL.  
Set `aspect-ratio` to the aspect ratio of your video. Usually `16/9` but direct GBA exports are `3/2`.  
Title is not important but it helps to identify the video when you don't have a markdown preview.

```html
<iframe
  style="aspect-ratio: 2/1"
  src="https://www.youtube.com/embed/uHMaErqqU_E"
  title="Boktai 1 28 Dungeons in 2:16:15"
  allowfullscreen
></iframe>
```

<iframe
  style="aspect-ratio: 2/1"
  src="https://www.youtube.com/embed/uHMaErqqU_E"
  title="Boktai 1 28 Dungeons in 2:16:15"
  allowfullscreen
></iframe>

## Interactive elements

You can use javascript within a book, which allows for some interactivity.  
Below is a simple example but theoretically that allows for

- conditional Guides that show/hide strats based user input
- inlined tools like calculators, RNG manip helpers, ...
- etc.

Example:  
Write something here: <input type="text" id="input_in_mdbook">  
Then press this
<button
  type="button"
  onclick="alert(document.getElementById('input_in_mdbook').value)" >
  suspicious button
</button>
to show it as a popup.

## Admonishments

These are styled messages that can have an icon, a color, a title and can be collapsible.  
Documentation: <https://tommilligan.github.io/mdbook-admonish/>  
Some examples:

```admonish info
A beautifully styled message.
```

```admonish warning title="Data loss"
The following steps can lead to irrecoverable data corruption.
```

```admonish success title=""
Box without a title.
```

```admonish tip title="_Markdown_ and <i>HTML</i>"
Markdown *and* HTML `can` be used in the <span style="color: hotpink">inner content</span> and title.
```
<!-- markdownlint-disable-next-line code-fence-style -->
~~~admonish tip
Runnable rust code within an admonishment:
```rust
fn main() {
  println!("Hello, World!");
}
```
~~~

Collapsible:

```admonish collapsible=true
Collapsible.
```

Collapsible with no title:

```admonish success title="" collapsible=true
Collapsible and no title
```

## Table of Contents

The table of contents doesn't work correctly for level 5+ headers, so please avoid those.

### ToC Level 3

Lorem ipsum dolor sit amet

#### ToC Level 4

Lorem ipsum dolor sit amet

##### ToC Level 5

The header is now smaller than the text + RIP ToC

###### ToC Level 6

The header is now smaller than the text + RIP ToC
