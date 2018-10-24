// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

router.delete('/:userId',(req,res)=>{
    //logic
    let userId = req.params.userId;
    userModel.findOne({userId:userId},(err,doc)=>{
    if(err)
        res.status(500).send(err);
    else {
            userModel.findOne({userId:userId},(err,doc)=>{
                if(err)
                    res.status(500).send(err);
                if(doc) {
                    doc.status = 0;
                    doc.save();
                    res.status(200).send(`User deactivated successfully`);
                }
                else
                    res.status(404).send(`User does not exist`);
        });
        }
    });
});

module.exports = router;