// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var library = require('../library/userLibrary');

router.get('/:userId/:password',(req,res)=>{
    const userId = req.params.userId;
    const password = req.params.password;
    userModel.findOne({userId:userId},(err,doc)=>{
        if(err)
            res.status(500).send('Error fetching data');
        if(doc) {
            if(JSON.stringify(doc.password) == JSON.stringify(password))
                res.status(200).send(doc);
            else
                res.status(500).send(`wrong username or password`);
        }
        else
            res.status(404).send(`User not found`);
});
});
module.exports = router; 