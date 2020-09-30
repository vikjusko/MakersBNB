require_relative "./app"
require_relative './controllers/application_controller'
require_relative './controllers/accommodation_controller'
require_relative './controllers/booking_controller'
require_relative './controllers/user_controller'

use AccommodationController
use BookingController
use UserController
run MakersBNB
