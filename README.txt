================================================================================
QOTDD : `Quote of the Day Daemon`	A QOTD server for nerds
================================================================================

QOTDD is an implementation of RFC 865: the Quote of the Day Protocol.
It's simple, really:
	* User connects to server with raw TCP connection
	* Server sends back today's quote
	* User smiles
	* Server disconnects user

Heck, QOTDD even comes with a couple quote files for you to start with!

Tested on GNU CLISP. <3



----------------------------------------
USAGE
----------------------------------------
To start QOTDD, just fire up your Lisp interpreter, load :qotdd, and run it!

	[1]> (ql:quickload :qotdd)
	[2]> (qotdd:server :path "/usr/games/qotdd/2018"
	                   :host "127.0.0.1"
			   :port "1117")

This assumes that you can load :qotdd with Quicklisp
(https://beta.quicklisp.org/), and that you've installed the defaults QOTD
sets (in "./qotd_sets/") to "/usr/games/qotdd/".

To use Quicklisp to load QOTDD, just install it (https://beta.quicklisp.org/),
then put QOTDD in `~/quicklisp/local-projects/`.

The dependencies of QOTDD are NIH, a general-bleh library I've written-- which
can be found at `https://git.eunichx.us/nih/`-- and USOCKETS, which can be
installed from Quicklisp as `:usockets`.


File Format
--------------------
The file-format of QOTDD quote sets is *exactly* like the format BSD fortune
uses-- that is, a single text-file with several "%" seperated sections.
Well, there is *one* difference to the BSD fortune format-- that is, at some
point in each section, there should be a specified date, using this format:
":Date YYYY-MM-DD"

That listing is how QOTDD determines which quote to pick for which day.
If there is no quote for today, then QOTDD picks a random quote (so, I guess,
if you used a Fortune file, you could use QOTDD as a simple random-fortune
server!).

Here's an example:


QOTDD File Example
====================

:Date 2018-09-06
"Hi there."
	-- Literally Everyone
%
:Date 2018-09-07
"How are you?"
	-- Me
%
:Date 2018-09-08
"Eat yourself."
	-- Dad
%

====================
Example End



----------------------------------------
BORING STUFF
----------------------------------------
License is in COPYING.txt (GNU GPLv3~! <3)
Author is Jaidyn Ann <jadedctrl@posteo.at>
Sauce is at https://hak.xwx.moe/jadedctrl/qotdd
