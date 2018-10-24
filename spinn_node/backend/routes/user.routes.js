// defining express pre-requisities
var express = require('express');
var cors = require('cors');
var path = require('path'); 
var router = express.Router();
var register = require('../controller/registration');
var generateOtp = require('../controller/generate-otp');
var updateStatus = require('../controller/update-status');
var updateProfile = require('../controller/update-profile');
var profilePhoto = require('../controller/update-profile-picture');
var homeAddress = require('../controller/add-home-address');
var officeAddress = require('../controller/add-office-address');
var deleteUser = require('../controller/delete-user');
var addSkill = require('../controller/add-user-skill');
var viewSkill = require('../controller/view-skill');
var updateSkillById = require('../controller/update-skill');
var removeSkillById = require('../controller/delete-user-skill');
var login = require('../controller/login');
var app = express();

//Routes
router.use('/register',register);  

        /**
         * @swagger
         * /api/register:
         *   post:
         *     tags:
         *       - User
         *     description: Creates new user
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
router.use('/generateOtp',generateOtp);
router.use('/updateStatus',updateStatus);

        /**
         * @swagger
         * /api/update/status:
         *   post:
         *     tags:
         *       - updateStatus
         *     description: Updates status of registered user
         *     security:
         *       - ApiKeyAuth: []
         *     produces:
         *       - application/json
         *     parameters:
         *       - name: userObj
         *         in: body
         *         required: true
         *         schema:
         *           $ref: '#/definitions/updateStatus'
         *     responses:
         *       200:
         *         description: Successfully updated
         */
router.use('/login',login);

        /**
         * @swagger
         * /api/login:
         *   get:
         *     tags:
         *       - userLogin
         *     description: User login
         *     security:
         *       - ApiKeyAuth: []
         *     produces:
         *       - application/json
         *     parameters:
         *       - name: userObject
         *         in: params
         *         required: true
         *         schema:
         *           $ref: '#/definitions/login'
         *     responses:
         *       201:
         *         description: Successful login
         */

router.use('/updateProfile',updateProfile);

        /**
         * @swagger
         * /api/update/profile:
         *   post:
         *     tags:
         *       - Update user profile
         *     description: Updates user profile
         *     security:
         *       - ApiKeyAuth: []
         *     produces:
         *       - application/json
         *     parameters:
         *       - name: userObj
         *         in: body
         *         required: true
         *         schema:
         *           $ref: '#/definitions/updateProfile'
         *     responses:
         *       201:
         *         description: Successfully updated
         */
router.use('/deleteUser',deleteUser);

        /**
         * @swagger
         * /api/delete/user:
         *   delete:
         *     tags:
         *       - deleteUser
         *     description: Deletes existing user
         *     security:
         *       - ApiKeyAuth: []
         *     produces:
         *       - application/json
         *     parameters:
         *       - name: userObj
         *         in: body
         *         required: true
         *         schema:
         *           $ref: '#/definitions/deleteUser'
         *     responses:
         *       201:
         *         description: Successfully deleted
         */
router.use('/updatePhoto',profilePhoto);

        /**
         * @swagger
         * /api/update/photo:
         *   post:
         *     tags:
         *       - profilePhoto
         *     description: Updates user profile photo
         *     security:
         *       - ApiKeyAuth: []
         *     produces:
         *       - application/json
         *     parameters:
         *       - name: userObject  //to be clarified
         *         in: body
         *         required: true
         *         schema:
         *           $ref: '#/definitions/updatePhoto'
         *     responses:
         *       201:
         *         description: Successfully updated
         */
router.use('/addHomeAddress',homeAddress);
router.use('/addOfficeAddress',officeAddress);
router.use('/addSkill',addSkill);
router.use('/deleteSkill',removeSkillById);
router.use('/viewSkill',viewSkill);
router.use('/updateSkill',updateSkillById);


/**
 * @swagger
 * definitions:
 *   register:
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
/**
 * @swagger
 * definitions:
 *   login:
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
/**
 * @swagger
 * definitions:
 *   updateStatus:
 *     type: object
 *     required:
 *       - username
 *       - otp
 *     properties:
 *       username:
 *         type: string
 *       otp:
 *         type: string
 */
/**
 * @swagger
 * definitions:
 *   updateProfile:
 *     type: object
 *     required:
 *       - username
 *       - first_name
 *       - last_name
 *       - sex
 *       - DOB
 *       - work_area      
 *     properties:
 *       username:
 *         type: string
 *       first_name:
 *         type: string
 *       last_name:
 *         type: string
 *       sex:
 *         type: string
 *       DOB:
 *         type: string
 *       work_area
 *         type: string
 */

 // To be clarified
/**
 * @swagger
 * definitions:
 *   updatePhoto:
 *     type: file
 *     required:
 *       - username
 *       - password
 *     properties:
 *       username:
 *         type: string
 *       password:
 *         type: string
 */
/**
 * @swagger
 * definitions:
 *   deleteUser:
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

 module.exports = router;