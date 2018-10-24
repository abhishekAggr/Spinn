// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var questionModel = require('../model/question-data');

router.get('/:userId/:questionId/:answer',(req,res)=>{
    const userId = req.params.userId;
    const questionId = req.params.questionId;
    const answer = req.params.answer;
    questionModel.findOne({_id:req.params.questionId},(err,question)=>{
        //Error
        if(err)
            res.status(500).send('Question not found');
        // if question exists
        if(question) {
            //searching for user
            userModel.findOne({userId:userId},(err,user)=>{
            // if user exists
            if(err)
                res.send('not');
            if(user) {
                //check for answer
                //correct answer
                if(question.answer == answer)
                {
                    console.log('correct');
                    let i=0;
                    user.questions.correctQuestionId.push(questionId);
                    user.questions.wrongQuestionId.forEach(element => {
                        i++;
                        console.log(i);
                        if(element == questionId) {
                            user.questions.wrongQuestionId.splice(i-1,1);
                            console.log('deleted');
                        }
                     });
                    user.save();
                    res.status(200).send('Congrats correct answer');
                }
                //wrong answer
                else
                {
                    let flag=0;
                    user.questions.wrongQuestionId.forEach(element => {
                        if(element == questionId)
                             flag=1;
                     });
                     if(!flag) {
                         user.questions.wrongQuestionId.push(req.params.questionId);
                         user.save();
                     }
                     res.status(200).send('Oops Wrong answer');
                }
            }

            // //user not found
            if(!user)
                 res.status(404).send('User not found');
            });
        
        }
        //question not found
        // else 
        //     res.status(404).send('Question not found');
    });
});
       
 module.exports = router;