// Required libraries
var express = require('express');
var router = express.Router();
var app = express();
var userModel  = require('../model/user-data');

router.put('/',(req,res)=>{
    var userId = req.body.userId;
    var otp = req.body.otp;
    userModel.findOne({userId:userId},(err,doc)=>{
        if(doc) {
            if(otp===doc.otp) {
                doc.status = 1;
                doc.otp = "";
                doc.save();
                res.status(200).send('Status updated successfully');
            }
            else
                res.status(500).send('Wrong OTP');
        }
        else
            res.status(404).send('Wrong User id');
        if(err)
            res.status(500).send('Internal server error');
    });
});

module.exports = router;

/**
        * @swagger
         * /:
         * post:
         * tags: 
         *       - Register
         *     description: Registers new user
         *     security:
         *       - ApiKeyAuth: []
         *     produces:
         *       - application/json
         *     parameters:
         *       - name: userObj
         *         in: body
         *         required: true
         *         schema:
         *           $ref: '#/definitions/register'
         *     responses:
         *       200:
         *         description: Successfully created
         */
/**
 * @swagger
 * definitions:
 *   RegisterUser:
 *     type: object
 *     required:
 *       - username
 *       - password
 *     properties:
 *       username:
 *         type: string
 *       password:
 *         type: string
 */