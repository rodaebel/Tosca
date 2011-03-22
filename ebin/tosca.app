%% -*-Erlang-*-
{application, tosca,
 [{description, "Open Sound Control Server/Dispatcher"},
  {vsn, "1.0.0"},
  {modules, [tosca_app, tosca_sup, tosca_server, tosca_handler, tosca_guard,
             osc_lib]},
  {registered, [tosca_sup, tosca_server, tosca_guard]},
  {applications, [kernel, stdlib]},
  {mod, {tosca_app, []}},
  {env, [{ip,any}, {incoming_port,7000}, {outgoing_port,7124},
         {recbuf,8192}, {handler,tosca_handler}]}
 ]}.
%% vim: set filetype=erlang :
