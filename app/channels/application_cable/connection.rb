module ApplicationCable
  class Connection < ActionCable::Connection::Base
   identified_by :current_user
 
    def connect
      self.current_user = find_verified_user
    end
 
    protected
 
    def find_verified_user
      if (current_user.uid = session[:id])    #to check user is logged in or not
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end

