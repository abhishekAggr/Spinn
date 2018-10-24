// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

router.get('/:userId',(req,res)=>{
    const userId = req.params.userId;
    userModel.findOne({userId:userId},(err,doc)=>{
    if(err)
        res.status(500).send('Internal server error');
    if(doc) 
            res.status(200).send(doc.skill_set);
    else
        res.status(404).send('User not found');
    });
});

module.exports = router;