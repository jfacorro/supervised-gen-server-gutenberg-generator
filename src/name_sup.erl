-module({{NAME}}_sup).

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

%% admin api
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, {}).

%% behaviour callbacks
init({}) ->
    GenServerSpec =
        {{{NAME}}_server,
         {{{NAME}}_server, start_link, []},
         permanent,
         5000,
         worker,
         [{{NAME}}_server]
        },
    {ok,
     {
       {one_for_one, 5, 10},
       [GenServerSpec]
     }
    }.
