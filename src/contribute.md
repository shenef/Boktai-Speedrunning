# How to write Guides

These guides are written in [Markdown](https://en.wikipedia.org/wiki/Markdown) using [mdBook](https://rust-lang.github.io/mdBook/).  
There are a couple good tutorials available such as [markdowntutorial.com](https://www.markdowntutorial.com/).

If you want to contribute directly, you can visit the repository on GitHub and submit changes by editing the files there and then submitting a Pull request.

Because of how mdBook works and the adjustments we made, many markdown previews won't display correctly. But if you are following good practices and the examples here, it should display just fine on the final site.

If you run into any issues, don't hesitate to ask in our [Discord](https://discord.gg/0dUb9OmJrIrRPFGf).

Below are a couple of examples on how to use the adjustments we made to mdBook for writing Boktai guides specifically.

## Examples

### <span class="sol">Elemental</span> <span class="cloud">colors</span>

Used to mark the use of elements. For example on recommended Lenses or Enchantments.  
Legible on the Dark themes but on the Light themes they are not exactly great.

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

### <span class="boss">Markers</span>

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

### Embedded video files

<video controls muted>
  <source src="./boktai/assets/video/bloodrust_puzzle.webm" type="video/webm" />
</video>

Encoded using:

```powershell
ffmpeg -i "input.mkv" -vf "scale=2*iw:2*ih:flags=neighbor" -c:v libvpx-vp9 -b:v 0 -crf 38 -row-mt 1 -deadline best -pix_fmt yuv420p -pass 1 -an -f null NUL &&
ffmpeg -i "input.mkv" -vf "scale=2*iw:2*ih:flags=neighbor" -c:v libvpx-vp9 -b:v 0 -crf 38 -row-mt 1 -deadline best -pix_fmt yuv420p -pass 2 -c:a libopus -b:a 96k "output.webm"
```

Unreasonably slow and higher quality than needed but for now it's just for testing and videos are never going to be long anyway.

Embedded using:

```html
<video controls muted>
  <source src="./boktai/assets/video/test.webm" type="video/webm" />
</video>
```

### YouTube, Twitch embeds

Make sure the URL is formatted like this:

- <https://www.youtube.com/embed/uHMaErqqU_E>
- <https://player.twitch.tv/?video=2328442079&parent=shenef.github.io&autoplay=false>

Set `aspect-ratio` to the aspect ratio of your video. Usually `16/9` but direct GBA exports are `3/2`.  
Title is not mandatory but it helps to identify the video when you don't have a markdown preview.

Sadly the embed system of Twitch is terrible and the video will only load if the "parent" parameter in the URL is set <span class="boss">and</span> matches the page it's embedded into. For local testing you'll have to set that "parent" parameter to `localhost`.

YouTube:

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

Twitch:

```html
<iframe
  style="aspect-ratio: 16/9"
  src="https://player.twitch.tv/?video=2328442079&parent=shenef.github.io&autoplay=false"
  title="Boktai 1: Any% Normal 2 speedrun in 1:30:06"
  allowfullscreen
></iframe>
```

<iframe
  style="aspect-ratio: 16/9"
  src="https://player.twitch.tv/?video=2328442079&parent=shenef.github.io&autoplay=false"
  title="Boktai 1: Any% Normal 2 speedrun in 1:30:06"
  allowfullscreen
></iframe>

### Interactive elements

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

### Admonishments

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

### Table of Contents

The table of contents doesn't work correctly for level 5+ headers, so please avoid those.

#### ToC Level 4

Lorem ipsum dolor sit amet

##### ToC Level 5

The header is now smaller than the text and breaks the sidebar on the right.
