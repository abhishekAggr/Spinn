// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var questionModel = require('../model/question-data');
var library = require('../library/userLibrary');
let userDoc={};
let userCorrectQuestions = [];
router.get('/:userId',(req,res)=>{
    const userId = req.params.userId;
    let found = false;
    userModel.findOne({userId:userId},(err,doc)=>{
        if(err)
            res.status(500).send('Internal server error. User not found!');
        if(doc) {
            userDoc = doc;
            console.log("userDoc: " + userDoc + ", userId:" + userId);
            let query = library.validUser(userDoc);
            found = true;
            questionModel.find((query),(err,result)=>{
                // Questions found
                if(result) {
                    res.status(200).send(result);
                }
                if(!result)
                    res.status(404).send('No match found');
                });
            if(!found)
                res.status(404).send('Skill not found');
        }
        if(!doc)
            res.status(404).send('User not found');
        });
});

module.exports = router;