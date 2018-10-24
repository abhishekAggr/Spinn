// defining express pre-requisities
var express = require('express');
var cors = require('cors');
var path = require('path'); 
var router = express.Router();
var addPaper = require('../controller/add-paper');
var editPaper = require('../controller/edit-paper');
var deletePaper = require('../controller/delete-paper');
var listPaper = require('../controller/list-paper');
var viewPaperById = require('../controller/view-paper-by-id');
var addquestionToPaper = require('../controller/add-question-to-paper');
var deleteQuestionFromPaper = require('../controller/delete-question-from-paper');
var listQuestionFromPaper = require('../controller/list-question-from-paper')
var app = express();

router.use('/addPaper',addPaper);
router.use('/listPaper',listPaper);
router.use('/editPaper',editPaper);
router.use('/deletePaper',deletePaper);
router.use('/viewPaperById',viewPaperById);
router.use('/addQuestionToPaper',addquestionToPaper);
router.use('/listQuestionFromPaper',listQuestionFromPaper);
router.use('/deleteQuestionFromPaper',deleteQuestionFromPaper)
module.exports = router;