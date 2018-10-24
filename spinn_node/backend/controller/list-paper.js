// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var paperModel  = require('../model/paper-data');

router.get('/',(req,res)=>{
    paperModel.find({},(err,doc)=>{
        if(err)
            res.status(500).send('Internal server error');
        if(doc)
        {
            res.status(200).send(doc);
        }
    });
});

module.exports = router;
