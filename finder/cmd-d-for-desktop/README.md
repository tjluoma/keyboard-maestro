
<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Thing I do a lot:<br><br>Accidentally duplicate one or more files by hitting ⌘-D in the Finder, expecting it to take me to the Desktop folder, like it does in Open/Save panels.</p>&mdash; Greg Pierce (@agiletortoise) <a href="https://twitter.com/agiletortoise/status/1041729096340971520?ref_src=twsrc%5Etfw">September 17, 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Do you delete the standard shortcut in Finder? Possible to share your solution?</p>&mdash; 🚩𝙲𝙻𝙰𝚄𝚂 𝚆𝙾𝙴𝙻𝙺𝙲𝙷𝙴𝙽 (@confluencepoint) <a href="https://twitter.com/confluencepoint/status/1041808897697296384?ref_src=twsrc%5Etfw">September 17, 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Here’s how I solved this:

### Step 1: Create a “Group” in Keyboard Maestro which is only active for Finder:

![](Keyboard-Maestro-Create-Finder-Only-Group.png)

This allows me to define keyboard shortcuts, etc. that are only activated when I am using Finder.

### Step 2: Tell Keyboard Maestro to use ⌘D to Open the Desktop:

![](Keyboard-Maestro-CMD-D-for-Desktop.png)

That’s all there is to it.

I didn’t delete the standard shortcut. Apparently Keyboard Maestro intercepts the ⌘D before Finder ever sees it.

[Keyboard Maestro]: http://www.keyboardmaestro.com/main/

It’s very simple, but if you want to use my Keyboard Maestro macro, you can [get it here](finder-cmd-d-for-desktop.kmmacros).
