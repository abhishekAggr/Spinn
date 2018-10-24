// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

//update profile
router.put('/:userId',(req,res)=>{
    // logic
    let userId = req.params.userId;
    if(req.body.firstName == "" || req.body.DOB == "")
        res.send('username and DOB required');
    else {
        first_name = req.body.firstName,
        last_name = req.body.lastName,
        gender = req.body.gender,
        DOB = req.body.DOB
        userModel.findOne({userId:userId},(err,doc)=>{
            if(err)
                res.status(500).send(err);
            if(doc) {
                if(doc.status == 0)
                    res.status(200).send('user not active');
                else
                    {
                        doc.first_name = first_name;
                        doc.last_name = last_name;
                        doc.last_name = last_name;
                        doc.DOB = DOB;
                        doc.save();
                        res.send('Profile updated successfully');
                    }
            }
            else
                res.status(404).send(`User does not exist`); 
        });
    }
});

module.exports = router;