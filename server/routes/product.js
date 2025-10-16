const express = require('express');
const productRouter = express.Router();
const auth = require('../middleware/auth');
const { Product } = require('../models/product');

//api/products?category=Essentials, req.query accesses after ? and req.params accesses after : 
productRouter.get("/api/products",auth,async(req,res)=>{
    try{
        const products  = await Product.find({category: req.query.category});
        res.json(products);
    }
    catch(e){
        return res.status(500).json({ error: e.message });

    }
})


//req.params is used to access something after :
productRouter.get("/api/products/search/:name",auth,async(req,res)=>{
    try{
        const products  = await Product.find({
            name: { $regex: req.params.name, $options: "i"} });
        res.json(products);
    }
    catch(e){
        return res.status(500).json({ error: e.message });

    }
})


//ratings = [{productId:"abc",rating:2},{productId:"abcd",rating:5},...]
productRouter.post("/api/rate-product",auth,async(req,res)=>{
    try{
        const { id,rating } = req.body;
        let product = await Product.findById(id);
        for(let i=0;i<product.ratings.length;i++){
            if(product.ratings[i].userId==req.user){//req.user gives the userId accessible through auth middleware
                product.ratings.splice(i,1)
                break
            }
        }

        const ratingSchema={
            userId : req.user,
            rating : rating
        }

        product.ratings.push(ratingSchema);
        product = await product.save();
        res.json(product);
    }
    catch(e){
        return res.status(500).json({ error: e.message });
    }
})

productRouter.get("/api/deal-of-day",auth,async(req,res)=>{

    try{
        let products = await Product.find({});
        if (!products.length) {
            return res.status(404).json({ error: "No products available" });
        }
        products=products.sort((p1,p2)=>{
        p1Sum=0
        p2Sum=0

        for(let i=0;i<p1.ratings.length;i++){
            p1Sum+=p1.ratings[i].rating
        }
        for(let i=0;i<p2.ratings.length;i++){
            p2Sum+=p2.ratings[i].rating
        }

        return p1Sum < p2Sum ? 1 : -1
        
    })
    res.json(products[0])

    }
    catch(e){
        return res.status(500).json({ error: "hello" });

    }
    
})

module.exports=productRouter;