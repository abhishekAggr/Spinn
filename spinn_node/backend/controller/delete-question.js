// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var questionModel  = require('../model/question-data');

router.delete('/:id',(req,res)=>{
    questionModel.deleteOne({_id:req.params.id},(err)=>{
        if(err)
            res.send('Question does not exists');
        else
            res.send('successfully deleted');
    })
});

module.exports = router;