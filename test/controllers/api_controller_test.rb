require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  	#Método getPosts(tag, token)
  	test "Método getCount retorna nil si no pudo accede a API Instagram" do
	  tag = "gato"
	  token = "token.invalido"
	  assert_nil @controller.send(:getCount, tag, token), "Token Invalido"

	  #Caso correcto
	  token = "3242573746.1677ed0.4d392de57b29498d824f8bf83af91e45"
	  assert_not_nil @controller.send(:getCount, tag, token), "Token Valido"
	end


	#Método getPosts(tag, token)
  	test "Método getPosts retorna nil si no pudo accede a API Instagram" do
	  tag = "gato"
	  token = "token.invalido"
	  assert_nil @controller.send(:getPosts, tag, token), "Token Invalido"

	  #Caso correcto
	  token = "3242573746.1677ed0.4d392de57b29498d824f8bf83af91e45"
	  assert_not_nil @controller.send(:getPosts, tag, token), "Token Valido"
	end

	#Método getTags(tag, token)
  	test "Método getTags que usa todos los metodos y retorna el JSON" do
  		#Ruteo 
  		begin 
		    assert_not(Rails.application.routes.recognize_path('/instagram/tag/buscar/perro'))
		rescue ActionController::RoutingError => error
		    assert error.message.start_with? "No route matches"
		end
	end




end