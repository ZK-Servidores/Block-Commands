#include <sourcemod>

char g_sLogs[PLATFORM_MAX_PATH + 1];

public Plugin myinfo =
{
	name 		= 	"[ ZK Servidores™ ] - Block Commands",
	author 		= 	"Geison, crashzk",
	description	=	"Blocks commands sent on the server console to crash or cause bugs",
	version 	= 	"1.0",
	url 		= 	"https://github.com/zkservidores-clientes"
}

public OnPluginStart()
{
	RegConsoleCmd("pause", Command_Block);
	RegConsoleCmd("cmd pause", Command_Block);
	RegConsoleCmd("cmd unpause", Command_Block);
	RegConsoleCmd("survival_equip", Command_Block);
	
	BuildPath(Path_SM, g_sLogs, sizeof(g_sLogs), "logs/blockcommands.log");
}

public Action:Command_Block(client, args)
{
	LogToFile (g_sLogs, "%L tentou crashar o servidor.", client);
	PrintToServer("%L tentou crashar o servidor.", client);
	
	return Plugin_Stop;
}
