// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var questionModel  = require('../model/question-data');
router.put('/:questionId',(req,res)=>{
    var newValues = {$set: {role:req.body.role,question:req.body.question,answer:req.body.answer,class:req.body.class,
    subject:req.body.subject,chapter:req.body.chapter,topic:req.body.topic,option_1:req.body.option_1,
    option_2:req.body.option_2,option_3:req.body.option_3,option_4:req.body.option_4,reference_1:req.body.reference_1,
    reference_2:req.body.reference_2,reference_3:req.body.reference_3,reference_4:req.body.reference_4}};
    questionModel.updateOne({_id:req.params.questionId},newValues,(err,result)=>{
        if(err)
            res.status(404).send('Not found');
        else
            res.send('Updated successfully');
    });
});
module.exports = router;