// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel = require('../model/user-data');
var paperModel  = require('../model/paper-data');
var moment = require('moment');

router.post('/:userId/:skillId',(req,res)=>{
    let createdAt = moment();
    let createdBy = req.params.userId;
    let skill = req.params.skillId;
    let paperObj = new paperModel({
        createdAt: createdAt,
        createdBy: createdBy,
        name: req.body.name,
        tags: req.body.tags,
        skill_reference: req.params.skillId
    });
    paperObj.save().then((doc)=>{
        if(doc)
            res.status(200).send('Paper created successfully');
        else
            res.status(500).send('Error');
    });
});

module.exports = router;
