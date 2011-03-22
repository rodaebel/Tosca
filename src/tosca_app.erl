%% @author Tobias Rodaebel
%% @doc Tosca Open Sound Control Server/Dispatcher Application

-module(tosca_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% @doc Starts the application.
%% @spec start(StartType, StartArgs) -> {ok, Pid} |
%%                                      {ok, Pid, State} |
%%                                      {error, Reason}
%%      StartType = normal | {takeover, Node} | {failover, Node}
%%      StartArgs = term()
start(_StartType, _StartArgs) ->
    tosca_sup:start_link().

%% @doc Stops the application.
%% @spec stop(State) -> ok
stop(_State) ->
    ok.
