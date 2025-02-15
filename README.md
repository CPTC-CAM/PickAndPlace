# Pick and Place App
This repo uses Wandelbots NOVA to create a pick and place application. App interface uses
TypeScript and React. The UR5-cb3 robot uses Wandelscript to send commands

This app was built with
- NOVA 28.8.1
- Nvidia Omniverse and Isaac Sim 4.1

## Installing NOVA
To create an app, a local or cloud hosted instance of NOVA must be available. Installing
a local instance of NOVA via Hyper-V is proven to work
- Download .ISO from Wandelbots developer portal
- Create a VM that meets the [Requirements](https://docs.wandelbots.io/24.8/installation/#virtual-machines-and-physical-instances--ipcs). **NO DYNAMIC MEMORY on the VM**
- After the initial install and first restart, shut down VM and remove the .ISO to prevent getting stuck in an infinite install loop

## Installing app dependencies

App developed using VS Code. Follow instructions in Wandelbots DEV portal.

Create the template app by running `nova app create yourAppNameHere`. *Must have NOVA CLI tools installed and added to PATH variable*

To install the dependencies, run: `npm install`
in the VS Code terminal

## Connecting to an existing instance
Add credentials in .env file to connect to cloud hosted
or local NOVA virtual machine

```
WANDELAPI_BASE_URL=http://my.instance.wandelbots.io
CELL_ID=cell
NOVA_USERNAME="wb"
NOVA_PASSWORD="password"
```

## Running the dev server

Once everything is set up, you can run the NextJS dev server with `npm run dev`

Terminal window will provide the local url to connect to via the web browser

## Deploy the App
Apps can be deployed via Docker by following the [official instructions](https://docs.wandelbots.io/24.8/typescript/deploy-robot/)

## Simulation via Isaac Sim
Our current simulation scene is located in the [Wiki](https://github.com/CPTC-CAM/PickAndPlace/wiki/Initial-Development-%E2%80%90-Omniverse-Scene)

## Resources
Robot positions and schematics - https://github.com/CPTC-CAM/PickAndPlace/wiki/Diagrams

## Handy commands
To get IP address of Hyper-V VMs, run in admin Powershell

 `get-vm | ?{$_.State -eq "Running"} | select -ExpandProperty networkadapters | select vmname, macaddress, switchname, ipaddresses | ft -wrap -autosize`
