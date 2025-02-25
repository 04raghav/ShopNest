const express = require('express');
const bcryptjs = require("bcryptjs");
const User = require('../models/user');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');
const authRouter = express.Router();
authRouter.post('/api/signup',async (req,res)=>{
    try{
        //get the data from the client
    const {name,email,password} = req.body;
    
    const existingUser = await User.findOne({ email });
    if (existingUser) {
        return res.status(400).json({msg : "User with same email exisits"})
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    //here 8 is the salt
    let user = new User({
        email,
        password:hashedPassword,
        name,
    })

    user = await user.save();
    res.json(user);
    //post the data in database
    //return the data to the user
    }
    catch(e){
        res.status(500).json({error:e.message})
    }
    

});

authRouter.post('/api/signin',async (req,res)=>{
    try{
        const {email,password} = req.body;
        const user = await User.findOne({ email });
        if(!user){
            return res.status(400).json({msg:'User does not exist'});  
        }
        const isMatch = await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg:'Incorrect Password'})
        }
        const token = jwt.sign({id: user._id},"passwordKey");
        res.json({token,...user._doc});
    }
    catch(e){
        res.status(500).json({error:e.message})
    }
});

authRouter.post("/tokenIsValid" , async (req,res)=>{
    try{
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
        const verified = jwt.verify(token, 'passwordKey');
        if(!verified) return res.json(false);
        
        const user = await User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);

    }
    catch(e){
        res.status(500).json({error:e.message});

    }

});

//getting the user data
authRouter.get('/',auth, async (req,res)=>{
    const user = await User.findById(req.user);
    res.json({...user._doc,token:req.token});
    //... operator is used to extract all key value pairs, by this query the clean user doc + token will be given
})
//all the variables are private to this file so exporting the variable
module.exports = authRouter