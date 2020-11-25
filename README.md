# terraform-aws-counter-strike-go

Terraform code for Counter Strike dedicated server on AWS

## HOW TO USE?

1. Create a Game Server Login Token.\
Open https://steamcommunity.com/dev/managegameservers in your browser and login with your steam account.\
Create a new Login Token with the APP ID of `730` (Counter String GO Game) and add a Memo so you can remember
where you are using this game token.

![steam token](steam_token.png "Token")

Save the token, you'll need it later to setup the instance.

2. Create an user on AWS and configure these environment variables accordingly:
```
AWS_SECRET_ACCESS_KEY
AWS_ACCESS_KEY_ID
```

3. `terraform init`
4. `terraform plan`
5. `terraform apply --var "token=STEAM_TOKEN"`

## How To SSH Into The Server?
Terraform will create the `id_rsa` and `id_rsa.pub` ssh keys to be used to access the instance.

The instance will be created with a public IP assocciated and will output it in the end. To access the instance
you should execute `ssh ubuntu@PUBLIC_IP -i id_rsa` changing *PUBLIC_IP* accordingly.\

## How To Connect To The Server From CSGO?
Open your terminal and type `connect PUBLIC_IP` changing *PUBLIC_IP* accordingly.


## TODO
- Implement Telegram or Discord notifications, see [Alerts](https://docs.linuxgsm.com/alerts)
- Remove Bots from the server on startup
- Any other ideas are welcome
