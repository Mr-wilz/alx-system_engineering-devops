# PROJECT: FIREWALL

In this project, I used `ufw` to configure firewalls on my issued web servers.

## AUTHOR'S DETAILS:
### Name: Wilfort Abel
### Email: [juiciwhilf@gmail.com](mailto:juiciwhilf@gmail.com)
### Tel: +2347061251386

## Tasks :page_with_curl:

* **0. Block all incoming traffic but**
  * [0-block_all_incoming_traffic_but](./0-block_all_incoming_traffic_but): Bash
  script that installs a `ufw` firewall to block all incoming traffic except for
  ports `22`, `443` and `80` on a web server.

* **1. Port forwarding**
  * [100-port_forwarding](./100-port_forwarding): `ufw` configuration file that
  configures a firewall to redirect port `8080/TCP` to port `80/TCP`.
