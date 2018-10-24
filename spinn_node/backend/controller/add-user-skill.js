// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

router.post('/:userId',(req,res)=>{
    const userId = req.params.userId;
    let skillObj = {
        role: req.body.role,
        class: req.body.class,
        subject: req.body.subject,
        chapter: req.body.chapter,
        topic: req.body.topic
    };
    userModel.findOne({userId:userId},(err,doc)=>{
        if(err)
            res.status(500).send('Internal server error');
        if(doc) {
        doc.skill_set.push(skillObj);
        doc.save();
        res.status(200).send('skill added successfully'); 
        }
        else
            res.status(404).send('User does not exist');
    });
});
module.exports = router;