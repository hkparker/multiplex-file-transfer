class IMUXConfig
	attr_accessor :sockets_per_ip
	attr_accessor :bind_ips
	attr_accessor :port
	attr_accessor :recycle_sockets

	def initialize(sockets_per_ip=25, bind_ips=[], port=8001, recycle_sockets=false)
		@sockets_per_ip = sockets_per_ip
		@bind_ips = bind_ips
		@port = port
		@recycle_sockets = recycle_sockets
	end
	
	def client_config
		return { :sockets_per_ip => @sockets_per_ip,
				 :bind_ips => @bind_ips,
				 :multiplex_port => @port,
				 :recycle_sockets => @recycle_sockets
		}
	end
	
	def server_config
		socket_count = (@bind_ips.size > 0 ? @sockets_per_ip*@bind_ips.size : @sockets_per_ip)
		return { :bind_port => @port,
				 :socket_count => socket_count,
				 :recycle_sockets => @recycle_sockets
		}
	end
end