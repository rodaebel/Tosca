%% @author Tobias Rodaebel
%% @doc Tosca Entry Point

-module(tosca).

-export([start/0, stop/0]).

%% @doc Starts the server.
%% @spec start() -> ok | {error, Reason}
start() ->
    application:start(tosca).

%% @doc Stops the server.
%% @spec stop() -> ok
stop() ->
    application:stop(tosca).
