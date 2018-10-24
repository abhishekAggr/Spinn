// defining express pre-requisities
var express = require('express');
var cors = require('cors');
var path = require('path'); 
var router = express.Router();
var addQuestion = require('../controller/add-question');
var viewQuestion = require('../controller/view-question');
var removeQuestionById = require('../controller/delete-question');
var modifyQuestionById = require('../controller/update-question');
var searchQuestion = require('../controller/search-question');
var attemptQuestion = require('../controller/attempt-question');
router.use('/addQuestion',addQuestion);
router.use('/viewQuestion/',viewQuestion);
router.use('/deleteQuestion/',removeQuestionById);
router.use('/updateQuestion',modifyQuestionById);
router.use('/searchQuestion',searchQuestion);
router.use('/attemptQuestion',attemptQuestion);
module.exports = router;
