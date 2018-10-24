// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var paperModel  = require('../model/paper-data');

router.get('/:paperId',(req,res)=>{
    paperModel.find({_id:req.params.paperId},(err,doc)=>{
        if(doc)
            res.status(200).send(doc);
        else
            res.status(500).send('Paper not found');
    });
});

module.exports = router;
