# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning an older version of Rails to mimic real life projects that don't always use the latest versions of their tech-stack. 

Users can add a variety of products to their shopping cart, as long as it is not sold out, and can make their purchase using Stripe. Admins can add new products and categories, review stock. It is also posible to generate sales that are auto applied and removed based on the dates assigned.

## A selection of screenshots

![User view of all products](https://github.com/Matduro/jungle-rails/blob/master/screenshots/user-all-products.png "User view of all products")

![User view of their shopping cart](https://github.com/Matduro/jungle-rails/blob/master/screenshots/shopping-cart.png "User view of their shopping cart")

![User view for transactions](https://github.com/Matduro/jungle-rails/blob/master/screenshots/stripe-payment.png "User view for transactions")

![Admin view of all products](https://github.com/Matduro/jungle-rails/blob/master/screenshots/admin-all-products.png "Admin view of all products")

![User view of product page](https://github.com/Matduro/jungle-rails/blob/master/screenshots/product-page.png "User view of product page")

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
