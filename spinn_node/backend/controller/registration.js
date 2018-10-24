// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var library = require('../library/userLibrary');
var moment = require('moment');
var SHA = require('crypto-js/sha256');
moment().format();

//register
router.post('/',(req,res,next)=>{ 
    let createdAt = moment();
    let updatedAt = moment();
    let status = 0;
    userModel.count({userId:req.body.userId},(err,count)=>{
        if(err)
            res.send(err);
        if(count>0) {
            res.send('user already exists');
        }
        else {
        let userObj = new userModel({
        createdAt: createdAt,
        updatedAt: updatedAt,
        userId: req.body.userId,
        password: req.body.password,
        status: status
    });
    userObj.save((error,user)=>{
        if(error)
            res.send(error);
        else 
            res.status(200).send('User successfully registered.');
    });
        }

    });
});

module.exports = router;


