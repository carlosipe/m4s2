# On simple tools

I started doing web development in 2011. In almost a week I've watched all Ryan Bates' free railscasts and the following week I got a subscription and I watched the rest.

I had done some web development in PHP before and written some Perl scripts (mechanize script to automatize tasks as renewing books from the public library and so).

Learning Ruby was incredible. There's nothing more elegant than
```ruby
3.times do
  puts "Hello"
end
```

I got hooked by the beauty of writing a payment gateway integration as pure as:
```ruby
class Order
  def pay
    set_token
    verify_card_details
    process_payment
  end
end
```

code I don't like anymore, but at that time it sounded so pure and clear...

I convinced all my fellow programmers to move from PHP to Ruby. I told them that Rails was awesome, I built a demo to show how easy was dealing with templates, payment gateways, how there was a Ruby gem for every thing we wished for.

And then it came the moment to create an ecommerce in Rails for one of our clients. We were supposed to create a complex taxonomy of auto parts.. 

We found that sometimes we had 'error 500' issues after some deployments. Things worked differently in development and in production. Some parts were too slow. I learnt the hard way that an orm makes really easy to build N+1 queries.

I learnt about 


