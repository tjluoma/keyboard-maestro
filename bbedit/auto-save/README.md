# Auto-Save All Open Files in BBEdit with Keyboard Maestro

This is one of my most-used Keyboard Maestro macros, and I never even have to think about it… which is my favorite kind of automation.

As of today, it just got a lot better, thanks to the BBEdit-Talk mailing list.<sup id="gglink"><a href="#fn-1">1</a></sup>

## Here’s how it looks in Keyboard Maestro:

![](https://github.com/tjluoma/keyboard-maestro/raw/master/bbedit/auto-save/BBEdit-KM-Autosave.png)

And here's the AppleScript for those who may just want to snag it:

	-- With thanks to Christopher Stone and Rich Siegel 
	-- Source: https://groups.google.com/d/topic/bbedit/dfT5wJY5wSI/discussion

	if application "BBEdit" is running then
		try
			tell application "BBEdit"
				set docList to (text documents whose on disk is true and modified is true)
				repeat with theDoc in docList
					save theDoc
				end repeat
			end tell
		end try
	end if

## “What does this do?”

It automatically saves all of my open text documents:

1.	Every minute while I’m using BBEdit (aka “is active” in Keyboard Maestro parlance)

2.	Every time I switch away from BBEdit to another app (aka “deactivates” in Keyboard Maestro)

That’s pretty cool, but the best part (IMO) is this: **it will only save files that have already been saved.**

Which means that if I have some temporary file open which hasn’t been saved (and probably doesn’t need to be saved),
then I won’t get prompted to save the files. I tend to use a _lot_ of temporary files in BBEdit, so this is a huge
plus for me.

## “That’s cool. How can I download / install it?”

Assuming that you already have [Keyboard Maestro] and [BBEdit] installed, download this file: [BBEdit-Auto-Save.kmmacros](https://raw.githubusercontent.com/tjluoma/keyboard-maestro/master/bbedit/auto-save/BBEdit-Auto-Save.kmmacros)
to somewhere like your Desktop to Downloads folder, and then double-click it to import it into Keyboard Maestro.

-----

[Keyboard Maestro]: http://www.keyboardmaestro.com/main/
[BBEdit]: http://www.barebones.com/bbedit

<ol id="footnotes">

<li id="fn-1">
<p>
You can find the BBEdit-Talk list on Google Groups at https://groups.google.com/forum/#!forum/bbedit.
You can also jump directly to this discussion at https://groups.google.com/d/topic/bbedit/dfT5wJY5wSI/discussion.
<a title="Return to article" href="#gglink">↩</a></p>
</li>

</ol>

