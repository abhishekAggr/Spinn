// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');
var library = require('../library/userLibrary');
var moment = require('moment');
var multer = require('multer');

//update profile photo
router.post('/:userId',(req,res)=>{
    // logic
    var userId = req.params.userId;
    upload(req,res,(err)=>{
        if(err)
            res.status(500).send('Error');
        else {
            var path = 'uploads/'+req.file.filename;
            userModel.findOne({userId:userId},(err,doc)=>{
                if(err)
                    res.status(500).send(err);
                if(doc) {
                    doc.profile_picture = path;
                    doc.save();
                    res.status(201).send(`Updated successfully`);
                }
                else
                    res.status(404).send(`User does not exist`);
            })
        }
    });
});

//storage Engine
var storage = multer.diskStorage({
    destination: function(req,file,cb){
        cb(null,'uploads/')
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now()+'.jpg');
    }
  })

//File upload
var upload = multer({ storage: storage }).single('profilePic');

module.exports = router;