// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

router.post('/:userId',(req,res)=>{
    userModel.findOne({userId:req.params.userId},(err,doc)=>{
        if(doc) {
            doc.Office_address.Line_1 = req.body.Line_1;
            doc.Office_address.Line_2 = req.body.Line_2;
            doc.Office_address.zip = req.body.zip;
            doc.Office_address.city = req.body.city;
            doc.Office_address.state = req.body.state;
            doc.save();
            res.send('Address updated successfully');
        }
        if(!doc)
            res.status(404).send('User does not exist');
        else
            res.send(500).send('Internal server error');     
    });
});
module.exports = router;