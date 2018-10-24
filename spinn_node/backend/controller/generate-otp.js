// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var library = require('../library/userLibrary');

router.get('/:userId',(req,res)=>{
    const userId = req.params.userId;
    userModel.findOne({userId:userId},(err,doc)=>{
        if(err)
            res.status(500).send('Internal server error');
        if(doc)
        {
            var otp = library.otp();
            library.sendOtp(userId,otp);
            doc.otp = (otp);
            doc.save();
            res.status(200).send('OTP sent');
        }
        else
            res.status(404).send('User not found');
    });
});
module.exports = router;
