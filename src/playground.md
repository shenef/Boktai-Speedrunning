# Editing Playground

## Interactive elements

Write something here: <input type="text" id="input_in_mdbook">  
Then press this
<button
  type="button"
  onclick="alert(document.getElementById('input_in_mdbook').value)" >
  suspicious button
</button>

## <span class="earth">Formatting</span> <span class="cloud">Stuff</span>

Showing off the elemental colors:

- <span class="sol">Sol</span>
- <span class="luna">Luna</span>
- <span class="dark">Dark</span>
- <span class="flame">Flame</span>
- <span class="frost">Frost</span>
- <span class="earth">Earth</span>
- <span class="cloud">Cloud</span>

Legible on the Navy theme but on the Light theme they are not exactly great.

## Video embeds

<iframe
  style="aspect-ratio: 2/1"
  src="https://www.youtube.com/embed/uHMaErqqU_E"
  title="Boktai 1 28 Dungeons in 2:16:15"
  allowfullscreen
></iframe>

## Admonishments

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

## testing the table of contents

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel purus at velit scelerisque maximus. Nam eget tincidunt nulla. Vestibulum quis enim massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida ligula a eros eleifend pulvinar. Pellentesque accumsan cursus auctor. Proin pharetra massa eget eros tincidunt, nec eleifend eros sagittis. Proin nulla tellus, scelerisque id leo a, porttitor consequat lorem.

### stuff within stuff

Lorem ipsum dolor sit amet

#### within stuff

Lorem ipsum dolor sit amet

##### within stuff

The header is now smaller than the text + RIP ToC

###### within stuff

The header is now smaller than the text + RIP ToC
