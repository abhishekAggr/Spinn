// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var questionModel  = require('../model/question-data');
var paperModel = require('../model/paper-data');

router.delete('/:paperId/:questionId',(req,res)=>{
    const paperId = req.params.paperId;
    const questionId = req.params.questionId;
    paperModel.findOne({_id:paperId},(err,doc)=>{
        if(doc) {
            let flag = false;
            let i=0;
            doc.question.forEach(element => {
                i++;
                if(element._id == questionId) {
                    doc.question.splice(i-1,1);
                    flag = true;
                    console.log(doc);
                }
            });
            if(!flag)
                res.status(404).send('Question not found');
            else {
                doc.save();
                res.status(200).send('Deleted successfully');
            }
        }
        if(!doc)
            res.status(404).send('Paper not found');
    });
});

module.exports = router;