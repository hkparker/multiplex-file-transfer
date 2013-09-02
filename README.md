Multiplexity
===========================

Multiplexity is an application designed to transfer files and directories over multiple sockets, network interfaces, and networks.  The original goal was to transfer files using multiple networking interfaces joined to separate networks while utilizing as much of the avaliable bandwidth as possible.  In testing, however, it became clear that even on a single network using multiple sockets to transfer smaller chunks of a file could improve performance due to some implementations of traffic shaping / throttling.


Current status
--------------

You can download a single file from a server at this point, and while that is working reliably there are still many missing features.  Finishing the basic functionallity and cleaning up code now.

Usage
-----

Multiplexity is still in very active development, and many features do not exist yet.

Client:
	-n	skip firewall rule setup
	-b	IP addresses to bind to (comma separated)
	-s	server IP addess
	-p	server port
	-mp	multiplex port
	-c	chunk size
	-v	verbose
	-r	recycle sockets (0 = after every chunk, unspecified = never, X = after X bytes)
	-m	mode (multiple interfaces or multiple sockets on default interface)
	-sc	socket count (number of sockets to open per interface)
	-h	print help

Server:


Examples
--------



Requirements
------------

Ruby >= 1.9.1

rpam (http://rpam.rubyforge.org/) required for server when PAM is used

Todo
----

Clean up code / finish basic features

Directory downloads

File/directory uploads

More firewall support

SSL sockets for everything

License
-------

This project is licensed under the MIT license, please see LICENSE.md for more information.

Contact
-------

Please feel free to contact me at haydenkparker@gmail.com
