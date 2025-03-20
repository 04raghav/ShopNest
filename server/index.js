//IMPORT form Packages
const express = require('express');
const mongoose = require('mongoose');
//IMPORT from Other files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin')

//INIT
const app = express();
const PORT = 3000;
const DB = "mongodb+srv://Raghav:Raghu%402112@cluster0.oal26.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
//if the password contains special char (eg @ ), then conert it to be url encoded
//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
//CLIENT ->middleware -> SERVER -> CLIENT

//Connections
mongoose.connect(DB).then(()=>{console.log("connection successful")}).catch((e)=>{console.log(e);});

app.listen(PORT,"0.0.0.0" ,()=>{
    console.log(`connected at ${PORT}`);
});
