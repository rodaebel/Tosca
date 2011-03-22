%% @author Tobias Rodaebel
%% @doc Tosca Supervisor

-module(tosca_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% @doc Starts the supervisor.
%% @spec start_link() -> {ok, Pid} | ignore | {error, Reason}
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% @doc Initializes the supervisor.
%% @spec init(Args) -> {ok, {SupFlags, ChildSpecs}} | ignore | {error, Reason}
init([]) ->

    %% The server process listens for incoming UDP packets. It decodes
    %% received data and fires events containg the OSC message.
    Server = {
        tosca_server, {tosca_server, start_link, []},
	    permanent, 2000, worker, [tosca_server]},

    %% This is the event manager process.
    Event = {
        tosca_event, {gen_event, start_link, [{local, tosca_event}]},
        permanent, 2000, worker, dynamic},

    %% OSC handler module.
    {ok, Handler} = application:get_env(tosca, handler),

    %% Another server process takes over the role of a guard for our event
    %% handler and restarts it in case of an unexpected crash.
    Guard = {
        tosca_guard, {tosca_guard, start_link, [Handler]},
	    permanent, 2000, worker, [tosca_guard]},

    {ok, {{one_for_one, 3, 10}, [Server, Event, Guard]}}.
