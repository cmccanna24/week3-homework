# Week 3 Homework

FORK this repository before you start.

DUE: You must push your code to GitHub no later than **Thursday, April 23 at 5:29PM**.

### Overview

Your job is to transform the Chicago app into a database-backed web application.

You can earn up to **2 points per challenge**, plus up to 2 points for code readability (good variable names, consistent indentation, etc.) for a total of **10 points**. Points are awarded for correctness and

### Challange #1: A `Place` Model
1. Create a model named Place that can keep track of each place's title, photo url, admission price, and description.  The title can be limited to 255 characters, but the description should support text at least 1000 characters in length.  The admission price should be stored as integer representing the number of cents.
1. Rewrite the `index` action so that is database-driven.  There should be no hardcoded data in any of your code by the time you are done.
1. Write code in your `db/seeds.rb` file so that it is prefills the database with at least 5 places.  Make sure that you can run the seeds file multiple times and still end up with the same number of places each time.

### Challenge #2: Let Users View and Delete

By the end of this challenge, you should end up with 3 routes like this:

``` ruby
  get '/places' => 'places#index'
  get '/places/:id' => 'places#show'
  get '/places/:id/delete' => 'places#delete'
```

1. Support the following url: `/places/:id` and connect it to an action method named `show` in the `PlacesController`.  This action should display all of the details of a particular Place.
1. Modify the `index` action so that each place links to the `show` page for that place.
1. On the `index` page, also add a link to `/places/:id/delete` such that when the user clicks the link, that Place should be removed from the database, and the user should be redirected back to the `index` page to verify that the Place has been deleted.

### Challenge #3: Add and Edit Places

By the end of this challenge, you should have these 7 routes:

``` ruby
  get '/places' => 'places#index'
  get '/places/:id' => 'places#show'
  get '/places/:id/delete' => 'places#delete'
  get '/places/new' => 'places#new'
  get '/places/create' => 'places#create'
  get '/places/:id/edit' => 'places#edit'
  get '/places/:id/update' => 'places#update'
```

1. At the top of the index page, add a link to add a new place.  The link should navigate to `/places/new`, which must display a form for the user to fill in (title, url, price, and a description). The form should target the `create` action. When the user submits the form, a new row should be added to the database, and the user should be redirected back to the `index` action to see a refreshed list that now includes their new place.
1. On the `show` page, add a link to `/places/:id/edit` to display a form for the user to edit the details of the place.  The form should target the `update` action, which should update the row in the database, and redirect to `/places/:id` so the user can verify that the database has been updated.



### Challenge #4: Let Users Write Reviews

You are free to invent the URLs, routes, controller(s) (if any) and actions necessary to achieve the following:

1. Create a `Review` model that connects a Place to zero or more reviews.  A review should have a short title, a rating from 0 to 5, and a long description.
1. On the `show` page for a place, add a form so that users can submit a review. When a review is submitted, the user should see their review inserted at the top of the list of reviews.
2. Any existing reviews should appear below the form.


### HINTS

Here are some Rails view helper methods that you might find helpful:

* [`link_to`](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to)
* [`image_tag`](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html#method-i-image_tag)
* [`simple_format`](http://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#method-i-simple_format)
* [`text_field_tag`](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-text_field_tag)
* [`submit_tag`](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-submit_tag)
* [`select_tag`](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-select_tag)
* [`number_to_currency`](http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_to_currency)


And here are some command-line utilities:

* `rake db:migrate`
* `rake db:seed`

If something isn't working and you can't figure out why, watch the **server log**.

Warning: contrary to what you may read online, do not use `form_tag` or `form_for` (at least, not this week).


