#!/usr/bin/env ruby

require '../imux_manager.rb'
require '../imux_socket.rb'
require '../file_write_buffer.rb'

class IMUXManagerTest
	def initialize
		@socket_count = 25
	end
	
	def test_can_create_unbound_session
		@server = IMUXManager.new
		@client = IMUXManager.new
		recieve = Thread.new{ @server.recieve_workers("127.0.0.1", 8001, @socket_count) }
		sleep 1
		@client.create_workers("127.0.0.1", 8001, Array.new(@socket_count, nil))
		recieve.join
		return true
	end

	def test_can_create_bound_session
		@server = IMUXManager.new
		@client = IMUXManager.new
		recieve = Thread.new{ @server.recieve_workers("127.0.0.1", 8001, @socket_count) }
		sleep 1
		@client.create_workers("127.0.0.1", 8001, Array.new(@socket_count, "127.0.0.1"))
		recieve.join
		return true
	end

	def test_can_add_unbound_workers
		
	end

	def test_can_add_bound_workers
		
	end
	
	def test_can_remove_unbound_workers
		@server = IMUXManager.new
		@client = IMUXManager.new
		recieve = Thread.new{ @server.recieve_workers("127.0.0.1", 8001, @socket_count) }
		sleep 1
		@client.create_workers("127.0.0.1", 8001, Array.new(@socket_count, nil))
		recieve.join
		@client.change_worker_count(-10,nil)
		return (@client.get_stats[:worker_count] == @socket_count-10)
	end
	
	def test_can_remove_bound_workers
		@server = IMUXManager.new
		@client = IMUXManager.new
		recieve = Thread.new{ @server.recieve_workers("127.0.0.1", 8001, @socket_count) }
		sleep 1
		@client.create_workers("127.0.0.1", 8001, Array.new(@socket_count, "127.0.0.1"))
		recieve.join
		@client.change_worker_count(-10,"127.0.0.1")
		return (@client.get_stats[:worker_count] == @socket_count-10)
	end
	
	def test_can_get_stats
		@server = IMUXManager.new
		@client = IMUXManager.new
		recieve = Thread.new{ @server.recieve_workers("127.0.0.1", 8001, @socket_count) }
		sleep 1
		@client.create_workers("127.0.0.1", 8001, Array.new(@socket_count, "127.0.0.1"))
		recieve.join
		return true
	end
end

test = IMUXManagerTest.new
puts "test_can_create_unbound_session\t=>\t#{test.test_can_create_unbound_session}"
puts "test_can_create_bound_session\t=>\t#{test.test_can_create_bound_session}"
puts "test_can_remove_unbound_workers\t=>\t#{test.test_can_remove_unbound_workers}"
puts "test_can_remove_bound_workers\t=>\t#{test.test_can_remove_bound_workers}"
puts "test_can_get_stats\t\t=>\t#{test.test_can_get_stats}"
