// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var questionModel  = require('../model/question-data');

router.get('/:questionId',(req,res)=>{
    questionModel.find({_id:req.params.questionId},(err,doc)=>{
        if(doc)
            res.status(200).send(doc);
        res.status(404).send('Not exist');
    });
});
module.exports = router;