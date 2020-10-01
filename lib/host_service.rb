require_relative "./database_connection"

class HostService
  def self.find_host_accommodation
    DatabaseConnection.query("SELECT * FROM accommodation WHERE host_id = '#{host_id}';")
  end

  
end