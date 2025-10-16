//IMPORT from Packages
const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config(); // load env vars from render

//IMPORT from Other files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

//INIT
const app = express();
const PORT = process.env.PORT || 3000;
const DB = process.env.MONGO_URI;

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//Database Connection
mongoose.connect(DB)
  .then(() => console.log("✅ MongoDB connection successful"))
  .catch((e) => console.log("❌ MongoDB connection error:", e));

//Start Server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
