# Requirement

* Ruby version: 2.4
* Rails Version: 5.1.1

# API Docs

The root endpoint is /api/products, for individual product, visit /api/products/:id

acceptable params are 


| Param  | Type | Possible Value | Sample | Default
| ------ | ---- | ---- | ---- | ---- |
| min_price  | int  | any number bigger than 0 | 20 | 0
| max_price  | int  | any number bigger than 0 | 1000 | not limit
| order  | string  | desc, asc | asc | desc
| page  | int  | page starts at 0 | 1 | 0
| per_page  | int  | any number bigger than 0 | 50 | 100
| categories  | string  | comma split string | tools,makeup | not filtered, all categories

Sample Request: https://enigmatic-sierra-36007.herokuapp.com/api/products?order=asc&per_page=1

Sample Response

``` json

{
  "data": [
    {
      "id": "93",
      "type": "products",
      "attributes": {
        "name": "random item 92",
        "sold-out": true,
        "under-sale": true,
        "price": 20,
        "sale-price": 5,
        "category": "makeup"
      },
      "relationships": {
        "category": {
          "data": {
            "id": "1",
            "type": "categories"
          }
        }
      }
    }
  ],
  "meta": {
    "total": 1000
  }
}

```

Pagination: Use total in meta as paging guide.


# Database

create `rails db:create` 

seeds `rails db:seed` 

# Tests

bundle rspec

# Deployment

Deployed to Heroku.

https://enigmatic-sierra-36007.herokuapp.com/api/products

# To Do

Left over due to time constraints

1. Figure out the best way for caching (API is read heavy)
2. Use Oj for json dumping

# Possible Improvements

1. Use Cap’n Proto instead of JSON
2. Simply responses
