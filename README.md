# ![](Art/Face_64.png?raw=true) Haxxeptance

*A URL protocol handler that performs some URL rewriting*

Do you have friends who send you URLs, but keep misspelling
`http://example.com` as `hXXp://example.com`, or `https://example.org` as
`hxxps://example.org`?  Never fear, Haxxeptance is here!

## What does it do?

Haxxeptance is an app for macOS (10.9 or later).  Copy it to your
`/Applications/Utilities` folder (or anywhere on your Mac), and double-click
to run it.  It *appears* to do nothing (the app exits immediately)… but once 
you've run it, you can click on links such as
[hxxps://google.com/](hxxps://google.com/), and those links will open in
your default browser as if you had clicked on
[https://google.com/](https://google.com/)!

## How does it work?

Haxxeptance declares itself as a handler for the `hxxp:` and `hxxps:` URL
schemes.  When you run the app once,
[Launch Services](https://developer.apple.com/documentation/coreservices/launch_services)
takes note of the existence of the app as a handler for those schemes.
Thereafter, whenever you open such a link, Launch Services asks Haxxeptance to 
handle your request.  Haxxeptance fixes the misspellings in the URLs that it
receives, then asks Launch Services to open the corrected URLs — which are
then handled by your default browser.

Haxxeptance does not stay resident in memory, as it always exits shortly
after it starts running.

## Why?

I could have written a server-side e-mail filter that performs a
search-and-replace on the text, which would be a cross-platform solution.
However, that would have several drawbacks:

-  Misspelled links can occur in many contexts, not just in the body of an
   e-mail: a calendar invitation, inside a ZIP archive, etc.
-  It would break e-mail signatures, which is bad, because cryptographic
   signatures are good.
-  There might be an e-mail thread that discusses such misspellings, and it
   would be confusing to read such discussions if all of those misspellings
   were corrected for you before you could read them.  For that matter,
   altering what other people wrote is a bad idea in general.

## But really, why?

I wanted to learn to write code in Swift, and this seemed like a very
practical problem to solve that would make my life easier.
