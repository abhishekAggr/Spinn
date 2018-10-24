// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var questionModel  = require('../model/question-data');
var paperModel = require('../model/paper-data');

router.post('/:paperId/:questionId',(req,res)=>{
    const paperId = req.params.paperId;
    const questionId = req.params.questionId;
    paperModel.findOne({_id:paperId},(err,doc)=>{
        //     res.status(500).send('Internal server Error');
        if(doc) {
            questionModel.findOne({_id:questionId},(err,question)=>{
                // if(err)
                //     res.status(500).send('Internal server Error');
                if(question) {
                    console.log(doc);
                    doc.question.push(question);
                    doc.save();
                    res.status(200).send('Question added successfully');
                }
                if(!question)
                    res.status(500).send('Question not found');
            });
        }
        if(!doc)
            res.status(500).send('Paper not found');
    });
});

module.exports = router;