variable token {
  description = "Steam Token. See README.md"
}

variable region {
  description = "AWS Region"
}

variable security_group_name {
  description = "AWS Security Group name"
}

variable instance_type {
  description = "AWS Instance Type"
}

variable password {
  description = "CSGO Server Password (RCON and Private)"
}

variable tags {
  description = "Custom tags to add to the server as a string separated by comma. E.G.: myserver, csgo"
}

variable logging {
  description = "Enabled logging to the file, console, and udp <on | off>"
}

variable game_type {
  description = "Game Type. Default Competitive. See README.md"
  default     = 0
}

variable game_mode {
  description = "Game Mode. Default Competitive. See README.md"
  default     = 1
}

variable map_group {
  description = "Map Group to use.. See README.md"
}

variable default_map {
  description = "Default Initial Map"
}

variable max_players {
  description = "Max Allowed Players"
}
