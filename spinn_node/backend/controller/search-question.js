// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var questionModel = require('../model/question-data');
var library = require('../library/userLibrary');
let userDoc={};
let userCorrectQuestions = [];
router.get('/:userId/:skillId',(req,res)=>{
    const userId = req.params.userId;
    const skillId = req.params.skillId; 
    let found = false;
    userModel.findOne({userId:userId},(err,doc)=>{
        if(err)
            res.status(500).send('Internal server error');
        if(doc) {
            userDoc = doc;
            doc.skill_set.forEach((element) => {
                if(JSON.stringify(element._id) == JSON.stringify(skillId)) {
                    let query = library.validQuery(element);
                    found = true;
                    questionModel.find((query),(err,result)=>{
                        // Questions found
                        if(result) {
                            let finalResult = [];
                            let length = userDoc.questions.correctQuestionId.length;
                            // Marking correct answers
                            for(let i=0;i<length;i++) {
                                userCorrectQuestions[userDoc.questions.correctQuestionId[i].questionId]=true;
                            }
                            // Ruling out correct answers
                            for(let j=0;j<result.length;j++) {
                                if(!userCorrectQuestions[result[j]._id])
                                    finalResult.push(result[j]);
                            }
                            res.status(200).send(finalResult);
                        }
                        if(!result)
                            res.status(404).send('No match found');
                    });
                }
            },
            );
            if(!found)
                res.status(404).send('Skill not found');
        }
        if(!doc)
            res.status(404).send('User not found');
        });
});

module.exports = router;