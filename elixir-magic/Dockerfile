FROM elixir:1.6.6-alpine

ENV MIX_ENV=prod PORT=4000
WORKDIR /var/code

COPY mix.exs mix.exs
COPY mix.lock mix.lock

RUN mix local.hex --force
RUN mix deps.get --only prod
RUN mix local.rebar --force
RUN mix compile

ADD . .
RUN mix compile

CMD mix phx.server
