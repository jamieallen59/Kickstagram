Kickstagram
=============

My clone of instagram, but spicifically for your favourite shoes. The more fly, the better

[![Code Climate](https://codeclimate.com/github/jamieallen59/Kickstagram/badges/gpa.svg)](https://codeclimate.com/github/jamieallen59/Kickstagram)

A working version of the app can be found here: [Kickstagram](http://kicksta-gram.herokuapp.com/)

Technologies and methods used:
- Uploading and processing images using Paperclip, hosting via Amazon S3
- Managing secret information (e.g. private keys)
- Many-to-many relationships in Rails (with tagging)
- Geocoding with Google Maps
- Twitter Bootstrap
- Creating APIs using Rails + jBuilder
- Payments using Stripe

Go to the homepage, sign up and post your favourite kicks. Set a price to sell you picture at and allow people to see where you've posted from, using Gmaps.

### Have a look at the code
```sh
git clone git@github.com:jamieallen59/Kickstagram.git
cd Kickstagram
bundle
bin/rake db:create
bin/rake db:migrate
```

### How to run it
```sh
cd Kickstagram
bin/rails s
```

open your browser and go to [localhost:3000](http://localhost:3000)

### How to test it
```sh
cd Kickstagram
rspec
```