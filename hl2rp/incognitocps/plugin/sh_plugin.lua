local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

Clockwork.config:ShareKey("cp_id_length");
Clockwork.config:ShareKey("hide_cp_identities");