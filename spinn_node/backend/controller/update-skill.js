// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

router.put('/:userId/:skillId',(req,res)=>{
        const userId = req.params.userId;
        role = req.body.role,
        clas = req.body.class,
        subject = req.body.subject,
        chapter = req.body.chapter,
        topic = req.body.topic
    userModel.findOne({userId:userId},(err,doc)=>{
        let flag=0;
        if(err)
            res.status(500).send('Internal server error');
        if(doc)
            {
                doc.skill_set.forEach(element => {
                    if(JSON.stringify(element._id) == JSON.stringify(req.params.skillId))
                    {
                        element.role = role;
                        element.class = clas;
                        element.subject = subject;
                        element.chapter = chapter;
                        element.topic = topic;
                        doc.save();
                        flag=1;
                    }
                });
                if(flag)
                    res.status(200).send('Updated successfully');
                else
                res.status(404).send('Skill not found');
            }
        else
            res.status(404).send('User not found');
    });
});
module.exports = router;
