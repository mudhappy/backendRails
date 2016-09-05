module ApplicationHelper
	def resource
		#Si no está declarado o es nulo asignale este valor
		@resource ||= User.new
	end
	def resource_name
		#Recurso asignado
		:user
	end

	def resource_class
		#Cual es la clase del recurso
		User
	end
end
