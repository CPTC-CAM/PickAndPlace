# Pick and Place App
This repo uses Wandelbots NOVA to create a pick and place application. App interface uses
TypeScript and React. The UR5-cb3 robot uses Wandelscript to send commands

## Installing dependencies

App developed using VS Code

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