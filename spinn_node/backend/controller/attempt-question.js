// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var questionModel = require('../model/question-data');
var moment = require('moment');
router.get('/:userId/:questionId/:skillId/:answer',(req,res)=>{
    const userId = req.params.userId;
    const questionId = req.params.questionId;
    const skillId = req.params.skillId;
    const answer = req.params.answer;
    let index = 0;
    let attempted = 0;
    let correctAttempted = 0;
    let initialWrongAttempt = 1;
    let wrongAttempt = 0;
    let correct = false;
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
                res.status(500).send('Internal server Error');
            if(user) {
                attempted++;
                //correct answer
                if(question.answer == answer)
                {
                    let i = 0;
                    // checking for wrong attempts
                    user.questions.wrongQuestionId.forEach(element => {
                        i++;
                        if(element.questionId == questionId) {
                            wrongAttempt = element.attemptNumber;
                            user.questions.wrongQuestionId.splice(i-1,1);
                        }
                     });

                    correctAttempted++;
                    user.questions.correctQuestionId.push({
                        questionId: questionId,
                        attemptTime: moment(),
                        wrongAttempts: wrongAttempt
                    });
                    correct = true;
                }
                //wrong answer
                else
                {
                    let flag=0;
                    user.questions.wrongQuestionId.forEach(element => {
                        if(element.questionId == questionId) {
                             flag=1;
                             element.attemptNumber+=1;      //incrementing no. of wrong attempt toll
                        }
                     });
                     if(!flag) {
                         user.questions.wrongQuestionId.push({
                            questionId: questionId,
                            attemptTime: moment(),
                            attemptNumber: initialWrongAttempt     //wrong attempt
                         });
                     }
                }
                let length = user.skill_set.length;
                while(index<length) {
                    if(user.skill_set[index]._id == skillId)
                    {
                        user.skill_set[index].stats.attempted+=1;
                        if(correct)
                            user.skill_set[index].stats.correct+=1;
                    }
                    index++;
                }
                user.save();
                if(correct)
                    res.status(200).send('Congrats correct answer');
                else
                    res.status(200).send('Oops Wrong answer');
            }
            //user not found
            if(!user)
                 res.status(404).send('User not found');
            });
        
        }
    });
});
       
 module.exports = router;