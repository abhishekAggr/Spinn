// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

router.delete('/:userId/:id',(req,res)=>{
    const userId = req.params.userId;
    const id = req.params.id;
    let flag=0;
    userModel.findOne({userId:userId},(err,doc)=>{
        if(err)
            res.status(500).send('error');
        if(doc) {
            doc.skill_set.forEach(element => {
                if(JSON.stringify(element._id) == JSON.stringify(id)) {
                    doc.skill_set.remove({_id:id});
                    doc.save();
                    flag=1;                        }
            });
        if(flag)
            res.status(200).send('Removed successfully');
        else    
            res.status(404).send('skill not found')
        }
        else
            res.status(404).send('User does not exist');
    });
});
module.exports = router;