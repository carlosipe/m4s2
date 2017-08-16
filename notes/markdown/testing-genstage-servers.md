# Testing GenStage servers

Since a few weeks ago I'm playing with Elixir's GenStage and I'd like to write about a clever way to unit test GenStage stages. This is basically as:
```elixir
defmodule ConsumerMock do
  use GenStage

  def start_link(producer, subscription_options) do
    GenStage.start_link(__MODULE__, {producer, self(), subscription_options})
  end

  def init({producer, owner, subscription_options}) do
    {:consumer, owner, subscribe_to: [{producer, subscription_options}]}
  end

  def handle_events(events, _from, owner) do
    send(owner, {:received, events})
    {:noreply, [], owner}
  end
end
```

------

# The Checklist Manifesto

-----

# On software simplicity and business value

----

# On going fully remote

----

# Elixir's GenStage quirks

When a GenStage producer sends less events than demand, no consumer is going to ask for more, so it's the responsibility of the producer to fulfill the remaining demand as soon as it has more content to be sent.

What does this mean?

It means

---

# A web scraper written in Elixir

---

# On simple tools

In the last year and I'm writing more Elixir and less Ruby mainly due three reasons:
- I'm doing a lot of web scraping lately (Ruby isn't well suited for the task and Elixir runs smooothly)
- I'm enjoying very much the new toy
- I think the community is much better (I mean there's not a toxic monopoly as it happens in Ruby -which some call 'the Rails commnity'). The framework has eaten the community and it's really hard to find Ruby jobs that don't mean dealing with enormous monoliths (sometimes 'distributed monoliths' which is worse), and a mix of old Rails's conventions and new community conventions as calling everything a 'Service'. ActiveRecord is a cancer that makes very easy to couple everything and very difficult to draw boundaries.

This is not going to be a rant against Rails. I don't like it. This is simply going to be a showcase of alternative options:

- `dep` for dependencies
- `gs`
- `cuba`
- `mote`
- `sequel` (it isn't very small but it's much much better than ActiveRecord)

---

# On simple features: the cost of complexity
# On project decisions

I've been a CTO for some time and I've learned a lot about taking business decisions on how to build software and what to build.

So this is the case:
- We think that we have three possible 'projects' that could hypotetically give a revenue of 100, 50, 80 respectively.
- How we decide if we should do A, B, or C?

One common approach is comparing the expected revenue and ask the Engineering team to give the effort of each one, and then do a simple cost/benefit analysis. The idea makes a ton of sense.

The problem is:
- How we determine the revenue
- We shouldn't think in terms of 'effort' but in terms of cost

And what are the costs involved in software development?
- The time taken (it's cost of opportunity)
- The sexyness/innovation of the project 
  - less sexy projects are costly in terms of the team
  - less innovative projects are not long term, depending on what you do, if you want to be disruptive in the tech part, you should be doing innovation/research/experimenting all the time if you want to find something interesting
  - The Team is built, and the development culture is built
    - Less sexy projects means:
      - More difficult to get good developers that boost your productivity
 
- Building a team should be a concern of the whole company. 

---

# On small teams

---

# On technical debt

This is one of the most confusing terms I ever heard in a software development environment.
Code is always technical debt. Do you want to know how big is your technical debt? Just find out how much code you have.

Software development projects usually follow the same path.
At the first weeks/months everything is super fast

- Don't make your own CMS
- Don't make your own Blogging Platform
- Don't make your own Datawarehouse

If you can avoid writing code, avoid it!

Code is not an asset. Code is a liability.

If you wrote code, just delete it (if you can). If you wrote code that can be deleted, you did it well. Congrats!

Developers are a liability too. They are 'tomadores de deuda'. That's why I don't believe in big teams.

That's why misunderstanding the cost of code as the time taken is completely wrong. How fast developers can write the code is not a good metric of the cost, it just answer the question of 'how fast can you get me a debt?'

Taco Bell programmers

---

# On integrated tests vs unit tests vs acceptance tests

- Acceptance tests are used to check that we built what the user wants. They are not intended to test correctness or to help the developers to find bugs. Sometimes Acceptance tests are better conducted by humans and just avoiding automatic tests. Chinese people is cheap.

About software correctness and developers tools:
- Acceptance tests are not a developer tool
- Unit tests are
- Integrated test are a scam

http://blog.thecodewhisperer.com/permalink/integrated-tests-are-a-scam



---

# Text only sites

I'm awful at design. Awful. Really. 

When I'm reading a job description that says: 'keen eye for detail' that's a no-go for me.
I'm a programmer, a lawyer, a musician, a skydiver and an amateur philologist. But I don't know if orange and fucsia go well together.
In fact, the styles of this site are the ones of bettermotherfuckingwebsite.com

Every time I started writing a blog, deciding styles was too hard. This time I found a resource that's awesome:
https://www.designernews.co/stories/54330-textonly-sites

For people as me with no idea about line-height, aligning, etc and who still love minimalism, this is a good place to steal.

I love this design: steal it: http://www.giuliomichelon.com/

---

# Learn to use make

Makefiles are so powerful and an underrated tool.
I'm starting to use make much more. This blog is built using a combination of `m4`, `sed`, `pandoc`under a makefile.

MDS := $(patsubst notes/markdown/%.md, public/%.html, $(wildcard notes/markdown/*.md))

This means:
  - I save in a variable MDS:
    - Foreach notes/markdown/*.md I replace the name putting "/public/%.html" when it was "notes/markdown/%.md"

http://wadegarrett.com/resume/
ACM subscription

