require_relative "./app"
require_relative './controllers/application_controller'
require_relative './controllers/accommodation_controller'
require_relative './controllers/booking_controller'

use AccommodationController
use BookingController
run MakersBNB
