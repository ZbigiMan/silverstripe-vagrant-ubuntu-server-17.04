# silverstripe-vagrant-ubuntu-server-17.04
Installing SilverStripe on xenji/ubuntu-17.04-server via vagrant

## Dependecies

Install [vagrant](https://www.vagrantup.com/downloads.html) 

## Installing
```bash
    git clone https://github.com/ZbigiMan/silverstripe-vagrant-ubuntu-server-17.04
    cd silverstripe-vagrant-ubuntu-server-17.04
    
    vagrant up --provistion 
```

#### Open http://localhost:8080

## Config

#### _config/apache2.conf - Apache2 configuration
[Read more about SilverStripe server requirements](https://docs.silverstripe.org/en/3/getting_started/server_requirements/)

#### _config/_ss_environment.php - Silverstripe environment 
[Read more about SilverStripe environment menagment](https://docs.silverstripe.org/en/3/getting_started/environment_management/)

