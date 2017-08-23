## GenStage again

I keep playing with GenStage and learning along the way.

Some basics I missed before I started which made me make some
mistakes:

- A GenStage flow is composed by several GenStage servers which
have at least one :producer and one :consumer.
- The GenStage flow is a link of succesive stages in which the consumer
ask for more items to process, applying back pressure to the next producer
(or :producer_consumer) which handles the demand as soon as it can.

The consumer is not supposed to ask more items until its demand is completely
fullfiled.

That means if consumer A ask for 10 items, and producer can handle only partially
the demand sending only 2 events, the producer has the obligation to send the remaining
8 as soon as it can and the consumer A is not going to ask anymore until its demand is met.

---

The problem:

Usually a producer produces events from an external source that notifies the producer
that there are more events.

In my case, I'm 'producing' events from rows in a database which is modified by
external agents that I don't know. So the only way to know if there's a new event (row)
to be 'produced' is to ask the database regularly.

```elixir
defmodule PublicationSelector do
  use GenStage
  @time_to_retry_pending_demand 50

  def start_link do
    GenStage.start_link(__MODULE__, :unused)
  end

  def init(_unused) do
    {:producer, 0}
  end

  def handle_demand(demand, _state) do
    dispatch(demand)
  end

  def handle_info(:dispatch_pending_demand, pending_demand) do
    dispatch(pending_demand)
  end

  defp dispatch(quantity) do
    {count, events} = DataSource.get_events(quantity)
    remaining_demand = quantity - count
    if remaining_demand > 0, do: Process.send_after(self(), :dispatch_pending_demand, @time_to_retry_pending_demand)
    {:noreply, events, remaining_demand}
  end
end
```

and a `DataSource.get_events(quantity)` as
```elixir
defmodule DataSource do
  def get_events(quantity) do
    # {count, events} = #DB select * from .. limit quantity
  end
end
```

which could internally use a Postgresql cursor, for instance.

The interesting part here is the `handle_info` function and the `Process.send_after`,
that's the official way in Elixir (see GenServer documentation) to run concurrent tasks.
