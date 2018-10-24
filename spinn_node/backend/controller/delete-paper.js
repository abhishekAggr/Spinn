// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var paperModel  = require('../model/paper-data');

router.delete('/:paperId',(req,res)=>{
    paperModel.deleteOne({_id:req.params.paperId},(err)=>{
        if(err)
            res.status(500).send('Paper not found');
        else
            res.status(200).send('Deleted successfully');
        });
});

module.exports = router;
