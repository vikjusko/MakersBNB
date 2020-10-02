# MakersBNB

#### Databases hosted online by Amazon

- makersbnb
- makersbnb_test

#### AccommodationController class

**_Methods:_**

- .all
- .create
- .find

#### BookingService class

**_Methods:_**

- .create
- .all
- .find_booking
- .confirm_booking

#### HostService class

**_Methods_**

- .all
- .find_pending_rquests
- .approve_request

#### UserService

**_Methods_**

- .register
- .login
- .logout
- .current_user

###To run tests:

```
$ bundle install
$ rspec
```

###To run locally:
Open browser to http://localhost:9292/

```
$ bundle install
$ rackup
```

###User stories:

As a user,
So that I can see all of the accommodation options
I would like to see a list of all of them

As a user,
So that i can book certain accommodation,
I would like to be able to choose it

As a user,
So that i can book the accommodation
I would like to be able to submit a request with my email address and dates of choice

As a user,
So that I can see a confirmation of my request being sent off,
I would like to see a confirmation message re it on the website

Host stories:

As a host,
So that I can process the booking,
I would like for all of the booking requests to be stored

As host,
So that a user can book my space,
I would like for my space to be on the main page with all the spaces - details (location, price, description).

##Group tools used:

Ludichart:
https://app.lucidchart.com/documents/edit/a9ff61bd-ee1c-41c0-a397-5ca1240fd531/m-5o7ONTd-nK?shared=true#?folder_id=home&browser=icon

Miro:
https://miro.com/app/board/o9J_kkPFWFQ=/

Github:
https://github.com/vikjusko/MakersBNB.git

Trello board:
https://trello.com/b/hvV3tQFT/makerbnb
