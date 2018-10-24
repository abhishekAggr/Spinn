'use strict';

var utils = require('../utils/writer.js');
var UserProfile = require('../service/UserProfileService');

module.exports.uploadFile = function uploadFile (req, res, next) {
  var username = req.swagger.params['username'].value;
  var file = req.swagger.params['file'].value;
  UserProfile.uploadFile(username,file)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
