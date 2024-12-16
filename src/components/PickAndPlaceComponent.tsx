import React from 'react';
import { Container, Grid, TextField, Button } from '@mui/material';
import { NovaClient, ProgramStateConnection } from "@wandelbots/wandelbots-js"
import PickAndPlaceScript from "./pickAndPlace.ws"
import AnimatedBackground from "./../templates/Placeholder/AnimatedBackground"

const nova = new NovaClient({
    // Read instance url from .env file
    instanceUrl: "http://10.175.1.182/",
    cellId: "cell",
    username: "wb",
    password: "mywandelbox"
})

const PickAndPlaceComponent: React.FC = () => {
    return (
        <Container>
            <AnimatedBackground />
            <Grid container spacing={3} style={{ marginTop: '20px' }}>
                <Grid item xs={4}>
                    <TextField
                        id = "item1"
                        label="Input Quantity of Item #1"
                        type="number"
                        variant="outlined"
                        fullWidth
                        inputProps={{ min: 0, max: 3 }}
                    />
                </Grid>
                <Grid item xs={4}>
                    <TextField
                        id = "item2"
                        label="Input Quantity of Item #2"
                        type="number"
                        variant="outlined"
                        fullWidth
                        inputProps={{ min: 0, max: 3 }}
                    />
                </Grid>
                <Grid item xs={4}>
                    <TextField
                        id = "item3"
                        label="Input Quantity of Item #3"
                        type="number"
                        variant="outlined"
                        fullWidth
                        inputProps={{ min: 0, max: 3 }}
                    />
                </Grid>
            </Grid>
            <Grid container spacing={3} style={{ marginTop: '20px' }}>
                <Grid item xs={4}></Grid>
                <Grid item xs={4} style={{ textAlign: 'center' }}>
                    <Button 
                        id="fillOrderButton"
                        variant="contained" 
                        color="primary" 
                        onClick={handleFillOrder}
                    >
                        Fill Order
                    </Button>
                </Grid>
                <Grid item xs={4}></Grid>
            </Grid>
        </Container>
    );
};

function handleFillOrder(){
    // Check if at least one of the items has a value greater than 0
    // If so, call the pick and place function
    const item1Value:number = parseInt((document.getElementById("item1") as HTMLInputElement)?.value || '0', 10);
    const item2Value:number = parseInt((document.getElementById("item2") as HTMLInputElement)?.value || '0', 10);
    const item3Value:number = parseInt((document.getElementById("item3") as HTMLInputElement)?.value || '0', 10);

    if (item1Value > 0 || item2Value > 0 || item3Value > 0){
        (document.getElementById("fillOrderButton") as HTMLButtonElement).innerText = "Filling Order...";
        let runner = new ProgramStateConnection(nova);
        runner.executeProgram(PickAndPlaceScript, {
            num_product_1: item1Value,
            num_product_2: item2Value,
            num_product_3: item3Value
        });
    }
    else{
        // Change the color of the button to red to indicate that the user must choose at least one item
        (document.getElementById("fillOrderButton") as HTMLButtonElement).style.backgroundColor = "red";
        // Change the text of the button
        (document.getElementById("fillOrderButton") as HTMLButtonElement).innerText = "Choose at least one item";

        // Change the color back to the original color after 3 seconds
        setTimeout(() => {
            (document.getElementById("fillOrderButton") as HTMLButtonElement).style.backgroundColor = "";
            (document.getElementById("fillOrderButton") as HTMLButtonElement).innerText = "Fill Order";
        }, 4000);

    }
}

export default PickAndPlaceComponent;