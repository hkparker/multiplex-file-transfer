#!/usr/bin/env ruby

require './multiplexity_client.rb'

server = TCPSocket.open("192.210.217.180", 8000)
client = MultiplexityClient.new(server)
client.handshake(8001,3145728)
bind_ips = []
bind_ips << Array.new(10,"192.168.1.9")
bind_ips << Array.new(10,"192.168.1.6")
bind_ips << Array.new(10,"10.0.4.15")
bind_ips << Array.new(10,"192.168.1.36")
bind_ips = bind_ips.flatten
client.setup_multiplex(bind_ips, "192.210.217.180")
client.download_file("largest", true, true)
client.shutdown
