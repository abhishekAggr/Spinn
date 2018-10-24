// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel = require('../model/user-data');
var paperModel  = require('../model/paper-data');
var moment = require('moment');

router.put('/:paperId',(req,res)=>{
    paperModel.findOne({_id:req.params.paperId},(err,doc)=>{
        if(doc)
        {
            doc.name = req.body.name;
            doc.save();
            res.status(200).send('Edited successfully');
        }
        if(!doc)
            res.status(404).send('Paper not found');
    });
});

module.exports = router;
