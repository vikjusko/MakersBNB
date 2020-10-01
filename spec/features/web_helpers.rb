def view_space_details
  visit '/accommodations'
  click_button 'See more'
end

def log_out
  visit '/'
  click_button 'Log out'
end