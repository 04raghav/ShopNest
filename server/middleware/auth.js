const jwt = require('jsonwebtoken');

const auth = async (req,res,next)=>{
    try{
        const token = req.header();
        if(!token)
            return res.status(401).json({msg:"No token provided,access denied!"}
        )
        const verified = jwt.verify(token, "passwordKey");
        if(!verified) return res.status(400).json({msg:"Token Verification failed,access denied!"}); 
        req.user = verified.id;
        req.token = token;
        next();   
    }
    catch(err){
        res.status(500).json({error:err.message});
    }
}
module.exports = auth