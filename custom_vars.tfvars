# Insert here your steam token
token               = "MYTOKEN"
region              = "eu-west-2"
security_group_name = "main"
instance_type       = "m5.large"
# These tags provide more information on server, it's recommended to use it
password = ""
tags     = ""
logging  = "off" # Disabled by default to save IOPS

# See README.md "Change Game Mode" Section
game_type = 0
game_mode = 1
map_group = "mg_active, mg_reserves, mg_hostage, mg_de_dust2"

default_map = "de_mirage"
max_players = "10"

# AWS EBS
ebs_disk_size = 40 # disk size in GB