// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var questionModel  = require('../model/question-data');
var paperModel = require('../model/paper-data');

router.get('/:paperId',(req,res)=>{
    paperModel.findOne({_id:req.params.paperId},(err,doc)=>{
        if(doc) 
            res.status(200).send(doc.question);
        if(!doc)
            res.status(404).send('Question Not found');
        else
            res.status(500).send('Internal server error');
        
    });
});

module.exports = router;